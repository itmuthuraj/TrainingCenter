<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>

<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Login</title>
   <link href="${pageContext.request.contextPath}/style/LoginStyle.css" rel="stylesheet">  
     <meta name="viewport" content="width=device-width, initial-scale=1.0">

   </head>
  <body>

	<div class="box">
		<!--<fm:form autocomplete="off">-->
		<form method="POST" action=""${contextPath}/AllPage">
			<h2>Sign in</h2>
			<div class="inputBox">
				<input type="text" name="userName" required="required"/>
				<span>student Id</span>
				<i></i>
			</div>
			<div class="inputBox">
				<input type="password"  name="password" required="required"/>
				<span>Password</span>
				<i></i>
			</div>
			<div class="links">
				<a href="#">Forgot Password ?</a>
				<a href="signup">Signup</a>
			</div>
			<input type="submit" value="Login" name="login"/>
		</form>
	</div>

</body>
</html>



