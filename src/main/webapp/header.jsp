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


<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> </a> 
					<a class="brand" href="stock.jsp">Screener</a> <!-- home page -->
				<div class="nav-collapse collapse navbar-responsive-collapse">
					<ul class="nav">
					<!-- 
						<li id="li_dashboard"><a href="dashboard.jsp">Dashboard</a>
						</li>
					-->
						<li id="li_filter"><a href="filter.jsp">Filter</a>
						</li>																							
						<!-- <li id="li_news"><a href="news.jsp">News and circulars</a>
						</li>
						 -->
						<li id="li_marketsnapshot"><a href="stock.jsp">Market Snapshot</a>
						</li>
						<li id="li_glossary"><a href="glossary.jsp">Glossary</a>
						</li>
						<li id="li_contact"><a href="contact.jsp">Contact us</a>
						</li>
					</ul>
					<form class = "navbar-form span2">
						<input type="text" class="typeahead pull-left" placeholder="Company Search"></input>
					</form>
					<ul class = "nav pull-right">
						<li class = "dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"> Welcome <%=request.getSession(false).getAttribute("user") %> <b class="caret"></b></a>
							<ul class="dropdown-menu btn">
                          		<li><a href="EditProfile">Edit Profile</a></li>
                          		<li><a href="signout.jsp">Logout</a></li>
                        	</ul>
						</li>
						<li class="divider-vertical"></li>
					</ul>
					
				</div>
					
				<!--/.nav-collapse -->
			</div>
					
		</div>
</div>