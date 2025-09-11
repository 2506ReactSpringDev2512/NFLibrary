package com.nf.library.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
