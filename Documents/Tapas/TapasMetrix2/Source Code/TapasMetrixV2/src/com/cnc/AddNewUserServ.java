package com.cnc;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.UserMaster;

/**
 * Servlet implementation class AddNewUserServ
 */
@WebServlet("/AddNewUserServ")
public class AddNewUserServ extends HttpServlet {

	private static final long serialVersionUID = 1L;

	BackendInterface mdc;
	RequestDispatcher rd = null; 

	/** 
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewUserServ() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userName = null;
		System.out.println("AddNewUserSer.java: doPOst() start");
		
		if (request.getParameter("username") != null && request.getParameter("username") != "" ) {
			//public UserMaster(String userId, String userName, String password, String userRole, 
			//String lTEmail, String sonyEmail, String userWorkLocation, String teamId, String firstName, String lastName, int isActive) 
			
		//	mdc = new BackendInterface();

			try {
			//	mdc.addNewUserByAdmin(userName, request);
				System.out.println("AddNewUserSer.java: after mdc.addNewUserByAdmin(userName, request);");
			} 
			catch (Exception e) { 
				e.printStackTrace();
			}
			System.out.println("AddNewUserSer.java: doPOst() end");
			//response.sendRedirect(request.getContextPath()+"/pages/MatrixMainPage.jsp") ;
			//rd = request.getRequestDispatcher("/MatrixMainPage.jsp");
			//rd.forward(request, response); 
			System.out.println("AddNewUserSer.java: doPOst() end");
		}
		else {
			return;
		}
	}
}