package com.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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

/**
 * Servlet implementation class UserLoginServ
 */
/**
 * 
 * @author Sandip Kumar Ranjan  && Amol Bhanushali
 *
 */
@WebServlet("/UserLoginServ")
public class UserLoginServ extends HttpServlet {

	private static final long serialVersionUID = 1L;

	Statement stmt = null;
	ResultSet rs = null;
	RequestDispatcher rd = null;
	MetrixDataController metrixDataController;
	PrintWriter out = null;
	HttpSession session = null;
	UserMaster userMaster = null;
	String usernameFromDB = null; 
	String passwordFromDB = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLoginServ() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	public void init() throws ServletException {

		System.out.println("Inside init()");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userNameOfForm = request.getParameter("username");
		String passWordOfForm = request.getParameter("password");
		
		session = request.getSession();
		session.setAttribute("logged_username", userNameOfForm); 

		out = response.getWriter();

		metrixDataController = new MetrixDataController();

		try {

			getUserObject(userNameOfForm, passWordOfForm);

			usernameFromDB = userMaster.getUserName();
			passwordFromDB = userMaster.getPassword();

			if(userNameOfForm.equals(usernameFromDB) && passWordOfForm.equals(passwordFromDB) ) { 

				request.getRequestDispatcher("pages/MatrixMainPage.jsp").forward(request, response);
				
				session.setAttribute("login", "pass");
			} 
			
			if (!userNameOfForm.equals(usernameFromDB) && !passWordOfForm.equals(passwordFromDB) ) {

				session.setAttribute("login", "fail");
				
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}
		}
		catch (Exception e) { 
			System.out.println("UserLoginServ:doPost():catch :-----> " + e.getMessage());
			e.printStackTrace();
		}
		System.out.println("PS Number of logged user :-- "+ userNameOfForm); 
		
		/*HttpSession session = request.getSession();
		UserMaster userMaster = Utility.getUserMaster(session);
		
		String capitalUserName = userMaster.getFirstName().substring(0, 1).toUpperCase() + userMaster.getFirstName().substring(1);
		System.out.println("Name of logged user :-- "+ capitalUserName);*/
	}

	public void getUserObject(String userNameOfForm, String passWordOfForm) {

		userMaster = new UserMaster();

		try {
			stmt = metrixDataController.getConnectionForDB().createStatement();
			String selectQuery = "select * from "+ MetrixDataController.Mst_TBL_USER + " where userName='"+userNameOfForm+"' and password='"+passWordOfForm+"' ";
			rs = stmt.executeQuery(selectQuery); 

			while(rs.next()) {

				userMaster.setUserId(rs.getString("userId"));
				userMaster.setUserName(rs.getString("userName"));
				userMaster.setPassword(rs.getString("password")); 
				userMaster.setUserRole(rs.getString("userRole"));
				userMaster.setLTEmail(rs.getString("lTEmail")); 
				userMaster.setSonyEmail(rs.getString("sonyEmail"));
				userMaster.setUserWorkLocation(rs.getString("userWorkLocation"));
				userMaster.setTeamId(rs.getString("teamId"));
				userMaster.setFirstName(rs.getString("firstName"));
				userMaster.setLastName(rs.getString("lastName"));
				userMaster.setIsActive(rs.getInt("isActive"));
			}//while ends

			//System.out.println("UserLoginServlet: getUserObject() :---->" + userMaster.toString());

			session.setAttribute("UserMaster", userMaster);
		}
		catch (SQLException e) {
			System.out.println("UserLoginServlet:getUserObject():SQLException" + e.getMessage());
		}
	}//getUserobject
}