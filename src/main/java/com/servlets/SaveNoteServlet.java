package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveNoteServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note n = new Note(title, content, new Date());
			System.out.println(n.getId()+" : "+n.getTitle());
			
			// create a db in mysql with name "notesdb"
			//Saving to DB with Hibernate
			
			Session s = FactoryProvider.getFactory().openSession();
			Transaction t = s.beginTransaction();
			s.save(n);
			t.commit();
			s.close();
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.print("<h1 style='text-align:center;'>Note is added successfully</h1>");
			out.print("<h1 style='text-align:center;'><a href='AllNotes.jsp'>View all notes</a></h1>");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
