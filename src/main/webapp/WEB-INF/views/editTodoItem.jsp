<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<style>
form{width: 100%;}
</style>
</head>
<body>
<center>
	<div><h1 class="fw-semibold fs-10 text-center">TODO APP</h1></div>
	
	
	<form class="container border" action="editSaveTodoItem" method="get">
		  <div class="row m-3">
		    <label for="title" class=" col text-end m-2">Todo ID</label>
		    <input type="text" class="form-control col" id="title" name="title" value="${todo.getId() }">
		  </div>
		  <div class="row m-3">
		    <label for="title" class=" col text-end m-2">Todo Title</label>
		    <input type="text" class="form-control col" id="title" name="title" value="${todo.getTitle() }">
		  </div>
		  <div class="m-3 row">
		    <label for="date" class=" col text-end m-2">Date</label>
		    <input type="date" class="form-control col" id="date" name="date" value="${todo.getDate() }">
		  </div>
		  
		  <button type="submit" class="btn btn-primary text-end">Submit</button>
	</form>

</center>
</body>
</html>