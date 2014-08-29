<!DOCTYPE HTML>
_
<%@page session="false"%>
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
		if (request.getAttribute("user") == null
				|| request.getAttribute("user") == "") {
			request.getSession().invalidate();
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			if (dispatcher != null) {
				dispatcher.forward(request, response);
				return;
			}
		}
	%>

	<br />
	<div class="container">


		<jsp:include page="header.jsp"></jsp:include>
		
		<%if(request.getAttribute("status") != null){
			if(request.getAttribute("status") == "true"){%>
				<br/><label class="alert alert-success">Your vote has been registered! Keep voting.</label>
		<%	}
		}%>
		
		<form method="post" action="votingForm.jsp">
			<input type="submit" class="btn btn-default">Solo Dance
			<input type="hidden" name="event" value="Solo Dance" />
		</form>
		
		<jsp:include page="eventForm.jsp"></jsp:include>
			
		<br />
		<br />
	</div>
	
	<script type="text/javascript">
	 	
	</script>
</body>
</html>