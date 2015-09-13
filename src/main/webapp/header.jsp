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
			<a class="navbar-brand" href="dashboard.jsp">Sarjan Ganpati Festival 2015</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="dashboard.jsp" class="fui-home">&nbsp;Home</a>
			</li>
			<%
			String user = (String)request.getSession(false).getAttribute("user");
			if(user.equalsIgnoreCase("admin")){ %>
				<li><a href="admin.jsp">Admin</a>
				</li>
				<li><a href="expense.jsp">Expenses</a>
				</li>
			<%} %>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<!-- <li>Signed in as <%=request.getSession(false).getAttribute("user") %></li>  -->
			<li><a href="signout.jsp" class="fui-power">&nbsp;LogOut</a></li>
		</ul>
		<!--/.nav-collapse -->
	</div>
	<!--/.container-fluid -->
</div>