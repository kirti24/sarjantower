package com.example;

import java.io.IOException;




import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

	public LoginServlet() {
        super();
    }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try{
			ServletOutputStream out = resp.getOutputStream();
			
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			out.write((username+password).getBytes());
			boolean returnArray[] = DBConnect.loginCheck(username,password);
			boolean isValid = returnArray[0];
			boolean isValidated = returnArray[1];
			if(!isValid){
				RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
				req.setAttribute("errormessage", "Invalid Username/Password. Try again.");
				req.getSession(false).invalidate();
				if(dispatcher != null) dispatcher.forward(req, resp);
			}else{
				//DBConnect.sessionCreate(username, req.getSession(false).getId());
				RequestDispatcher dispatcher = req.getRequestDispatcher("/dashboard.jsp");
				req.setAttribute("verified", "true");
				req.setAttribute("user", username);
				HttpSession session = req.getSession(false);			
				session.setAttribute("isAuthorised", "true");
				session.setAttribute("user", username);
				if (!isValidated)
					session.setAttribute("validated", "false");
				else 
					session.setAttribute("validated", "true");
				
				System.out.println("Setting attribute isauth for session " + session.getId());
				if(dispatcher != null) dispatcher.forward(req, resp);
				return;
			}
		}catch(Exception e){
			RequestDispatcher dispatcher = req.getRequestDispatcher("/error.jsp");
			if(dispatcher != null) dispatcher.forward(req, resp);
			return;
		}

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);		
	}
}
