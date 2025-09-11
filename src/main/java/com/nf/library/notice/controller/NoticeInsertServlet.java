package com.nf.library.notice.controller;

import java.io.IOException;

import com.nf.library.notice.model.service.NoticeService;
import com.nf.library.notice.model.vo.Notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/notice/insert")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeSubject = request.getParameter("noticeSubject");
		String noticeContent = request.getParameter("noticeContent");
		String noticeWriter = request.getParameter("noticeWriter");
		Notice notice = new Notice(noticeSubject, noticeContent, noticeWriter);
		NoticeService nService = new NoticeService();
		int result = nService.insertNotice(notice);
		notice.setNoticeSubject(noticeSubject);
		notice.setNoticeContent(noticeContent);
		notice.setNoticeWriter(noticeWriter);
	    if(result > 0) {
	        response.sendRedirect("/notice/list");
	    } else {
	        request.setAttribute("errorMsg", "공지사항 등록 실패, 다시 작성해주세요");
	        request.getRequestDispatcher("/WEB-INF/views/common/error.jsp")
	        .forward(request, response);
	    }
	}

}
