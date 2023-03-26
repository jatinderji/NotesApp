<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Notes</title>
	<%@include file="allJssCss.jsp" %>
</head>
<body>

	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp" %>
	</div>
	<br>	
	<div class="container text-center">
		<h2>All Notes</h2>
	</div>
		
	<div class="container p-10">
		
		<div class="row">
			<div class="col-12">
				<%
		Session s = FactoryProvider.getFactory().openSession();
		Query q = s.createQuery("from Note");
		List<Note> list = q.list();
		for(Note note: list){
				%>
		<div class="card mt-3">
		  <img src="img/notepad.png" class="card-img-top m-4 mx-auto" style="height:40px;width:40px;margin:10px;">
		  <div class="card-body px-5">
		    <h5 class="card-title"><%=note.getTitle() %></h5>
		    <p class="card-text"><%=note.getContent() %></p>
		    <i><b class="text-primary"><%=note.getAddedDate() %></b></i>
		    
		    <div class="container text-center mt-2">
			    <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
			    <a href="EditNote.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
		    </div>
		    
		  </div>
		</div>
		<%							}
		s.close();
		%>
				
			</div>
		</div>
				
	</div>
	

</body>
</html>