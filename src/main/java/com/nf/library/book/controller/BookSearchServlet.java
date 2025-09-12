package com.nf.library.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.nf.library.book.model.service.BookService;
import com.nf.library.book.model.vo.Book;

/**
 * Servlet implementation class BookListservlet
 */
@WebServlet("/book/search")
public class BookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public BookSearchServlet() {
        // TODO Auto-generated constructor stub
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchBook = request.getParameter("searchBook");
		BookService bService = new BookService();
		List<Book> bList = bService.bookList(searchBook);
		if(bList != null) {
			request.setAttribute("bList", bList);// bList를 search.jsp에서 쓰려고 하는 코드
			request.setAttribute("searchBook", searchBook);// searchBook을 search.jsp에서 쓰려고 하는 코드
			request.getRequestDispatcher("/WEB-INF/views/loan/search.jsp")
			.forward(request, response);
		}
		else {
			request.setAttribute("errorMsg", "데이터가 존재하지 않습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp")
			.forward(request, response);
		}
	}

}
