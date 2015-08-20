<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="10;url=https://sarjantower.heroku.com; charset=ISO-8859-1">
<title>Sarjan Tower | Ganpati Festival 2015</title>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css" />
</head>
<body id="body">
	<%
		if (request.getSession(false) == null) {
			//request.getSession().invalidate();
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			if (dispatcher != null) {
				dispatcher.forward(request, response);
				return;
			}
		}
	%>

	
	<p>We have encountered an error while processing your request. This
		error has been logged and we will investigate the cause. Apologies for
		any inconvenience.</p>
	
	
	
</body>
</html>