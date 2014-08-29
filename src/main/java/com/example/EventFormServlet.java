package com.example;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EventFormServlet extends HttpServlet {

	public EventFormServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ServletOutputStream out = resp.getOutputStream();

		String eventname = req.getParameter("eventname");
		req.setAttribute("event", eventname);
		req.setAttribute("user", req.getAttribute("user"));
		RequestDispatcher dispatcher = req.getRequestDispatcher("/event.jsp");
		req.setAttribute("voteStatus", "true");
		if(dispatcher != null) dispatcher.forward(req, resp);
		return;
		
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		if(dispatcher != null) dispatcher.forward(req, resp);
		return;	*/	
	}
}
