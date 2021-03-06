<!DOCTYPE HTML>
<%@page import="javax.swing.text.Document"%>
<%@page import="com.example.ExpenseList"%>
<%@page import="com.example.DBConnect"%>
<%@page import="com.example.FlatVotes"%>
<%@page import="java.util.ArrayList"%>
<%@page session="false"%>
<%@page errorPage="error.jsp" isErrorPage="false"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sarjan Tower | Ganpati Festival 2015</title>

<!--  <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" /> -->
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css" />

<!-- Loading Bootstrap -->
<link href="dist/css/vendor/bootstrap.min.css" rel="stylesheet">

<!-- Loading Flat UI -->
<link href="dist/css/flat-ui.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body id="body">

	<%
		if (request.getSession(false) == null) {
			request.getSession().invalidate();
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/index.jsp");
			if (dispatcher != null) {
				dispatcher.forward(request, response);
				return;
			}
		}

		if (!request.getSession(false).getAttribute("user").toString()
				.equalsIgnoreCase("admin")) {
			request.getSession().invalidate();
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/index.jsp");
			if (dispatcher != null) {
				dispatcher.forward(request, response);
				return;
			}
		}
	%>

	<br />
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<%if(request.getAttribute("errormessage") != null){%>
			<label class="alert alert-error"><%=request.getAttribute("errormessage")%></label>
		<%}%>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<td class="col-md-2">Item Description</td>
					<td class="col-md-2">Amount</td>
					<td class="col-md-2">Paid By</td>
					<td class="col-md-2">Category</td>
					<td colspan="2">Updated On</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<form method="post" action="addexpense" id="expenseform">
					<td><input class="col-md-10" type="text" id="item" name="item" /></td>
					<td><input class="col-md-10" type="text" id="amount" name="amount" /></td>
					<td><input class="col-md-10" type="text" id="paidby" name="paidby" /></td>
					<td><input class="col-md-10" type="text" id="category" name="category" /></td>  
					<td><span class="col-md-10"></span></td>
					<td><a class="fui-plus" id="add" onclick="submit_form();" /></span></td>
					</form>
				</tr>

				<% ArrayList<ExpenseList> expenselist = DBConnect.getExpense();
					double total = 0;
					for(int i=0;i<expenselist.size();i++){
						total+=expenselist.get(i).getAmount();
						%>

				<tr>
					<form  method="post" action="deleteexpense" id="deleteexpenserecord">
					<td><%=expenselist.get(i).getItem() %></td>
					<td>Rs. <%=expenselist.get(i).getAmount() %></td>
					<td><%=expenselist.get(i).getPaidby() %></td>
					<td><%=expenselist.get(i).getCategory() %> 
					<input type="hidden" name="expenseid" value="<%=expenselist.get(i).getID() %>"/>
					</td>
					<td><%=expenselist.get(i).getTs() %></td>
					<td><input type="submit" class="btn btn-block btn-md btn-danger" value="Delete" /></td>
					</form>
					
				</tr>

				<%} %>

				<tr class="active">
					<td>TOTAL</td>
					<td colspan="5"><b>Rs. <%=total %></b></td>
				</tr>

			</tbody>
		</table>
		<br/><br/>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<td>Paid By</td>
					<td>Total</td>
				</tr>
			</thead>
			<tbody>
				<% ArrayList<ExpenseList> expenselistgrpMember = DBConnect.getExpenseGroupMember();
					for(int i=0;i<expenselistgrpMember.size();i++){
						%>
				<tr>
					<td><%=expenselistgrpMember.get(i).getPaidby() %></td>
					<td>Rs. <%=expenselistgrpMember.get(i).getAmount() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<br/><br/>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<td>Expense Type</td>
					<td>Total</td>
				</tr>
			</thead>
			<tbody>
				<% ArrayList<ExpenseList> expenselistgrpType = DBConnect.getExpenseGroupType();
					for(int i=0;i<expenselistgrpType.size();i++){
						%>
				<tr>
					<td><%=expenselistgrpType.get(i).getCategory() %></td>
					<td>Rs. <%=expenselistgrpType.get(i).getAmount() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>

	</div>


	<script type="text/javascript">

	    function submit_form() {
	    	$("#expenseform").submit();
	    }
	    
	    function delete_record(id) {
	    	//alert(id);
	    }

	</script>

	<script src="dist/js/vendor/jquery.min.js"></script>
    <script src="dist/js/vendor/video.js"></script>
    <script src="dist/js/flat-ui.min.js"></script>
    <script src="docs/assets/js/application.js"></script>
</body>
</html>