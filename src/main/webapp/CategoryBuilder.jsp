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
				sb.append("<h3>"+fields[i]+"</h3>");
			}
		}
	}
	out.println(sb.toString());
%>