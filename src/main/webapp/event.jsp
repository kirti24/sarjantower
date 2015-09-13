<!DOCTYPE HTML>
<%@page import="com.example.DBConnect"%>
<%@page session="false"%>
<%@page errorPage="error.jsp" isErrorPage="false"%>
<html>
<head>
<title>Sarjan Tower - Dashboard | Ganpati Festival 2015</title>
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
	%>

	<br />
	
	<div class="container">
		
		<jsp:include page="header.jsp"></jsp:include>
		
		<br/>
		
		<%if(request.getAttribute("event").toString().equalsIgnoreCase("Group Dance 2014")){ %>
		<h4>Group Photos...</h4>
		<jsp:include page="photos/GroupDance2014.jsp"></jsp:include>
		<br/>
		<%} %>
		
		<%if(request.getAttribute("event").toString().equalsIgnoreCase("Group Dance 2015")){ %>
		<h4>Group Photos...</h4>
		<jsp:include page="photos/GroupDance2015.jsp"></jsp:include>
		<br/>
		<%} %>
		<form method="post" action="vote">

			<jsp:include page="CategoryBuilder.jsp"></jsp:include>
			<br />
			<div class="col-lg-4">
				<center>
					<input type="submit" class="btn btn-info">
				</center>
					<%
					String username = request.getSession(false).getAttribute("user").toString();
					String event = request.getAttribute("event").toString();
					%>
					<input type="hidden" name="lastVote" value=<%=DBConnect.getVote(username, event)%>  />
			</div>

		</form>
		<br/><br/><br/>
	</div>

	<script type="text/javascript">
		
	</script>
</body>
</html>