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

public class AddExpenseServlet extends HttpServlet {

	public AddExpenseServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ServletOutputStream out = resp.getOutputStream();

		String item = req.getParameter("item");
		String amtString = req.getParameter("amount");
		double amount = 0; 
		if(amtString!=null & !amtString.equalsIgnoreCase("")){
			amount = Double.parseDouble(amtString);
		}
		String paidby = req.getParameter("paidby");
		String category = req.getParameter("category");
		
		out.println(item+"|"+amount+"|"+paidby+"|"+category);
		DBConnect.addExpense(category, item, amount, paidby);
		ArrayList<ExpenseList> expenselist = DBConnect.getExpense();
		
		out.println(expenselist.toString());
		/*RequestDispatcher dispatcher = req.getRequestDispatcher("/expense.jsp");
		if(dispatcher != null) dispatcher.forward(req, resp);
		return;*/
		
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		if(dispatcher != null) dispatcher.forward(req, resp);
		return;	*/	
	}
}
