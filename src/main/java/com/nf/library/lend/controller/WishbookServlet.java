package com.nf.library.lend.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.nf.library.lend.model.service.LendService;
import com.nf.library.lend.model.vo.Wishbook;

@WebServlet("/wishbook")
public class WishbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public WishbookServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LendService		lService	=	new LendService();
		// 페이지네이션 처리
		int				currentPage	=	1;
		String			pageParam	=	request.getParameter("page");
		if(pageParam != null) {
			try {
				currentPage = Integer.parseInt(pageParam);
				if(currentPage < 1) {
					currentPage = 1;
				}
			} 
			catch (NumberFormatException e) {
				currentPage = 1;
			}
		}	
		int			recordsPerPage	=	10;	
		List<Wishbook>	WList		=	lService.selectPagedList(currentPage, recordsPerPage);
		int			totalRecords	=	lService.getWishbookCount();
		int			totalPages		=	(int) Math.ceil((double) totalRecords / recordsPerPage );
		request.setAttribute("WList", WList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPages", totalPages);	
		
		// 게시글 보여주기
		List<Wishbook>	wList		=	lService.selectList();	
		if(wList.size() > 0) {
			request.setAttribute("count", wList.size());
			request.setAttribute("wList", wList);
			request.getRequestDispatcher("/WEB-INF/views/loan/wishbook.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/WEB-INF/views/loan/wishbook.jsp").forward(request, response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
