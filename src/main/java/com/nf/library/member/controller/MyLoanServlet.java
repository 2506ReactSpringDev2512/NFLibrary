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

import com.nf.library.member.model.dao.MemberDAO;
import com.nf.library.member.model.vo.LendInfo;
import com.nf.library.member.model.vo.Member;

@WebServlet("/member/loan")
public class MyLoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MyLoanServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비로그인 접근 막기
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("memberId") == null) {
		    response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    out.println("<script>");
		    out.println("alert('로그인이 필요합니다.');");
		    out.println("location.href='" + request.getContextPath() + "/member/login';");
		    out.println("</script>");
		    return;
		}

		String loginUser = (String) session.getAttribute("memberId");
		List<LendInfo> lendList = new MemberDAO().selectLendListByMember(loginUser);

		request.setAttribute("lendList", lendList);
		request.getRequestDispatcher("/WEB-INF/views/member/myloan.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
