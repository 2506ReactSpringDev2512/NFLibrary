package com.nf.library.lend.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.nf.library.lend.model.service.LendService;
import com.nf.library.lend.model.vo.Lend;

@WebServlet("/loan/list")
public class LoanStartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public LoanStartServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String book_no = request.getParameter("book_no");
        String keyword = request.getParameter("keyword");
        LendService lendService = new LendService();

        // 1. book_no가 있는 경우 → 대출 처리
        if (book_no != null && !book_no.trim().isEmpty()) {
            HttpSession session = request.getSession();
            String memberId = (String) session.getAttribute("memberId");

            int updateresult = lendService.updateLendStatus(book_no);
            int insertresult = lendService.insertLendInfo(memberId, book_no);

            if (updateresult > 0 && insertresult > 0) {
                response.sendRedirect(request.getContextPath() + "/loan/list");
            } else {
                System.out.println("book_no = " + book_no);
                System.out.println("memberId = " + memberId);
                System.out.println("updateResult = " + updateresult);
                System.out.println("insertResult = " + insertresult);
                request.setAttribute("errorMsg", "도서 대출 요청에 문제가 생겼습니다.");
                request.getRequestDispatcher("/error").forward(request, response);
            }
            return; // 대출 처리했으면 검색 or 목록 조회는 실행 안 함
        }

        // 2. book_no가 없으면 → 검색 또는 전체 목록 조회
        List<Lend> bookList;
        if (keyword != null && !keyword.trim().isEmpty()) {
            bookList = lendService.searchBooks(keyword.trim());  // 검색 메서드 필요
        } else {
            bookList = lendService.selectLendList(); // 전체 조회
        }

        request.setAttribute("bookList", bookList);
        request.setAttribute("keyword", keyword); // jsp에서 검색창에 키워드 유지
        request.getRequestDispatcher("/WEB-INF/views/loan/loanstart.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
