package com.example;

import java.io.IOException;




import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HelloServlet extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ServletOutputStream out = resp.getOutputStream();
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		out.write((username+password).getBytes());
		boolean isValid = DBConnect.loginCheck(username,password);
		
		if(!isValid){
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/login.jsp");
			req.setAttribute("errormessage", "Invalid Username/Password. Try again.");
			req.getSession(false).invalidate();
			if(dispatcher != null) dispatcher.forward(req, resp);
		}else{
			//DBConnect.sessionCreate(username, req.getSession(false).getId());
			RequestDispatcher dispatcher = req.getRequestDispatcher("/index1.jsp");
			req.setAttribute("verified", "true");						
			HttpSession session = req.getSession(false);			
			session.setAttribute("isAuthorised", "true");
			session.setAttribute("user", username.toUpperCase());
			System.out.println("Setting attribute isauth for session " + session.getId());
			if(dispatcher != null) dispatcher.forward(req, resp);
			return;
		}

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);		
	}
}
