package com.nf.library.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.nf.library.lend.model.service.LendService;
import com.nf.library.lend.model.vo.Wishbook;
import com.nf.library.member.model.service.MemberService;

/**
 * Servlet implementation class MyWishBookServlet
 */
@WebServlet("/member/wishbook")
public class MyWishBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyWishBookServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("memberId") == null) {
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('로그인이 필요합니다.');");
	        out.println("location.href='" + request.getContextPath() + "/member/login';");
	        out.println("</script>");
	        return; // 더 이상 아래 코드 실행하지 않음
	    }
		String memberId = (String) session.getAttribute("memberId");
		
		
		MemberService		lService	=	new MemberService();
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
		List<Wishbook> wList = lService.selectList(memberId);
		if(wList != null) {
			System.out.println("WishbookServlet 호출됨");
			request.setAttribute("count", wList.size());
			request.setAttribute("wList", wList);
			request.getRequestDispatcher("/WEB-INF/views/member/mywishbook.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/WEB-INF/views/member/mywishbook.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
