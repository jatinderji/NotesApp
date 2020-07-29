<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Note</title>

	<%@include file="allJssCss.jsp" %>

</head>
<body>

	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp" %>
	</div>
	
	<br>
	
	<div class="container text-center">
		<h2>Please fill you note detail to be updated</h2>
	</div>
		
	<%
	 int noteId = Integer.parseInt(request.getParameter("note_id").trim());
	
	 Session s = FactoryProvider.getFactory().openSession();
	 
	 	Note note = s.get(Note.class,noteId);

	 s.close();
	%>	

	<!-- Form to Edit and Update notes -->
<div class="container p-10">
	
 <form action="UpdateServlet" method="post">

 <input type="hidden" name="noteId" value="<%=note.getId()%>">
  <div class="form-group">
    	<label for="title">Note Title</label>
    	<input type="text" class="form-control" id="title" required
    			name="title"
    			value="<%=note.getTitle() %>"
    			placeholder="Enter Note Title Here">
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea id="content" required
    		placeholder="Enter Notes Content Here"
    		name="content"
    		class="form-control" style="height:300px;"><%=note.getContent() %></textarea>
  </div>

	<div class="container text-center">
		<button type="submit" class="btn btn-primary">Update Note</button>
	</div>
 </form>
</div>

</body>
</html>