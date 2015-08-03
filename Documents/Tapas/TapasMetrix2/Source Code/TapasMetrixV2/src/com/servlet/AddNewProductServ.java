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
 * Servlet implementation class AddNewProductServ
 */
@WebServlet("/AddNewProductServ")
public class AddNewProductServ extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private String productId = null;
	private String productName = null;
	private String productDesc = null;
	private String productPlatform = null;
	private String releasePhase = null;

	MetrixDataController mdc;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewProductServ() {
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

		HttpSession session = request.getSession();

		UserMaster userMaster = Utility.getUserMaster(session);

		if (request.getParameter("productId") != null && request.getParameter("productId") != "" ) {

			productId = request.getParameter("productId");
		}

		if (request.getParameter("productName") != null && request.getParameter("productName") != "" ) {

			productName = request.getParameter("productName");
		}

		if (request.getParameter("productDesc") != null && request.getParameter("productDesc") != "" ) {

			productDesc = request.getParameter("productDesc");
		}

		if (request.getParameter("productPlatform") != null && request.getParameter("productPlatform") != "" ) {

			productPlatform = request.getParameter("productPlatform");
		}

		if (request.getParameter("releasePhase") != null && request.getParameter("releasePhase") != "" ) {

			releasePhase = request.getParameter("releasePhase");
		}

		mdc = new MetrixDataController();

		//System.out.println("In doPost " + userId + userName + password + userRole + LTEmail + SonyEmail + userWorkLocation + teamId + firstName + lastName); 

		try {
			mdc.addNewProduct(productId, productName, productDesc, productPlatform, releasePhase);
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
