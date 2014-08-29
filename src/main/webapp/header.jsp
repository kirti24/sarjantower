<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="dashboard.jsp">Sarjan Voting</a>
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



<div class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Sarjan Online Voting</a>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            <li>Signed in as
				<%=request.getAttribute("user") %></li>
              <li><a href="signout.jsp" class="glyphicon glyphicon-off">LogOut</a><a href="signout.jsp" class="glyphicon glyphicon-off">LogOut</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </div>