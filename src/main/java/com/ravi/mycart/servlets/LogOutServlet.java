package com.ravi.mycart.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LogOutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession=request.getSession();
		httpSession.removeAttribute("current_user");
		httpSession.setAttribute("message", "Logged Out successfully..!");
		httpSession.setAttribute("msgStatus", "success");
		response.sendRedirect("login.jsp");
	}

}
