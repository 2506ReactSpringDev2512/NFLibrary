package com.nf.library.lend.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.nf.library.common.JDBCTemplate;
import com.nf.library.lend.model.dao.LendDAO;
import com.nf.library.lend.model.vo.Wishbook;

public class LendService {
	
	private	JDBCTemplate	jdbcTemplate;
	private LendDAO			lendDao;
	
	public	LendService() {
		jdbcTemplate	=	JDBCTemplate.getInstance();
		lendDao			=	new LendDAO();
	}
	
	public	List<Wishbook> selectList() {
		List<Wishbook> wList 	= null;
		try {
			Connection	conn 	= jdbcTemplate.getConnection();
			wList 				= lendDao.selectList(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return wList;
	}
	
	public	int				insertWishBook(Wishbook wishbook) {
		int	result				=	0;
		
		try {
			Connection	conn 	= jdbcTemplate.getConnection();
			result				= lendDao.insertWishBook(wishbook, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	public List<Wishbook> selectPagedList(int currentPage, int recordsPerPage) {
		Connection		conn = null;
		List<Wishbook> 	list = null;
		
		try {
		conn 				= 	jdbcTemplate.getConnection();
		LendDAO		lendDao	= 	new LendDAO();
		int			start	= 	(currentPage - 1) * recordsPerPage + 1;
		int			end		=	start + recordsPerPage - 1;
		list				=	lendDao.selectPagedList(conn, start, end);
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
		Connection	conn	=	null;
		int			count	=	0;
		try {
			conn			=	jdbcTemplate.getConnection();
			LendDAO	lendDao	=	new	LendDAO();
			count			=	lendDao.getWishbookCount(conn);
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
