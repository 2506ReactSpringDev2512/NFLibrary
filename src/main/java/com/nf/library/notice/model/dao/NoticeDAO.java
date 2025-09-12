package com.nf.library.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.nf.library.notice.model.vo.Notice;

public class NoticeDAO {
	public int noticeRegist(Notice notice, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO NOTICE_TBL VALUES(NOTICE_SEQ.NEXTVAL,?,?,?,DEFAULT, DEFAULT, NULL)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, notice.getNoticeSubject());
		pstmt.setString(2, notice.getNoticeContent());
		pstmt.setString(3, notice.getNoticeWriter());
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}
	
	public List<Notice> noticeList(Connection conn) throws SQLException{
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM NOTICE_TBL ORDER BY NOTICE_NO DESC";
		pstmt = conn.prepareStatement(query);
		rset = pstmt.executeQuery();
		List<Notice> noticeList = new ArrayList<Notice>();
		while(rset.next()) {
			Notice notice = new Notice();
			notice.setNoticeNo(rset.getString("NOTICE_NO"));
			notice.setNoticeSubject(rset.getString("NOTICE_SUBJECT"));
			notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
			notice.setNoticeWriter(rset.getString("NOTICE_WRITER"));
			notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
			notice.setViewCount(rset.getString("VIEW_COUNT"));
			noticeList.add(notice);
		}
		rset.close();
		conn.close();
		pstmt.close();
		return noticeList;
		
	}

	public Notice selectOneByNo(int i, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice notice = null;
		String query = "SELECT * FROM NOTICE_TBL WHERE NOTICE_NO = ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, i);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			notice = new Notice();
			notice.setNoticeNo(rset.getString("NOTICE_NO"));
			notice.setNoticeSubject(rset.getString("NOTICE_SUBJECT"));
			notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
			notice.setNoticeWriter(rset.getString("NOTICE_WRITER"));
			notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
			notice.setViewCount(rset.getString("VIEW_COUNT"));
			notice.setNoticeImg(rset.getString("NOTICE_IMG"));
		}
		rset.close();
		conn.close();
		pstmt.close();
		return notice;
	}
	
	public List<Notice> searchKeyword(String keyword, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM NOTICE_TBL WHERE NOTICE_SUBJECT LIKE '%'||?||'%' ORDER BY NOTICE_NO ASC";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, keyword);
		rset = pstmt.executeQuery();
		List<Notice> noticeList = new ArrayList<Notice>();
		while(rset.next()) {
			Notice notice = new Notice();
			notice.setNoticeNo(rset.getString("NOTICE_NO"));
			notice.setNoticeSubject(rset.getString("NOTICE_SUBJECT"));
			notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
			notice.setNoticeWriter(rset.getString("NOTICE_WRITER"));
			notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
			notice.setViewCount(rset.getString("VIEW_COUNT"));
			noticeList.add(notice);
		}
		rset.close();
		conn.close();
		return noticeList;
	}
	
	public int insertNotice(Notice notice, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		Notice nOne = null;
		String query = "INSERT INTO NOTICE_TBL "
				+ "(NOTICE_NO, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_WRITER) "
				+ "VALUES (NOTICE_SEQ.NEXTVAL, ?, ?, 'admin')";
		pstmt  = conn.prepareStatement(query);
		pstmt.setString(1, notice.getNoticeSubject());
		pstmt.setString(2, notice.getNoticeContent());
		int result = pstmt.executeUpdate();
		conn.close();
		pstmt.close();
		return result;
	}

	public int deleteNotice(int noticeNo, Connection conn) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE FROM NOTICE_TBL WHERE NOTICE_NO = ?";
		pstmt = conn.prepareStatement(query); // 실행준비
		pstmt.setInt(1, noticeNo);
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}

}
