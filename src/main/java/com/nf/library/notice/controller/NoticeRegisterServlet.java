package com.nf.library.notice.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.nf.library.notice.service.NoticeService;
import com.nf.library.notice.vo.Notice;

/**
 * Servlet implementation class NoticeRegisterServlet
 */
@WebServlet("/notice/regist")
public class NoticeRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/notice/noticeRegist.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeSubject = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		String noticeWriter = "admin";
		Notice notice = new Notice(noticeSubject, noticeContent, noticeWriter);
		NoticeService nService = new NoticeService();
		int result = nService.noticeRegist(notice);
		if(result>0) {
			response.sendRedirect("/notice/list");
		}
		else {
			request.setAttribute("errorMsg", "등록이 완료되지 않았습니다");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp")
			.forward(request, response);
		}
	}

}
