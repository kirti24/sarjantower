<%@page errorPage="error.jsp" isErrorPage="false"%>
<%@page import="com.example.DBConnect"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page session="false"%>
<%
	String prevList="";
	BufferedReader reader = new BufferedReader(new FileReader(
			"src/main/webapp/ParticipantList/"+request.getAttribute("event").toString().replace(' ', '_')+".txt"));
	
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
			prevList = DBConnect.getVote(request.getSession(false).getAttribute("user").toString(), event);
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
				<i class="fa fa-magnet"></i>&nbsp;<%=fields[i]%>
				</h3></div>
				<%
			}
			if(i==1){%>
				<div class="panel-body">
				<%
			}
			if(i>0){
				String category=fields[0].replace(' ', '_');
				String participant=fields[i].replace(' ', '_');
				String inputId=category+"|"+participant;%>
				<div class="radio">
				<label> 
				<input type="radio" name="<%=category%>"	id="<%=inputId%>" value="<%=inputId%>" <% if(prevList.contains(inputId)){%> checked <%}  %>> <%=fields[i]%> </label>
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
<input type="hidden" name="event" value="<%=event %>"/>
<input type="hidden" name="user" value=<%=request.getSession(false).getAttribute("user") %> />
<input type="hidden" name="categories" value=<%=categories.substring(0,categories.length()-1) %> />