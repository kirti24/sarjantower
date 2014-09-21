<!DOCTYPE HTML>
<%@page import="com.example.DBConnect"%>
<%@page import="com.example.FlatVotes"%>
<%@page import="java.util.ArrayList"%>
<%@page session="false"%>
<%@page errorPage="error.jsp" isErrorPage="false"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css" />

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
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>Item Description</td>
					<td>Amount</td>
					<td>Paid By</td>
					<td>Category</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<form method="post">
						<td> <input type="text" id="item" name="item" /> </td>
						<td> <input type="text" id="amount" name="amount" /> </td>
						<td> <input type="text" id="paidby" name="paidby" /> </td>
						<td> <input type="text" id="category" name="category" />
						<a class="glyphicon glyphicon-plus"  /> </td>
					</form>
				</tr>
			</tbody>
		</table>
		
		<form method="post">
			
		</form>
				
	</div>
</body>
</html>