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

	<div class="container">
	<h1>Vote</h1>
	<form>
		<div class="row">
			<jsp:include page="CategoryBuilder.jsp"></jsp:include>
		</div>
		</form>
	</div>
</body>
</html>