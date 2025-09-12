package com.nf.library.book.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.nf.library.book.model.vo.Book;

public class BookDAO {

	public List<Book> bookList(String searchBook, Connection conn) throws SQLException {
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM BOOK_TBL WHERE BOOK_NAME LIKE '%'||?||'%' ORDER BY BOOK_NO";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, searchBook);
		rset = pstmt.executeQuery();
		List<Book> bList = new ArrayList<Book>();
		while(rset.next()) {
			Book book = new Book();
			book.setBookNo(rset.getString("BOOK_NO"));
			book.setBookName(rset.getString("BOOK_NAME"));
			book.setBookAuthor(rset.getString("BOOK_PUBLISHER"));
			book.setLendYN(rset.getString("LEND_YN"));
			book.setBookImg(rset.getString("BOOK_IMG"));
			bList.add(book);
		}
		rset.close();
		conn.close();
		return bList;
	}

}
