package com.nf.library.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.nf.library.member.model.dao.MemberDAO;
import com.nf.library.member.model.vo.Member;
import com.nf.library.common.JDBCTemplate;

public class MemberService {
	private JDBCTemplate jdbcTemplate;
	private MemberDAO mDao;
	
	public MemberService() {
		jdbcTemplate = JDBCTemplate.getInstance();
		mDao = new MemberDAO();
	}
	
	public Member checkLogin(Member member) {
		Member mOne = null;
		try {
			Connection conn = jdbcTemplate.getConnection();
			mOne = mDao.checkLogin(member, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mOne;
	} 
	
	public int insertMember(Member member) {
		int result = 0;
		try {
			Connection conn = jdbcTemplate.getConnection();
			result = mDao.insertMember(member, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
