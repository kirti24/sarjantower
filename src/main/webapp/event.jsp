<!DOCTYPE HTML>
<%@page import="com.example.DBConnect"%>
<%@page session="false"%>
<%@page errorPage="error.jsp" isErrorPage="false"%>
<html>
<head>
<title>Sarjan - Dashboard</title>
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
	%>

	<br />
	
	<div class="container">
		
		<jsp:include page="header.jsp"></jsp:include>
		
		<br/>
		<%if(request.getAttribute("event").toString().equalsIgnoreCase("Group Dance")){ %>
		<h3>Group Photos...</h3>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td><a href="http://i.imgur.com/9YEoVDE.jpg" target="_blank">Advait-Aditya-Varshil</a></td>
					<td><a href="http://i.imgur.com/RcB5Nmu.jpg" target="_blank">Meshwa-Melric</a></td>
					<td><a href="https://i.imgur.com/pMp8gWe.jpg" target="_blank">Meshwa-Palak</a></td>
				</tr>
				<tr>
					<td><a href="https://i.imgur.com/3urU3tA.jpg" target="_blank">Vidhi-Anvesha-Manishka</a></td>
					<td><a href="http://i.imgur.com/FFBfNhW.jpg" target="_blank">Aryan-Vidhi</a></td>
					<td><a href="https://i.imgur.com/jXL9Jb6.jpg" target="_blank">Advik-Ishaan</a></td>
				</tr>
				<tr>
					<td><a href="http://i.imgur.com/4fVo7gz.jpg" target="_blank">Aryan-Advik</a></td>
					<td><a href="https://i.imgur.com/xvG7BO8.jpg" target="_blank">Aryan-Radhika</a></td>
					<td><a href="https://i.imgur.com/Ug0Mog7.jpg" target="_blank">Vidhi-Radhika</a></td>
				</tr>
				<tr>
					<td><a href="https://i.imgur.com/8c425t8.jpg" target="_blank">The Unknowns</a></td>
					<td><a href="https://i.imgur.com/m3eq485.jpg" target="_blank">Unity Group</a></td>
					<td><a href="https://i.imgur.com/HuuQGrr.jpg" target="_blank">Silencer</a></td>
				</tr>
				<tr>
					<td><a href="#" target="_blank">Nautanki</a></td>
					<td><a href="https://i.imgur.com/wLXWngs.jpg" target="_blank">Seth Uncle and Aunty</a></td>
					<td><a href="https://i.imgur.com/E6NpUtF.jpg" target="_blank">Bhabhiya</a></td>
				</tr>
			</tbody>
		</table>
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