<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>

<%
	BufferedReader reader = new BufferedReader(new FileReader(
			"src/main/webapp/Participants.txt"));
	StringBuilder sb = new StringBuilder();
	String line;

	while ((line = reader.readLine()) != null) {
		String[] fields = line.split(",");
		for(int i=0;i<fields.length;i++){
			if(i==0){
				sb.append("<div class=\"row\">");
				sb.append("<div class=\"col-lg-4\">");
				sb.append("<div class=\"panel panel-primary\">");
				sb.append("<div class=\"panel-heading\">");
				sb.append("<h3 class=\"panel-title\">");
				sb.append("<i class=\"fa fa-magnet\"></i>"+fields[i]);
				sb.append("</h3></div>");
			}
			if(i==1){
				sb.append("<div class=\"panel-body\">");
			}
			if(i>0){
				sb.append("<div class=\"radio\">");
				sb.append("<label> <input type=\"radio\" name=\""+fields[0]+"\"	id=\""+fields[0]+"\" value=\""+fields[i].replace(' ', '_')+"\"> "+fields[i]+" </label>");
				sb.append("</div>");
			}
			if(i==fields.length-1){
				sb.append("</div></div></div></div>");
			}
		}
	}
%>
<%=sb.toString()%>