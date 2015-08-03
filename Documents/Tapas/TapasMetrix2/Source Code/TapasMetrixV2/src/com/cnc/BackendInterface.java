package com.cnc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.bean.UserMaster;
import com.dao.MetrixDataController;

public class BackendInterface {

	public String url = "jdbc:mysql://10.7.223.104:3306/slm";
	public String driverName = "com.mysql.jdbc.Driver";
	public Connection con;
	public Statement stmt;
	String userName="root";  
	String passWord="root";
	ResultSet rs = null;
	int DMSInvestigated = 0;
	String productNameFromDB = null; 
	int monthDataFromDB = 0;
	String updateQuery = null;
	public static String username = null, userId = null;  
	public static String CDFactivityId = "1" ,
			DMSactivityId="2",
			DocactivityId="3",
			KittingactivityId="4",
			OnsiteactivityId="5",
			SanityactivityId="6";

	//public static String DBname = "customization_metrixdb";
	//public static String DBname = "slm"; //--by Amol
	public static String Trn_TBL_USER_ACTIVITY = "trn_useractivity_tbl";
	public static String Mst_TBL_USER = "mst_user_tbl";
	public static String Mst_TBL_Product = "mst_product_tbl";
	
	public UserMaster user;

	/**
	 * This Method will add new user into user table
	 * @param Product
	 * @param DMSInvestigated
	 * @throws SQLException
	 */ 
	public void addNewUser(String userName, String passWord) throws SQLException {

		stmt =  getConnectionForDB().createStatement();

		String insertInUserTable = "insert into " + MetrixDataController.Mst_TBL_USER + " values ( '"+userName+"' , '"+passWord+"')";

		stmt.executeUpdate(insertInUserTable); 
	} 

	/**
	 * This Method will add new product into CDF table
	 * @param Product
	 * @param DMSInvestigated
	 * @throws SQLException
	 */
	public void addNewProduct(String Product) throws SQLException {

		stmt =  getConnectionForDB().createStatement();

		String insertInUserTable = "insert into " + MetrixDataController.Trn_TBL_USER_ACTIVITY + " values ( '"+Product+"' , 0, 0, 0)";

		stmt.executeUpdate(insertInUserTable); 
	} 

	/**
	 * 
	 * @param req
	 */
	public void createObjectUser(HttpServletRequest req){
		
		user.setUserName(req.getParameter("username"));
		
	}
	
	/**
	 * This Method will add new user into user table
	 * @param Product
	 * @param DMSInvestigated
	 * @throws SQLException
	 */
	public void addNewUserByAdmin(String userName,HttpServletRequest request) throws SQLException {
		System.out.println("BackendInterface: addNewUserByAdmin() start");
		stmt =  getConnectionForDB().createStatement();
		MetrixDataController objMDC = new MetrixDataController();
		objMDC.addNewUser(request.getParameter("userId"),
				request.getParameter("userName"),request.getParameter("password"),
				request.getParameter("userRole"),
				request.getParameter("LTEmail"),
				request.getParameter("SonyEmail"),
				request.getParameter("userWorkLocation"),
				request.getParameter("teamId"),
				request.getParameter("firstName"),
				request.getParameter("lastName")
				);
		System.out.println("BackendInterface: addNewUserByAdmin() end");
		//String insertInUserTable = "insert into " + MetrixDataController.Mst_TBL_USER + " values ( '"+userName+"')";
		//stmt.executeUpdate(insertInUserTable); 
	} 

	/**
	 * This Method will return data in date and time format 
	 */
	public String getDate() {

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date date = new Date();

		return dateFormat.format(date);
	}
	
	/**
	 * This Method loads the DB drivers and connect to the DB 
	 */
	public Connection getConnectionForDB() {
 
		try{
			Class.forName(driverName);
			con = DriverManager.getConnection(url, userName, passWord);
			return con;
		}
		catch(Exception e){
			return null;
		}
	}

	/**
	 * This method will close the connection with DB
	 */
	public void closeDBConnection() {
		try{
			con.close();
		}
		catch(Exception e){}
	}

	/**
	 * This Method will return MetrixDataController object
	 * @return MetrixDataController
	 */
	public static MetrixDataController getBeanMetrixDataController(){

		MetrixDataController metrixDataController = new MetrixDataController();
		return metrixDataController; 
	}
}