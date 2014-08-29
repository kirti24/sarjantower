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

		BufferedReader reader = new BufferedReader(new FileReader("src/main/webapp/Participants.txt"));
		StringBuilder votes = new StringBuilder();
		Vector<String> categories = new Vector();
		String line;
		
		int noOfCategories=0;
		
		while ((line = reader.readLine()) != null) {
			noOfCategories++;
			String[] fields = line.split(",");
			for(int i=0;i<fields.length;i++){
				String categoryValue="";
				if(i==0){
					categories.add(fields[i]);
					categoryValue = req.getParameter(fields[0]);
				}
				if(i>0){
					if(categoryValue.equals(fields[i])){
						votes.append(fields[i]+",");
					}else{
						votes.append("0,");
					}
				}
			}
		}
		out.write(votes.toString().getBytes());

		//String username = req.getParameter("username");
		//String password = req.getParameter("password");
		//out.write((username+password).getBytes());


	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		if(dispatcher != null) dispatcher.forward(req, resp);
		return;		
	}
}
