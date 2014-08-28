<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>

<%
	BufferedReader reader = new BufferedReader(new FileReader(
			"Participants.txt"));
	StringBuilder sb = new StringBuilder();
	String line;

	while ((line = reader.readLine()) != null) {
		sb.append(line + "\n");
	}
	out.println(sb.toString());
%>