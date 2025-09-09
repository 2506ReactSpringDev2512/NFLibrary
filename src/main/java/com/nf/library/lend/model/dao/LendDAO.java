package com.nf.library.lend.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nf.library.lend.model.vo.Wishbook;

public class LendDAO {

	public List<Wishbook> selectList(Connection conn) throws SQLException {
		PreparedStatement 	pstmt 		= null;
		ResultSet			rset 		= null;
		String				query 		= "SELECT * FROM WISHBOOK_TBL ORDER BY WISHBOOK_NO DESC";
		
		pstmt 	= conn.prepareStatement(query);
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

	public int insertWishBook(Wishbook wishbook, Connection conn) throws SQLException {
		PreparedStatement	pstmt		= null;
		int					result		= 0;
		String				query		= "INSERT INTO WISHBOOK_TBL VALUES(wishbook_seq.NEXTVAL, ?, ?, ?, DEFAULT, ?)";
		
		pstmt	=	conn.prepareStatement(query);
		pstmt.setString(1, wishbook.getWishbook_name());
		pstmt.setString(2, wishbook.getWishbook_author());
		pstmt.setString(3, wishbook.getWishbook_publisher());
		pstmt.setString(4, "테스트");
		result	=	pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
		

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
