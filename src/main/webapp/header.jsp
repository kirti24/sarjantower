<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Sarjan Voting</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<p class="navbar-text navbar-right">
				Signed in as
				<%=request.getAttribute("user") %>
				&nbsp;|&nbsp; <a href="signout.jsp" class="glyphicon glyphicon-off">LogOut</a>
			</p>

		</div>
	</div>
</nav>