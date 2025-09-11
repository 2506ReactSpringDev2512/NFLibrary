package com.nf.library.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.nf.library.member.model.dao.MemberDAO;
import com.nf.library.member.model.vo.Member;
import com.nf.library.common.JDBCTemplate;
import com.nf.library.lend.model.dao.LendDAO;
import com.nf.library.lend.model.vo.Wishbook;

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

	public int deleteMember(String memberId) {
		int result = 0;
		try {
			Connection conn = jdbcTemplate.getConnection();
			result = mDao.deleteMember(memberId, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public	List<Wishbook> selectList(String memberId) {
		List<Wishbook> wList 	= null;
		try {
			Connection	conn 	= jdbcTemplate.getConnection();
			wList 				= mDao.selectList(conn, memberId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return wList;
	}

	public List<Wishbook> selectPagedList(int currentPage, int recordsPerPage) {
		Connection		conn = null;
		List<Wishbook> 	list = null;
		
		try {
		conn 				= 	jdbcTemplate.getConnection();
		MemberDAO	mDao	= 	new MemberDAO();
		int			start	= 	(currentPage - 1) * recordsPerPage + 1;
		int			end		=	start + recordsPerPage - 1;
		list				=	mDao.selectPagedList(conn, start, end);
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			if(conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {}
			}
		}
		
		return list;
	}

	public int getWishbookCount() {
		Connection	conn		=	null;
		int			count		=	0;
		try {
			conn				=	jdbcTemplate.getConnection();
			MemberDAO	mDao	=	new	MemberDAO();
			count				=	mDao.getWishbookCount(conn);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if(conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {}
			}
		}
		return count;
	}
}
