package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class ActivityServlet
 * 
 * Older name = DMSCheckServ.java
 */
@WebServlet("/ActivityServlet")
public class ActivityServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	MetrixDataController db_Layer;
	RequestDispatcher rd = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ActivityServlet() {
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

		System.out.println("In do post next");
		String product = null;
		String selectedActivity = null; 
		String month;
		int activityCount = 0;
		String userComment = "";
		boolean doInsert;
		int insertId=0;

		if ( (request.getParameter("selectedProduct") != null && request.getParameter("selectedProduct") != ""  && 

				request.getParameter("selectedActivity") != null && request.getParameter("selectedActivity") != "" &&

				request.getParameter("activityCount") != null && request.getParameter("activityCount") != ""   && 

				request.getParameter("userComment") != null && request.getParameter("userComment") != "" ) ) {


			product = request.getParameter("selectedProduct");

			selectedActivity = request.getParameter("selectedActivity");

			month = Utility.getCurrentMonth();

			try{
				activityCount = Integer.parseInt(request.getParameter("activityCount"));
			}
			catch(NumberFormatException nfe) {
				nfe.printStackTrace();
			}
			userComment = request.getParameter("userComment");

			try {
				db_Layer = new MetrixDataController();

				HttpSession session = request.getSession();
				UserMaster userMaster = Utility.getUserMaster(session);

				db_Layer.updateTableInDb(product, activityCount, month, MetrixDataController.Trn_TBL_USER_ACTIVITY, selectedActivity, userComment, userMaster.getUserId(),
						userMaster.getTeamId(), userMaster.getUserRole());

				response.sendRedirect(request.getContextPath()+"/pages/MatrixMainPage.jsp") ;
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else{
			return;
		}
	}
}