package com.nf.library.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.nf.library.member.model.dao.MemberDAO;
import com.nf.library.member.model.vo.Member;

/**
 * Servlet implementation class MyLoanReturnServlet
 */
@WebServlet("/member/loan/return")
public class MyLoanReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyLoanReturnServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookNo = request.getParameter("bookNo");
		String memberId = (String) request.getSession().getAttribute("memberId");
		boolean result = new MemberDAO().returnBook(bookNo, memberId);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (result) {
			out.println("<script>alert('반납되었습니다.'); location.href='" + request.getContextPath() + "/member/loan';</script>");
		} else {
			out.println("<script>alert('반납에 실패했습니다.'); location.href='" + request.getContextPath() + "/member/loan';</script>");
		}
	}

}
