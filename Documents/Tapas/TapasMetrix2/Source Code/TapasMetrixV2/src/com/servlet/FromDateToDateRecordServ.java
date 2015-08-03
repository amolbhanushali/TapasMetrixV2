package com.servlet;

import java.io.IOException;
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
 * Servlet implementation class FromDateToDateRecordServ
 */
@WebServlet("/FromDateToDateRecordServ")
public class FromDateToDateRecordServ extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private String datepicker1 = null;
	private String datepicker2 = null;
	MetrixDataController mdc;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FromDateToDateRecordServ() {
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

		System.out.println("Inside doPost of FromDateToDateRecordServ");

		HttpSession session = request.getSession();

		UserMaster userMaster = Utility.getUserMaster(session);

		if (request.getParameter("datepicker1") != null && request.getParameter("datepicker1") != "" ) {

			datepicker1 = request.getParameter("datepicker1");
		}

		if (request.getParameter("datepicker2") != null && request.getParameter("datepicker2") != "" ) {

			datepicker2 = request.getParameter("datepicker2");
		}

		mdc = new MetrixDataController();

		System.out.println("In doPost FromDateToDateRecordServ :: From Date and To Date  :- " + datepicker1 +"---"+ datepicker2); 

		mdc.getRecordBetweenTwoDate(datepicker1, datepicker2, session);

		response.sendRedirect(request.getContextPath()+"/pages/MatrixMainPage.jsp") ;
		
		//response.sendRedirect(request.getContextPath()+"/pages/HistoryNLogsPage.jsp") ;
	}
}