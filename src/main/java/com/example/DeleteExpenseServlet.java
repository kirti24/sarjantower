package com.example;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteExpenseServlet extends HttpServlet {

	public AddExpenseServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ServletOutputStream out = resp.getOutputStream();

		int expenseid = (int)req.getParameter("expenseid");
		
		out.println(expenseid);
		if (expenseid>0){
			
//			DBConnect.addExpense(category, item, amount, paidby);
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/expense.jsp");
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
