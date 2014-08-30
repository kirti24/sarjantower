<%@page session="false"%>
<%@page errorPage="error.jsp" isErrorPage="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body id = "body">

	<%	
	try{
		String userid = (String) request.getSession(false).getAttribute("user");
		
		if(request.getSession(false) != null){
			request.getSession(false).invalidate();
		}

	}catch(Exception e){		
		if(request.getSession(false) != null)
			request.getSession(false).invalidate();
	}
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");		
	if (dispatcher != null)
	{
		dispatcher.forward(request, response);
		return;
	}
	
	%>

</body>
</html>