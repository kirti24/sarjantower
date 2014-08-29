<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>

<%
	BufferedReader reader = new BufferedReader(new FileReader(
			"src/main/webapp/Participants.txt"));
	StringBuilder sb = new StringBuilder();
	String line;
	String categories="";

	while ((line = reader.readLine()) != null) {
		String[] fields = line.split(",");
		for(int i=0;i<fields.length;i++){
			if(i==0){
				categories+=fields[i]+",";%>
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
				<input type="radio" name="<%=fields[0]%>"	id="<%=fields[0]%>" value="<%=fields[i].replace(' ', '_')%>"> <%=fields[i]%> </label>
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
	
	request.setAttribute("Categories", categories);
%>
<%=categories%>
<%=sb.toString()%>
