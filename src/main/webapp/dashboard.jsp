<!DOCTYPE HTML>
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
<br/>
	<div class="container">


		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Sarjan Voting</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<p class="navbar-text navbar-right">
						Signed in as <%=request.getAttribute("user") %> &nbsp;|&nbsp; <a href="#" class="glyphicon glyphicon-off">LogOut</a> 
					</p>
					
				</div>
			</div>
		</nav>




		<div class="page-header"><h1>Solo Dance</h1></div>
		<form method="post" action="vote">

			<jsp:include page="CategoryBuilder.jsp"></jsp:include>
			<br />
			<div class="col-lg-4">
				<center>
					<input type="submit" class="btn btn-info">
					</button>
				</center>
			</div>

		</form>
	</div>
</body>
</html>