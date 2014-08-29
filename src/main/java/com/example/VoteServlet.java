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

		StringBuilder votes = new StringBuilder();
		
		
		BufferedReader reader = new BufferedReader(new FileReader(
				"src/main/webapp/Participants.txt"));
		StringBuilder sb = new StringBuilder();
		String line;
		String category="";
		
		while ((line = reader.readLine()) != null) {
			category = line.substring(0,line.indexOf(','));
			out.print(category);
		}
		
		int noOfCategories=10;
		for(int i=0;i<noOfCategories;i++){
			String ans = req.getParameter("Category"+1);
		}
		
		
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		if(dispatcher != null) dispatcher.forward(req, resp);
		return;	*/	
	}
}
