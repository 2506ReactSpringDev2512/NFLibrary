package com.nf.library.member.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nf.library.common.JDBCTemplate;
import com.nf.library.lend.model.vo.Wishbook;
import com.nf.library.member.model.vo.Book;
import com.nf.library.member.model.vo.LendInfo;
import com.nf.library.member.model.vo.Member;

public class MemberDAO {

	public Member checkLogin(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member mOne = null;
		String query = "SELECT * FROM MEMBER_TBL WHERE MEMBER_ID = ? AND MEMBER_PW = ?";
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getMemberPw());
		rset = pstmt.executeQuery();
		if(rset.next()) {
			mOne = rsetToMember(rset);
		}
		rset.close();
		pstmt.close();
		conn.close();
		return mOne;
	}
	
	private Member rsetToMember(ResultSet rset) throws SQLException {
		String memberId   = rset.getString("MEMBER_ID");
		String memberPw  = rset.getString("MEMBER_PW");
		String memberName = rset.getString("MEMBER_NAME");
		String phone	  = rset.getString("MEMBER_PHONE");
		String gender	  = rset.getString("MEMBER_GENDER");
		int age			  = rset.getInt("MEMBER_AGE");
		String checkAd    = rset.getString("ADMIN_YN");
		Member member = new Member(memberId, memberPw, memberName, phone, gender, age, checkAd);
		return member;
	}

	public int insertMember(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO MEMBER_TBL(MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE) VALUES(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getMemberPw());
		pstmt.setString(3, member.getMemberName());
		pstmt.setString(4, member.getPhone());
		pstmt.setString(5, member.getGender());
		pstmt.setInt(6, member.getAge());
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}

	public int deleteMember(String memberId, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM MEMBER_TBL WHERE MEMBER_ID = ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, memberId);
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}
	
	public List<LendInfo> selectLendListByMember(String memberId) {
		List<LendInfo>	list	= new ArrayList<>();
        String 			query 	= "SELECT l.BOOK_NO, l.LEND_DATE, l.RETURN_DATE, "
                   				+ "b.BOOK_NAME, b.BOOK_AUTHOR, b.BOOK_PUBLISHER, b.LEND_YN "
                   				+ "FROM LENDINFO_TBL l "
                   				+ "JOIN BOOK_TBL b ON l.BOOK_NO = b.BOOK_NO "
                   				+ "WHERE l.M_ID = ?";
        
        try (	Connection conn = JDBCTemplate.getInstance().getConnection();
                PreparedStatement 	pstmt 	= conn.prepareStatement(query)) {

               pstmt.setString(1, memberId);
               ResultSet rs = pstmt.executeQuery();

               while (rs.next()) {
            	   System.out.println("memberId: " + memberId);
                   LendInfo lend = new LendInfo();
                   Book book = new Book();

                   book.setBookNo(rs.getString("BOOK_NO"));
                   book.setBookName(rs.getString("BOOK_NAME"));
                   book.setBookAuthor(rs.getString("BOOK_AUTHOR"));
                   book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
                   book.setLendYn(rs.getString("LEND_YN"));

                   lend.setBookNo(book.getBookNo());
                   lend.setLendDate(rs.getDate("LEND_DATE"));
                   lend.setReturnDate(rs.getDate("RETURN_DATE"));
                   lend.setBook(book);
                   lend.setMemberId(memberId);

                   // 연체 여부
                   Date now = new Date(System.currentTimeMillis());
                   lend.setOverdue(rs.getDate("RETURN_DATE").before(now));

                   list.add(lend);
               }

           } catch (Exception e) {
               e.printStackTrace();
           }

           return list;
	}

	public boolean extendLoan(String bookNo, String memberId) {
		String sql = "UPDATE LENDINFO_TBL SET RETURN_DATE = RETURN_DATE + 7 "
                + "WHERE BOOK_NO = ? AND M_ID = ? "
                + "AND RETURN_DATE >= SYSDATE"; // 연장 제한

     try (Connection conn = JDBCTemplate.getInstance().getConnection();
          PreparedStatement pstmt = conn.prepareStatement(sql)) {

         pstmt.setString(1, bookNo);
         pstmt.setString(2, memberId);
         return pstmt.executeUpdate() > 0;

     } catch (Exception e) {
         e.printStackTrace();
         return false;
     }
	}

	public boolean returnBook(String bookNo, String memberId) {
		 try (Connection conn = JDBCTemplate.getInstance().getConnection();) {
	            conn.setAutoCommit(false);

	            String deleteSql = "DELETE FROM LENDINFO_TBL WHERE BOOK_NO = ? AND M_ID = ?";
	            try (PreparedStatement ps1 = conn.prepareStatement(deleteSql)) {
	                ps1.setString(1, bookNo);
	                ps1.setString(2, memberId);
	                ps1.executeUpdate();
	            }

	            String updateSql = "UPDATE BOOK_TBL SET LEND_YN = 'Y' WHERE BOOK_NO = ?";
	            try (PreparedStatement ps2 = conn.prepareStatement(updateSql)) {
	                ps2.setString(1, bookNo);
	                ps2.executeUpdate();
	            }

	            conn.commit();
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	public List<Wishbook> selectPagedList(Connection conn, int start, int end) throws SQLException {
		PreparedStatement	pstmt		=	null;
		ResultSet			rset		=	null;
		List<Wishbook>		list		=	new	ArrayList<>();
		String				query		=	"SELECT * FROM (" +
		                					"  SELECT ROWNUM rnum, W.* FROM (" +
		                					"    SELECT * FROM WISHBOOK_TBL ORDER BY WISHBOOK_NO" +
		                					"  ) W" +
		                					") WHERE rnum BETWEEN ? AND ?";
		
		pstmt	=	conn.prepareStatement(query);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		rset	=	pstmt.executeQuery();
		
		while(rset.next()) {
	        Wishbook wishbook = new Wishbook();
	        wishbook.setWishbook_no(rset.getInt("WISHBOOK_NO"));
	        wishbook.setWishbook_name(rset.getString("WISHBOOK_NAME"));
	        wishbook.setWishbook_author(rset.getString("WISHBOOK_AUTHOR"));
	        wishbook.setWishbook_publisher(rset.getString("WISHBOOK_PUBLISHER"));
	        wishbook.setWishbook_status(rset.getString("WISHBOOK_STATUS"));

	        list.add(wishbook);
	    }

	    rset.close();
	    pstmt.close();

	    return list;
	}

	public List<Wishbook> selectList(Connection conn, String memberId) throws SQLException {
		PreparedStatement 	pstmt 		= null;
		ResultSet			rset 		= null;
		String				query 		= "SELECT w.* FROM WISHBOOK_TBL w JOIN MEMBER_TBL m ON w.MEMBER_NAME = m.MEMBER_NAME WHERE m.MEMBER_ID = ? ORDER BY w.WISHBOOK_NO DESC";
		
		pstmt 	= conn.prepareStatement(query);
		pstmt.setString(1, memberId);
		rset	= pstmt.executeQuery();
		
		List<Wishbook> 		wList		= new ArrayList<Wishbook>();
		
		while(rset.next()) {
			Wishbook 		wishbook	= new Wishbook();
			wishbook.setWishbook_no(rset.getInt("WISHBOOK_NO"));
			wishbook.setWishbook_name(rset.getString("WISHBOOK_NAME"));
			wishbook.setWishbook_author(rset.getString("WISHBOOK_AUTHOR"));
			wishbook.setWishbook_publisher(rset.getString("WISHBOOK_PUBLISHER"));
			wishbook.setWishbook_status(rset.getString("WISHBOOK_STATUS"));
			
			wList.add(wishbook);
		}
		return wList;
	}

	public int getWishbookCount(Connection conn) throws SQLException {
		 PreparedStatement 	pstmt 	= null;
		 ResultSet 			rset 	= null;
		 String 			query = "SELECT COUNT(*) AS COUNT FROM WISHBOOK_TBL";
		 int 				count = 0;

		 pstmt 	= conn.prepareStatement(query);
		 rset 	= pstmt.executeQuery();
		 if(rset.next()) {
		     count = rset.getInt("COUNT");
		 }

		 rset.close();
		 pstmt.close();

		 return count;
	}
}


