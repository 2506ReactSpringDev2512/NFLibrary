package com.nf.library.book.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.nf.library.book.model.dao.BookDAO;
import com.nf.library.book.model.vo.Book;
import com.nf.library.common.JDBCTemplate;

public class BookService {
	private JDBCTemplate jdbcTemplate;
	private BookDAO bDao;
	
	public BookService() {
		jdbcTemplate = JDBCTemplate.getInstance();
		bDao = new BookDAO();
	}
	
	public List<Book> bookList(String searchBook){
		List<Book> bList = null;
		Connection conn = jdbcTemplate.getConnection();
		try {
			bList = bDao.bookList(searchBook, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bList;
	}
}
