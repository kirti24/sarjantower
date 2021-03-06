<%@page errorPage="error.jsp" isErrorPage="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Sarjan Tower | Ganpati Festival 2015</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">

<div class="page-header">
    <h1>Sarjan Tower <small>Ganpati Festival 2015</small></h1>
</div>

<!-- Interactive Login - START -->
<div class="container">
    <div class="row colored">
        <div id="contentdiv" class="contcustom">
            <span class="fa fa-spinner bigicon"></span>
            <h2>Login</h2>
            <div>
            	<form method = "post" action="login" id="loginform">
	                <input id="username" name="username" type="text" placeholder="username" onkeypress="check_values();">
	                <input id="password" name="password" type="password" placeholder="password" onkeypress="check_values();">
	                <button id="button1" class="btn btn-default wide hidden" onkeypress="submit_form();"><span class="fa fa-check med"></span></button>
	                <button id="lock1" class="fa fa-lock medhidden redborder"></button>
                </form>
                <%if(request.getAttribute("errormessage") != null){%>
					<br/><label class="alert alert-error"><%=request.getAttribute("errormessage")%></label>
				<%}%>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">


    function check_values() {
        if ($("#username").val().length != 0 && $("#password").val().length != 0) {
            $("#button1").removeClass("hidden").animate({ left: '250px' });;
            $("#lock1").addClass("hidden").animate({ left: '250px' });;
        }
    }
    function submit_form() {
    	$("#loginform").submit();
    }

</script>

<style>
.redborder {
    border:2px solid #f96145;
    border-radius:2px;
}

.hidden {
    display: none;
}

.visible {
    display: normal;
}

.colored {
    background-color: #F0EEEE;
}

.row {
    padding: 20px 0px;
}

.bigicon {
    font-size: 97px;
    color: #f96145;
}

.contcustom {
    text-align: center;
    width: 300px;
    border-radius: 0.5rem;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: 10px auto;
    background-color: white;
    padding: 20px;
}

input {
    width: 100%;
    margin-bottom: 17px;
    padding: 15px;
    background-color: #ECF4F4;
    border-radius: 2px;
    border: none;
}

h2 {
    margin-bottom: 20px;
    font-weight: bold;
    color: #ABABAB;
}

.btn {
    border-radius: 2px;
    padding: 10px;
}

.med {
    font-size: 27px;
    color: white;
}

.medhidden {
    font-size: 27px;
    color: #f96145;
    padding: 10px;
    width:100%;
}

.wide {
    background-color: #8EB7E4;
    width: 100%;
    -webkit-border-top-right-radius: 0;
    -webkit-border-bottom-right-radius: 0;
    -moz-border-radius-topright: 0;
    -moz-border-radius-bottomright: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}
</style>


</div>

</body>
</html>