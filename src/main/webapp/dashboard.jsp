<!DOCTYPE HTML>
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
	%>

	<br />
	<div class="container">


		<jsp:include page="header.jsp"></jsp:include>

		<%
			if (request.getAttribute("voteStatus") != null) {
				if (request.getAttribute("voteStatus") == "true") {
		%>
		<br /> <label class="alert alert-success">Your vote has been
			registered! Keep voting.</label> <br />
		<%
			}
			}
		%>


		<!-- <jsp:include page="updates.jsp"></jsp:include> -->

		<br /> <br />
	</div>

	<script type="text/javascript">
	 	
	</script>
</body>
</html>