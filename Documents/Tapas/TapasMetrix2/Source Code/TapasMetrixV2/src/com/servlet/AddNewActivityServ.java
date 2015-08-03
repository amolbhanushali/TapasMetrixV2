package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class AddNewActivityServ
 */
@WebServlet("/AddNewActivityServ")
public class AddNewActivityServ extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private String activityId = null;
	private String activityName = null;
	private String activityDesc = null;
	private String parentActivity = null;
	MetrixDataController mdc;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewActivityServ() {
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
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("Inside doPost");
		
		mdc = new MetrixDataController();

		HttpSession session = request.getSession();

		UserMaster userMaster = Utility.getUserMaster(session);

		if (request.getParameter("activityId") != null && request.getParameter("activityId") != "" ) {

			activityId = request.getParameter("activityId");
		}

		if (request.getParameter("activityName") != null && request.getParameter("activityName") != "" ) {

			activityName = request.getParameter("activityName");
		}

		if (request.getParameter("activityDesc") != null && request.getParameter("activityDesc") != "" ) {

			activityDesc = request.getParameter("activityDesc");
		}

		if (request.getParameter("parentActivity") != null && request.getParameter("parentActivity") != "" ) {

			parentActivity = request.getParameter("parentActivity");
		}

		try {
			mdc.addNewActivity(activityId, activityName, activityDesc, parentActivity);
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}

		if(request != null) {
			response.sendRedirect(request.getContextPath()+"/pages/MatrixMainPage.jsp") ;
		}
		else{
			System.out.println("request objecct " + request); 
		}
	}
}
