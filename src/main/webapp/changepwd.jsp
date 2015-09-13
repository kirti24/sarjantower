<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<form action="changepwd" method="post" id="changepwdform" onsubmit="check_values();">
			<input id="password" class="form-control login-field" name="password"
				type="password" placeholder="Password"><br /> <input
				id="repassword" class="form-control login-field" name="repassword"
				type="password" placeholder="Re-Type password"><br />
			<button class="btn btn-primary btn-lg btn-block">Submit</button>
		</form>
		<div class=""></div>
	</div>
</div>

<script>
$( "#changepwdform" ).validate({
	  rules: {
	    password: "required",
	    repassword: {
	      equalTo: "#password"
	    }
	  }
	});
</script>
