package com.nf.library.lend.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.nf.library.lend.model.service.LendService;

@WebServlet("/wishbook/delete")
public class WishbookDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int wishbookNo = Integer.parseInt(request.getParameter("wishbookNo"));

        LendService service = new LendService();
        int result = service.deleteWishbook(wishbookNo);

        response.sendRedirect(request.getContextPath() + "/wishbook"); // 목록으로 리다이렉트
    }
}