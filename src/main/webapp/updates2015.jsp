<%@page session="false"%>
<div class="row">
	<div class="col-md-2">
		<div class="pallete-item">
			<dl class="palette palette-wet-asphalt">
				<dt>
					<a href="2014.jsp" style="text-decoration: none; color: white;">2014</a>
				</dt>
				<!-- <dd>&nbsp;</dd> -->
			</dl>
		</div>

		<div class="pallete-item">
			<dl class="palette palette-wet-asphalt">
				<dt>
					<a href="#" onclick="load('schedule2015.jsp')"
						style="text-decoration: none; color: white;">Schedule</a>
				</dt>
				<!-- <dd>&nbsp;</dd> -->
			</dl>
		</div>
		
		<div class="pallete-item">
			<dl class="palette palette-wet-asphalt">
				<dt>Photo Gallery</dt>
				<!-- <dd>&nbsp;</dd> -->
			</dl>
		</div>
		
		<%
		if (request.getSession(false).getAttribute("user").toString()
				.equalsIgnoreCase("admin")) {
			%>
		<div class="pallete-item">
			<dl class="palette palette-wet-asphalt">
				<dt>
					<a href="#" onclick="submitform('soloeventform')"
						style="text-decoration: none; color: white;">Voting</a>
				</dt>
				<dd>
					<a href="#" onclick="submitform('soloeventform')"
						style="text-decoration: none; color: white;">Solo Dance</a>
				</dd>
			</dl>
			
			<form id="soloeventform" method="post" action="event">
				<input type="hidden" name="eventname" value="Solo Dance 2015">
			</form>
			
		</div>
		<%} %>
		
		<%/*
		if (request.getSession(false).getAttribute("user").toString()
				.equalsIgnoreCase("admin")) {*/
			%>
		<div class="pallete-item">
			<dl class="palette palette-wet-asphalt">
				<dt>
					<a href="#" onclick="submitform('groupeventform')"
						style="text-decoration: none; color: white;">Voting</a>
				</dt>
				<dd>
					<a href="#" onclick="submitform('groupeventform')"
						style="text-decoration: none; color: white;">Group Dance</a>
				</dd>
			</dl>
			
			<form id="groupeventform" method="post" action="event">
				<input type="hidden" name="eventname" value="Group Dance 2015">
			</form>
			
		</div>
		<%//} %>
		
		
		<%
		if (request.getSession(false).getAttribute("user").toString()
				.equalsIgnoreCase("admin")) {
			%>
		<div class="pallete-item">
			<form id="groupeventform1" method="post" action="event">
				<input type="hidden" name="eventname" value="Group Dance 2015" />
				<input type="submit" class="btn btn-block btn-lg btn-inverse" value="Group Dance Voting" />
			</form>
		</div>
		<%} %>
		
		<%
		if (request.getSession(false).getAttribute("user").toString()
				.equalsIgnoreCase("admin")) {
			%>
		<div class="pallete-item">
			<dl class="palette palette-wet-asphalt">
				<dt>
					<a href="#" onclick="submitform('fancyeventform')"
						style="text-decoration: none; color: white;">Voting</a>
				</dt>
				<dd>
					<a href="#" onclick="submitform('fancyeventform')"
						style="text-decoration: none; color: white;">Fancy Dress</a>
				</dd>
			</dl>
			
			<form id="fancyeventform" method="post" action="event">
				<input type="hidden" name="eventname" value="Fancy Dress 2015">
			</form>
			
		</div>
		<%} %>
		
	</div>
	<div class="col-md-10 col-xs-10" id="update2015">
		<div id="update2015">
			<!-- need to remove later -->
			<jsp:include page="schedule2015.jsp"></jsp:include>
		</div>
	</div>
</div>

<form id="eventform" method="post" action="event">
<input type="hidden" name="eventname">
</form>

<script type="text/javascript">
	function load(page) {
		$('#update2015').load(page);
	}
	
	function submitform(eventname) {
		$('#'+eventname).submit();
	}
</script>