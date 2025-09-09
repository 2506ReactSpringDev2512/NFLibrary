package com.nf.library.lend.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.nf.library.lend.model.service.LendService;
import com.nf.library.lend.model.vo.Wishbook;

@WebServlet("/addwishbook")
public class AddWishbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddWishbookServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/loan/addwishbook.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String		wishbook_name		=	request.getParameter("wishbook_name");
		String		wishbook_author		=	request.getParameter("wishbook_author");
		String		wishbook_publisher	=	request.getParameter("wishbook_publisher");
		String		wishbook_status		=	request.getParameter("wishbook_status");
		String		name				=	request.getParameter("name");
		
		Wishbook	wishbook			=	new Wishbook(	wishbook_name, wishbook_author,
															wishbook_publisher, wishbook_status, name );
		LendService	lendService			=	new	LendService();
		int			result				=	lendService.insertWishBook(wishbook);
		
		System.out.println(wishbook.toString());
		
		if(result > 0) {
			System.out.println("데이터 입력이 완료되었습니다.");
			response.sendRedirect("/wishbook");
		}
		else {
			System.out.println("데이터 입력에 실패했습니다.");
			request.setAttribute("errorMsg", "희망 도서 추가에 문제가 생겼습니다.");
			request.getRequestDispatcher("/error").forward(request, response);
		}
	}
}
