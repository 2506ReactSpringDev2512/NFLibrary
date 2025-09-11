package com.nf.library.notice.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.nf.library.common.JDBCTemplate;
import com.nf.library.notice.model.dao.NoticeDAO;
import com.nf.library.notice.model.vo.Notice;

public class NoticeService {
	private JDBCTemplate jdbcTemplate;
	private NoticeDAO nDao;
	
	public NoticeService() {
		jdbcTemplate = JDBCTemplate.getInstance();
		nDao = new NoticeDAO();
	}
	
	public List<Notice> noticeList(){
		List<Notice> noticeList = null;
		Connection conn = jdbcTemplate.getConnection();
		try {
			noticeList = nDao.noticeList(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noticeList;
	}
	
	public int noticeRegist(Notice notice) {
		int result = 0;
		Connection conn = jdbcTemplate.getConnection();
		try {
			result = nDao.noticeRegist(notice, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}

	public Notice selectOneByNo(int i) {
		Notice notice = null;
		Connection conn = jdbcTemplate.getConnection();
		try {
			notice = nDao.selectOneByNo(i, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notice;
	}
	
	public List<Notice> searchKeyword(String keyword) {
		List<Notice> noticeList = null;
		Connection conn = jdbcTemplate.getConnection();
		try {
			noticeList = nDao.searchKeyword(keyword, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noticeList;
	}
	

	public int insertNotice(Notice notice) {
		int result = 0;
		Connection conn = jdbcTemplate.getConnection();
		try {
			result = nDao.insertNotice(notice, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteNotice(int noticeNo) {
		int result = 0;
		Connection conn = jdbcTemplate.getConnection();
		try {
			result = nDao.deleteNotice(noticeNo, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
	
}
