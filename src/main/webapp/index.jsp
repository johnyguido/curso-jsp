<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width-device-width, initial-scale-1">
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<title>Curso JSP</title>

<style type="text/css">

form{
position: absolute;
top: 40%;
left: 33%;
right:33%;
}

h1{
position: absolute;
top: 30%;
left: 40%;
right:40%;
}

.msg{
position: absolute;
top: 70%;
left: 40%;
font-size: 15px;
color: red;
}

</style>

</head>

<body>

	<h1>ENTRAR</h1>


	<form action="ServletLogin" method="post" class="row g-3">
	<input type="hidden" value=<% request.getParameter("url");%> name="url">

		<div class="col-md-6">
			<label class="form-label">Login</label>
				<input class="form-control" name="login" type="text">
		</div>	
		<div class="col-md-6">
				<label class="form-label">Senha</label>
				<input class="form-control" name="senha" type="password">
		</div>	
			
						
				<input type="submit" value="ENVIAR" class="btn btn-primary">
		



	</form>

	<h4 class="msg">${msg}</h4>
	
<!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</body>
</html>