package com.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.MetrixDataController;

/**
 * Servlet implementation class DeleteRecordFromDB
 */
@WebServlet("/DeleteRecordFromDB")
public class DeleteRecordFromDB extends HttpServlet {

	private static final long serialVersionUID = 1L;

	MetrixDataController mdc;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteRecordFromDB() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String rowId = request.getParameter("id");
		
		if (request.getParameter("id") != null && request.getParameter("id") != "" ) {

			rowId = request.getParameter("id"); 
		}

		mdc = new MetrixDataController();

		try {
			mdc.deleteRecordFromDB(rowId);
			
			response.sendRedirect(request.getContextPath()+"/pages/MatrixMainPage.jsp") ;
		}
		catch(Exception e){
			System.out.println("DeleteRecordFromDB :: doGet() :: catch :--->" + e.getMessage()); 
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}