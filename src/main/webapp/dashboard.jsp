<!DOCTYPE HTML>
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
		
		<%if(request.getAttribute("voteStatus") != null){
			if(request.getAttribute("voteStatus") == "true"){%>
				<br/><label class="alert alert-success">Your vote has been registered! Keep voting.</label>
				<br/>
		<%	}
		}%>
		
		
		<div class="row">
			<div class="col-lg-4">
				<form method="post" action="event">
					<fieldset>
						<legend>Voting</legend>
						<input type="submit" name="eventname" class="btn btn-primary" value="Solo Dance"><br/><br/>
						<input type="submit" name="eventname" class="btn btn-primary" value="Group Dance" disabled><br/><br/>
						<input type="submit" name="eventname" class="btn btn-primary" value="Fancy Dress" disabled><br/><br/>
					</fieldset>
				</form>
			</div>
			<div class="col-lg-6">
				<h3>Quiz Results</h3>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Date</th>
							<th>Name</th>
							<th>Time</th>
							<th>Correct</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>29-Aug</td>
							<td>Manish Bajaj</td>
							<td>9:27 PM</td>
							<td><i class="glyphicon glyphicon-ok"></i></td>
						</tr>
						<tr>
							<td>2</td>
							<td>29-Aug</td>
							<td>Ishaan Jalan</td>
							<td>10:39 PM</td>
							<td><i class="glyphicon glyphicon-remove"></i></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<br />
		<br />
	</div>
	
	<script type="text/javascript">
	 	
	</script>
</body>
</html>