<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@ include file="comm-css-javascript.jsp"%>

</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container2">
		<div>
			<img class="reg-photo" src="img/login.png">
		</div>
		<div class=" mt-3 ms-2 log-form-title ">
			<h2>Login Page</h2>
		</div>
	</div>
	<div
		class="col-md-4 offset-md-4 shadow p-3 mb-5 bg-white rounded mt-1 p-3">

		<!-- Success message -->
		<div class="text-center">
			<%@ include file="message.jsp"%>

		</div>

		<form action="LoginServlet" method="post">
			<div class="mb-2 ms-2">
				<label for="userName" class="form-label">Enter Your Email-Id : </label> <input
					type="email" class="form-control" id="emailId" name="email"
					aria-describedby="email">
			</div>

			  <div class=" mb-2 ms-2 mt-4">
				<label for="userName" class="form-label">Enter Your
					Password: </label> 
					
				<div class="input-group mb-3">
					<input type="password" class="form-control" name="userpwd" id="password">
					<div class="input-group-append">
						<span class="input-group-text"><a href="#" id="icon-click"><i class="fas fa-eye mb-1 mt-1 text-dark" id="show_eye"></i></a></span>
					</div>
				</div>
			</div>
			
			

			<div class="container text-center mt-3">
				<button type="submit" class="btn btn-outline-primary "
					data-mdb-ripple-color="dark">Login</button>
				<a class="regLink" href="Register.jsp" class="link-success">Register Here?</a>
			</div>



		</form>

	</div>
	
	<script type="text/javascript">
	
	  $(document).ready(function(){
		$("#icon-click").click(function(){
			$("#show_eye").toggleClass('fa-eye-slash');
			var pass=$("#password");
			if(pass.attr("type")==="password"){
				pass.attr("type","text");
			}
			else{
				pass.attr("type","password");
			}
		});
		 
	  });
	
	</script>
</body>
</html>