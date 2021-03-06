<!DOCTYPE HTML>
<%@page import="com.example.DBConnect"%>
<%@page import="com.example.FlatVotes"%>
<%@page import="java.util.ArrayList"%>
<%@page session="false"%>
<%@page errorPage="error.jsp" isErrorPage="false"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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

		<%
			ArrayList<FlatVotes> fv = DBConnect.getAdminData();
		ArrayList<FlatVotes> count = DBConnect.getAdminDataCount();
		%>
		
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Event</th>
					<th>Count</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < count.size(); i++) {
				%>
				<tr>
					<td><%=count.get(i).getEvent()%></td>
					<td><%=count.get(i).getFlatno()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Event</th>
					<th>Flat No</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < fv.size(); i++) {
				%>
				<tr>
					<td><%=fv.get(i).getEvent()%></td>
					<td><%=fv.get(i).getFlatno()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

	</div>

	<script src="dist/js/vendor/jquery.min.js"></script>
    <script src="dist/js/vendor/video.js"></script>
    <script src="dist/js/flat-ui.min.js"></script>
    <script src="docs/assets/js/application.js"></script>
</body>
</html>