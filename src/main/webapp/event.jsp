<!DOCTYPE HTML>
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
		if (request.getSession(false) == null) {
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
		}%>
		SOLO
		<jsp:include page="votingForm.jsp"></jsp:include>
			
		<br />
	</div>
	
	<script type="text/javascript">
	 	
	</script>
</body>
</html>