package com.example;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;




import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VoteServlet extends HttpServlet {

	public VoteServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ServletOutputStream out = resp.getOutputStream();

		String votes = "";
		String event=req.getParameter("event");
		String categoryList=req.getParameter("categories");
		String[] categories = categoryList.split(",");
		for(int i=0;i<categories.length;i++){
			votes+=req.getParameter(categories[i]);
		}
		
		
		out.println(req.getParameter("user")+"|"+event+"|"+votes);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		if(dispatcher != null) dispatcher.forward(req, resp);
		return;	*/	
	}
}
