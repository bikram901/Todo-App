<%@page import="com.example.Todo_App.model.Todo"%>
<%@page import="java.util.List , java.util.Iterator "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
  
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>

	<center>
		<div><h1 className="fw-semibold fs-10 text-center">TODO APP</h1></div>
		
		<div class="container text-center">
			<div class="row ">
				<div class="col"><button type="button" class="btn btn-secondary"><a class="text-decoration-none  " href="/createTodoItem">Add Todo</a></button></div>
			</div>
			<div class="row">
			    <div class="col-1 fw-bold border fs-4">ID</div>
			    <div class="col-2 fw-bold border fs-4">DATE</div>
			    <div class="col-2 fw-bold border fs-4">TITLE</div>
			    <div class="col-2 fw-bold border fs-4">STATUS</div>
			    <div class="col-2 fw-bold border fs-4">Change Status</div>
			    <div class="col-1 fw-bold border fs-4">Edit</div>
			    <div class="col-2 fw-bold border fs-4">Delete</div>
	  		</div>
	  		<%
	  			List<Todo> list = (List<Todo>) request.getAttribute("list");
	  			if(list.isEmpty()){
	  		%>
	  		
	  			<h2 class="mt-5 text-success">ENJOY YOUR DAY</h2>	
	  		<% 
	  			}
	  			for(Todo todo: list){
	  		%>
	  			<div class="row">
	  				<div class="col-1"><%=todo.getId() %></div>
	  				<div class="col-2"><%=todo.getDate() %></div>
				    <div class="col-2"><%=todo.getTitle() %></div>
				    <div class="col-2"><%=todo.getStatus() %></div>
				    <div class="col-2"><button type="button" class="btn btn-success"><a href="/updateTodoStatus/<%=todo.getId() %>" >Mark Complete</a></button></div>
				    <div class="col-1"><button type="button" class="btn btn-light"><a href="/editTodoItem/<%=todo.getId() %>">Edit</a></button></div>
				    <div class="col-2"><button type="button" class="btn btn-danger"><a href="/deleteTodoItem/<%=todo.getId() %>">Delete</a></button></div>
				</div>
			<% 
	  			}
	  		
	  		%>
			
		</div>
		${message }	
	</center>

</body>
<script th:inline="javascript">
		
		window.onload=function(){
		var msg=${message}
		
		if(msg=="Update Sucess")
		Command: toastr["success"]("Todo Updated")
		else if(msg=="Todo Listed")
			Command: toastr["success"]("Todo Added")
			else if(msg=="Todo Edited")
				Command: toastr["success"]("Todo Edited")
				else if(msg=="Todo Deleted")
					Command: toastr["success"]("Todo Deleted")
					else
						Command: toastr["error"]("Failure in "+ msg)
		}
		
		toastr.options = {
		  "closeButton": true,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": true,
		  "positionClass": "toast-top-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
</script>
</html>