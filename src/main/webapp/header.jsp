<%@page session="false"%>
<div class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="dashboard.jsp">Sarjan Online Voting</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<!-- <li>Signed in as <%=request.getSession(false).getAttribute("user") %></li>  -->
			<li><a href="signout.jsp" class="glyphicon glyphicon-off">LogOut</a></li>
		</ul>
		<!--/.nav-collapse -->
	</div>
	<!--/.container-fluid -->
</div>