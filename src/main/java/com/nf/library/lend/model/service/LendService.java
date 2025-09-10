package com.nf.library.lend.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.nf.library.common.JDBCTemplate;
import com.nf.library.lend.model.dao.LendDAO;
import com.nf.library.lend.model.vo.Lend;
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

	public int updateLendStatus(String book_no) {
	    Connection conn = null;
	    int result = 0;
	    try {
	        conn = jdbcTemplate.getConnection();
	        conn.setAutoCommit(false); // 여기서 autoCommit 끄기
	        result = lendDao.updateLendStatus(conn, book_no);
	        if (result > 0) {
	            jdbcTemplate.commit(conn);
	        } else {
	            jdbcTemplate.rollback(conn);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        if (conn != null) {
	            jdbcTemplate.rollback(conn);
	        }
	    } finally {
	        if (conn != null) {
	            jdbcTemplate.close(conn);
	        }
	    }
	    return result;
	}

	public int insertLendInfo(String memberId, String book_no) {
	    Connection conn = jdbcTemplate.getConnection();
	    int result = 0;

	    try {
	        conn.setAutoCommit(false); // autoCommit 끄기
	        result = lendDao.insertLendInfo(conn, memberId, book_no);
	        if (result > 0) {
	            jdbcTemplate.commit(conn);
	        } else {
	            jdbcTemplate.rollback(conn);
	        }
	    } catch (SQLException e) {
	        jdbcTemplate.rollback(conn);
	        e.printStackTrace();
	    } finally {
	        jdbcTemplate.close(conn);
	    }

	    return result;
	}


	public List<Lend> selectLendList() {
		Connection	conn	=	null;
		List<Lend>	list	=	null;
		
		try {
			conn	=	jdbcTemplate.getConnection();
			list	=	lendDao.selectLendList(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {}
			}
		}
		
		return list;
	}

	public List<Lend> searchBooks(String keyword) {
		Connection	conn	=	null;
		List<Lend>	list	=	null;
		
		try {
			conn	=	jdbcTemplate.getConnection();
			list	=	lendDao.searchbooks(conn, keyword);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(conn);
		}
		return list;
	}
	

}
