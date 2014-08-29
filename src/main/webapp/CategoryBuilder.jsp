<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>

<%
	BufferedReader reader = new BufferedReader(new FileReader(
			"src/main/webapp/Participants.txt"));
	StringBuilder sb = new StringBuilder();
	String line;
	String categories="";
	String event="";
	boolean eventSet=false;
	while ((line = reader.readLine()) != null) {
		if(!eventSet){
			event = line.toString();
			eventSet=true;
			%>
			<div class="page-header"><h1><%=event %></h1></div>
			<%
			continue;
		}
		String[] fields = line.split(",");
		for(int i=0;i<fields.length;i++){
			if(i==0){
				categories+=fields[i].replace(' ', '_')+",";%>
				<div class="row">
				<div class="col-lg-4">
				<div class="panel panel-primary">
				<div class="panel-heading">
				<h3 class="panel-title">
				<i class="fa fa-magnet"></i><%=fields[i]%>
				</h3></div>
				<%
			}
			if(i==1){%>
				<div class="panel-body">
				<%
			}
			if(i>0){%>
				<div class="radio">
				<label> 
				<input type="radio" name="<%=fields[0].replace(' ', '_')%>"	id="<%=fields[0].replace(' ', '_')%>" value="<%=fields[i].replace(' ', '_')%>"> <%=fields[i]%> </label>
				</div>
				<%
			}
			if(i==fields.length-1){
				%>
				</div></div></div></div>
				<%
			}
		}
	}
	
%>
<%=sb.toString()%>
<input type="hidden" name="event" value=<%=event %>/>
<input type="hidden" name="user" value=<%=request.getAttribute("user") %>/>
<input type="hidden" name="categories" value=<%=categories %>/>