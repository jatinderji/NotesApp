<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Notes</title>

	<%@include file="allJssCss.jsp" %>

</head>
<body>

	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp" %>
	</div>
	<br>
	<div class="container text-center">
		<h2>Please fill you note detail</h2>
	</div>
	
	<div class="container p-10">
	<!-- Form to add notes -->
	
	<form action="SaveNote" method="post">
  <div class="form-group p-10">
    	<label for="title">Note Title</label>
    	<input type="text" class="form-control" id="title" required
    			name="title"
    			placeholder="Enter Note Title Here">
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea id="content" required
    		placeholder="Enter Notes Content Here"
    		name="content"
    		class="form-control" style="height:300px;"></textarea>
  </div>

	<div class="container text-center">
		<button type="submit" class="btn btn-primary">Add</button>
	</div>
  
</form>
	
</div>
  
</body>
</html>