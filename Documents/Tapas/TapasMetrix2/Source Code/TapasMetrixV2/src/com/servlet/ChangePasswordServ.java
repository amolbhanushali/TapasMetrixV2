package com.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.UserMaster;
import com.dao.MetrixDataController;
import com.util.Utility;

/**
 * Servlet implementation class ChangePasswordServ
 */
@WebServlet("/ChangePasswordServ")
public class ChangePasswordServ extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Statement stmt = null;
	ResultSet rs = null;
	RequestDispatcher rd = null;
	MetrixDataController mdc;
	PrintWriter out = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePasswordServ() {
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

		System.out.println("In doPost() of ChangePasswordServ");  

		String currentpassword = null;
		String newpassword = null;

		HttpSession session = request.getSession();

		UserMaster userMaster = Utility.getUserMaster(session);

		mdc = new MetrixDataController();

		if ( request.getParameter("currentpassword") != null && request.getParameter("currentpassword") != ""  &&
				
			request.getParameter("newpassword") != null && request.getParameter("newpassword") != ""  ) {

			currentpassword = request.getParameter("currentpassword"); 
			newpassword = request.getParameter("newpassword"); 
		}

		//System.out.println(" currentPassOfForm" + currentpassword);

		//System.out.println(" newPassOfForm" + newpassword); 

		try {
			mdc.updateUserPassword(newpassword, userMaster.getUserName());

			System.out.println("User ID in servlet [ChangePasswordServ()] ==: "+ currentpassword + " " + newpassword + "  " + userMaster.getUserId());

			//request.getRequestDispatcher("pages/MatrixMainPage.jsp").forward(request, response);

			//response.sendRedirect(request.getContextPath()+"/pages/MatrixMainPage.jsp") ;
		}
		catch (Exception e) { 
			System.out.println(e);
		}	
	}
}