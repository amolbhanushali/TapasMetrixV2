package com.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import com.bean.UserMaster;
import com.cnc.BackendInterface;
import com.util.Utility;
/**
 * 
 * @author Amol Bhanushali && Sandip Kumar Ranjan
 *
 */
public class MetrixDataController {

	//DB connection Provider variables
	//public String url = "jdbc:mysql://10.7.223.104:3306/cncmetrics_test"; // Windows my system

	//public String url = "jdbc:mysql://10.7.223.104:3306/cncmetrics";    // Linux system

	//public String url = "jdbc:mysql://10.7.223.27:3306/cncmetrics_test";    // Linux system

	//public String url = "jdbc:mysql://127.0.0.1:3306/cncmetrics_test";    // Linux system  11 june 2013

	//public String url = "jdbc:mysql://127.0.0.1:3306/cncmetrics";    // Linux system 12 june 2013 // commented on 26 June 2013 10 11 AM

	//public String url = "jdbc:mysql://10.7.223.104:3306/cncmetrics";    // My system 26 june 2013 // Added on 26 June 2013 10 11 AM
	
	//public String url = "jdbc:mysql://127.0.0.1:3306/cncmetrics";    // Linux system 2 July 2013 // 2 July 2013 12 35PM 
	public String url = "jdbc:mysql://127.0.0.1:3306/slm";    		// Amol system 11 Apr 2014 // 
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
	//public static String username = null, userId = null;  

	public static String userRole = null;  
	public static String CDFactivityId = "1" ,
			DMSactivityId="2",
			DocactivityId="3",
			KittingactivityId="4",
			OnsiteactivityId="5",
			SanityactivityId="6";

	public static String Trn_TBL_USER_ACTIVITY = "trn_useractivity_tbl";
	public static String Mst_TBL_USER = "mst_user_tbl";
	public static String Mst_TBL_Product = "mst_product_tbl";
	public static String Mst_TBL_Activity = "mst_activity_tbl";
	public static String TRN_ROLEACTIVITY = "trn_roleactivity_tbl";
	public static String MST_TEAM_TBL = "mst_team_tbl";

	String currentmonth = Utility.getCurrentMonth();
	String prevMonth = Utility.getPreviousMonth();
	String prePrevMonth = Utility.getPrePreviousMonth();

	/**
	 * This Method loads the DB drivers and connect to the DB 
	 */
	public Connection getConnectionForDB() {

		Connection conn = null;

		try{
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, userName, passWord);
		}
		catch (ClassNotFoundException e) {
			System.out.println("In getConnectionForDB :: ClassNotFoundException :: catch :--"+ e.getMessage());
			e.printStackTrace();
		}
		catch(SQLException e){
			System.out.println("In getConnectionForDB :: SQLException :: catch :--"+ e.getMessage());
			e.printStackTrace();
		}
		/*	finally {

		 * close any jdbc instances here that weren't explicitly closed during normal code path, so that we don't 'leak' resources...


			if (stmt != null) {
				try {
					stmt.close();
				} 
				catch (SQLException sqlex) {
					// ignore -- as we can't do anything about it here
				}
				stmt = null;
			}

			if (conn != null) {
				try {
					conn.close();
				} 
				catch (SQLException sqlex) {
					// ignore -- as we can't do anything about it here
				}
				conn = null;
			}
		}*/
		return conn;
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

	///-----------------------NEW METHODE----------------------------------------------------------------------
	/**
	 * This Method will return all the data from column 'Product' from the Table 'MetrixDataController.Trn_TBL_DMS'
	 * @return resultset
	 */
	public ResultSet getProductNamesFromDb(String tableName) {	

		ResultSet rs = null;

		try{
			stmt = getConnectionForDB().createStatement();

			rs = stmt.executeQuery("select distinct (productId),productName from "+ tableName); 
		}
		catch (Exception e){
			System.out.println("MetrixDataController.getProductNamesFromDb() " + e.getMessage());
		}
		return rs;
	}

	///-----------------------NEW METHODE----------------------------------------------------------------------
	/**
	 * This Method will return all the data from column 'Activity' from the Table 'MetrixDataController.Trn_TBL_DMS'
	 * @return resultset
	 */
	public ResultSet getActivityNamesFromDb(String tableName, String userId) {	

		ResultSet rs = null;

		try{
			stmt = getConnectionForDB().createStatement();
			String query = "select distinct (activityId), activityName" +
					" from trn_roleactivity_tbl" +
					" where roleId in" +
					" (select roleId from trn_userrole_tbl where userId = '"+userId+"')";

			rs = stmt.executeQuery(query); 
		}
		catch (Exception e){
			System.out.println("MetrixDataController.getActivityNamesFromDb() " + e.getMessage());
		}
		return rs;
	}

	//-------------------------NEW METHODE-------------------------------------------------------
	/**
	 * This Method will return all data from DMS_tbl
	 * @return ReultSet
	 */
	public ResultSet getMetrixDataFromDb(String tableName, String activityId){

		ResultSet rs = null;

		try{
			stmt = getConnectionForDB().createStatement();
			//String nextMonth = Utility.getNextMonth();

			String query = "SELECT  P.ProductName, sum(CASE WHEN UA.activityMonth = '"+ currentmonth +"' THEN (UA.activityCount) else '0' END) "+ currentmonth + ", " +
					"sum(CASE WHEN UA.activityMonth = '"+ prevMonth +"' THEN (UA.activityCount) else '0' END) "+prevMonth+", " +
					"sum(CASE WHEN UA.activityMonth = '"+ prePrevMonth +"' THEN (UA.activityCount) else '0' END) "+ prePrevMonth + " " +
					"from trn_userActivity_tbl as UA " +
					"inner join mst_product_tbl as P " +
					"on UA.productId = P.productId " +
					"inner join mst_activity_tbl as A " +
					"on UA.activityId = A.activityId " +
					//"WHERE   UA.activityId = '"+activityId+"'/*CDF*/ " +
					"GROUP   BY /*UA.activityMonth,*/UA.productId " +
					"ORDER   BY UA.activityMonth ";

			rs = stmt.executeQuery(query);
		}
		catch (Exception e){
			System.out.println("MetrixDataController.getMetrixDataFromDb() " + e.getMessage());
		}
		return rs;
	}

	//-------------------------NEW METHODE-------------------------------------------------------
	/**
	 * This Method will return all data from DMS_tbl
	 * @return ReultSet
	 */
	public ResultSet getUserDataFromDb(String tableName, String activityId, String userId) {

		ResultSet rs = null;

		try{  
			stmt = getConnectionForDB().createStatement();

			String query = "SELECT  P.ProductName, sum(CASE WHEN UA.activityMonth = '"+ currentmonth +"' THEN (UA.activityCount) else '0' END) "+ currentmonth + ", " +
					"sum(CASE WHEN UA.activityMonth = '"+ prevMonth +"' THEN (UA.activityCount) else '0' END) "+prevMonth+", " +
					"sum(CASE WHEN UA.activityMonth = '"+ prePrevMonth +"' THEN (UA.activityCount) else '0' END) "+ prePrevMonth + " " +
					"from trn_userActivity_tbl as UA " +
					"inner join mst_product_tbl as P " +
					"on UA.productId = P.productId " +
					"inner join mst_activity_tbl as A " +
					"on UA.activityId = A.activityId " +
					//"WHERE   UA.activityId = '"+activityId +"' and UA.userId = '"+userId+"' " +
					" WHERE   UA.userId = '"+userId+"' " +
					" GROUP   BY /*UA.activityMonth,*/UA.productId " +
					" ORDER   BY UA.activityMonth ";

			rs = stmt.executeQuery(query);
			System.out.println("MetrixDataController.getMetrixDataFromDb() " +currentmonth + " "+prevMonth+ " "+ prePrevMonth);

		}
		catch (Exception e){
			System.out.println("MetrixDataController.getMetrixDataFromDb() " + e.getMessage());
		}
		return rs;
	}


	/**
	 * This Method will return all data from given table
	 * @return ReultSet
	 */
	public ResultSet getAllRecordFromTbl(String tableName){

		ResultSet rs = null;

		try{
			stmt = getConnectionForDB().createStatement(); 

			rs = stmt.executeQuery("select * from "+ tableName + " order by activityDate asc");
		}
		catch (Exception e){
			System.out.println("MetrixDataController.getAllRecordFromTbl() " + e.getMessage());
		}
		return rs;
	}


	/**
	 * This Method will return all history data from user_rerord_table
	 * @return ReultSet 
	 */
	public ResultSet getHistoryDataFromTbl(String tableName, HttpSession session){

		ResultSet rs = null;

		UserMaster userMaster = (UserMaster)session.getAttribute("UserMaster");
		String userRole = userMaster.getUserRole();
		String UserId = userMaster.getUserId();
		String whereCluase = null;

		if(userRole.equals("user")) {//if user entered then only user data else all the user data should be displayed for the admin
			whereCluase =  " where UA.userId = '"+ UserId +"'" + " order by UA.trnActivityDate desc ";
		}
		else if(userRole.equals("admin")) {
			whereCluase =  " where UA.teamId = '"+ userMaster.getTeamId() +"'" +" order by UA.trnActivityDate desc ";
		}
		else{
			whereCluase = " order by UA.trnActivityDate desc ";
		}

		String historyQuery = "select distinct USR.userName, USR.firstName as fName, USR.lastName as lName, TM.teamName, PDCT.productName, ACT.activityName, " +
				"UA.trnId, UA.activityCount, UA.activityMonth, UA.trnActivityDate , UA.userComment "+
				"from trn_useractivity_tbl as UA " + 
				" inner join mst_user_tbl as USR " + 
				" on UA.userId = USR.userId " + 
				"inner join mst_team_tbl as TM " + 
				"on TM.teamId = USR.teamId " + 
				" inner join mst_product_tbl as PDCT " + 
				" on UA.productId = PDCT.productId " + 
				" inner join mst_activity_tbl as ACT " + 
				" on UA.activityId = ACT.activityId " + whereCluase; 

		//System.out.println("Total Number of Record :---if(userRole.equals())" +" userId "+ UserId + "  " +historyQuery);

		try{ 
			stmt = getConnectionForDB().createStatement(); 

			rs = stmt.executeQuery(historyQuery);
		}  
		catch (Exception e){
			System.out.println("MetrixDataController.getHistoryDataFromTbl() " + e.getMessage());  
		}

		//System.out.println("Total Number of Record :--- Done"  ); 

		return rs;  
	}  

	/**
	 * This Method will return total number of rows from user_record_table
	 * @return int 
	 */
	public int getTotalNumberOfRows() {

		ResultSet rs = null;

		String totalRowQuery = "Select count(*) from " + Trn_TBL_USER_ACTIVITY;

		try{ 
			stmt = getConnectionForDB().createStatement(); 

			rs = stmt.executeQuery(totalRowQuery);

			while (rs.next()) {

				//System.out.println("rs.getInt(1) ------" + rs.getInt(1)); 

				return rs.getInt(1);
			}
		} 
		catch (Exception e){
			System.out.println("MetrixDataController.getTotalNumberOfRows() " + e.getMessage()); 
		}
		return 1;
	}


	/**
	 * This Method will update the DMS table data 
	 * @param Product
	 * @param DMSInvestigated
	 * @throws SQLException
	 */
	public void updateTableInDb_old(String Product, int activityCount, String Month, String tableName, String activityName, String userName) throws SQLException {

		String selectMetrixData = "select "+Month+" from "+ tableName +" where Product = '"+Product+"' ";

		stmt =  getConnectionForDB().createStatement();

		rs = stmt.executeQuery(selectMetrixData);

		while(rs.next()) { 
			monthDataFromDB = rs.getInt(Month);
		}

		int totalMonthData = monthDataFromDB + activityCount;  

		updateQuery = "update " + tableName + " set "+ Month +" = '"+totalMonthData+"' where Product = '"+Product+"' ";

		stmt =  getConnectionForDB().createStatement();

		stmt.executeUpdate(updateQuery);

		//inserting values into user record table

		String insertInUserTable = "insert into " + MetrixDataController.Trn_TBL_USER_ACTIVITY + " values ('"+userName +"', '"+activityName+"', '"+Product+"', '"+Month+"', '"+activityCount+"', '"+getDate()+"')";

		stmt.executeUpdate(insertInUserTable); 
	}

	//-------------------------NEW METHODE-------------------------------------------------------

	/**
	 * This Method will update the MetrixDataController.Trn_TBL_USERRECORD table data 
	 * @param Product
	 * @param DMSInvestigated
	 * @throws SQLException
	 */
	public void updateTableInDb(String ProductId, int activityCount, String Month, String tableName, String activityId, String userComment, String userId, String teamId, String roleId) throws SQLException {

		Connection conn = null;
		try {

			String insertQuery = "Insert into " + MetrixDataController.Trn_TBL_USER_ACTIVITY +  
					" (productId, activityId, userId, teamId, roleId, activityCount, activityMonth, userComment, trnActivityDate)" +
					" values(?,?,?,?,?,?,?,?,?)";

			conn = getConnectionForDB();
			PreparedStatement pst = conn.prepareStatement(insertQuery);
			pst.setString(1, ProductId);
			pst.setString(2, activityId);
			pst.setString(3, userId);
			pst.setString(4, teamId);
			pst.setString(5, roleId);
			pst.setString(6, Integer.toString(activityCount));
			pst.setString(7, Month);
			pst.setString(8, userComment);
			pst.setString(9, getDate());

			int numRowsChanged = pst.executeUpdate();
			System.out.println("In MetrixDataController: updateTableInDb(): Number of row affected :---" +numRowsChanged);

			pst.close();
			con.close();
		}
		catch(SQLException e){

			System.out.println("MetrixDataController: updateTableInDb():SQLException" + e.getMessage());
		}
		catch (Exception e){
			System.out.println("MetrixDataController: updateTableInDb():Exception" + e.getMessage());
		}
		finally {
			// Always close the database connection.
			try {
				if (conn != null) conn.close();
			}
			catch (SQLException ignored){
				System.out.println("MetrixDataController: updateTableInDb():finally:SQLException: "+ignored.getMessage());
			}
		}
	}

	/**
	 * This Method will add new product into master product table
	 */
	public void addNewProduct(String productId, String productName, String productDesc, String productPlatform, String releasePhase) throws SQLException {

		try {
			Connection conn = null;

			conn = getConnectionForDB();

			//conn = tapasConnectionPool(); 

			String insertQuery = "insert into " + Mst_TBL_Product + " (productId, productName, productDesc, productPlatform, releasePhase, isActive)" + " values(?,?,?,?,?,?) ";

			PreparedStatement pst = conn.prepareStatement(insertQuery);

			pst.setString(1, productId);
			pst.setString(2, productName);
			pst.setString(3, productDesc);
			pst.setString(4, productPlatform);
			pst.setString(5, releasePhase);
			pst.setString(6, "1");

			int numRowsEffected = pst.executeUpdate();

			System.out.println("In MetrixDataController: addNewProduct(): Number of row Effected :---" +numRowsEffected);

			con.close();
		} 
		catch (Exception e) {
			System.out.println("MDC :: addNewProduct() :: catch :--->" + e.getMessage()); 
			e.printStackTrace();
		} 
	} 

	/**
	 * This Method will add new product into master product table
	 */
	public void addNewActivity(String activityId, String activityName, String activityDesc, String parentActivity) throws SQLException {

		try {
			Connection conn = null;

			conn = getConnectionForDB();

			//conn = tapasConnectionPool(); 

			String insertQuery = "insert into " + Mst_TBL_Product + " (activityId, activityName, activityDesc, parentActivity, isActive)" + " values(?,?,?,?,?) ";

			PreparedStatement pst = conn.prepareStatement(insertQuery);

			pst.setString(1, activityId);
			pst.setString(2, activityName);
			pst.setString(3, activityDesc);
			pst.setString(4, parentActivity);
			pst.setString(5, "1");

			int numRowsEffected = pst.executeUpdate();

			System.out.println("In MetrixDataController: addNewActivity(): Number of row Effected :---" +numRowsEffected);

			con.close();
		} 
		catch (Exception e) {
			System.out.println("MDC :: addNewActivity() :: catch :--->" + e.getMessage()); 
			e.printStackTrace();
		} 
	} 

	/**
	 * This Method will add new user into master user table
	 */
	public void addNewUser(String userId, String userName, String password, String userRole, String LTEmail, String SonyEmail, String userWorkLocation, String teamId, String firstName,
			String lastName)  {

		try {
			Connection conn = null;

			conn = getConnectionForDB();

			//conn = tapasConnectionPool(); 

			System.out.println("In addNewUser " + userId + userName + password + userRole + LTEmail + SonyEmail + userWorkLocation + teamId + firstName + lastName);

			String insertQuery = "insert into " + Mst_TBL_USER +
					" (userId , userName, password, userRole, LTEmail, SonyEmail, userWorkLocation, teamId, firstName, lastName, isActive)" +
					" values(?,?,?,?,?,?,?,?,?,?,?) ";

			PreparedStatement pst = conn.prepareStatement(insertQuery);

			pst.setString(1, userId);
			pst.setString(2, userName);
			pst.setString(3, password);
			pst.setString(4, userRole);
			pst.setString(5, LTEmail);
			pst.setString(6, SonyEmail);
			pst.setString(7, userWorkLocation); 
			pst.setString(8, teamId);
			pst.setString(9, firstName);
			pst.setString(10, lastName);
			pst.setString(11, "1");

			int numRowsEffected = pst.executeUpdate();

			System.out.println("In MetrixDataController: addNewUser(): Number of row Effected :---" +numRowsEffected);

			con.close();
		} 
		catch (Exception e) {
			System.out.println("MDC :: addNewUser() :: catch :--->" + e.getMessage()); 
			e.printStackTrace();
		} 
	} 


	/**
	 * This Method will delete selected record from table
	 */
	public void deleteRecordFromDB(String rowId){

		//System.out.println("In MDC :: deleteRecordFromDB() :: [ rowId ]  :--->" + rowId); 

		try {
			Connection conn = null;

			conn = getConnectionForDB();

			String deleteQuery = "delete from " + Trn_TBL_USER_ACTIVITY + " where trnId = "+rowId ;
			
			Statement stmt = conn.createStatement();

			stmt.executeUpdate(deleteQuery);

			conn.close();
		} 
		catch (Exception e) {
			System.out.println("MDC :: deleteRecordFromDB() :: catch :--->" + e.getMessage()); 
			e.printStackTrace();
		} 
	}


	/**
	 * This Method will return user role 
	 */
	public ResultSet getUserRole(String userId) {

		ResultSet rs = null;

		String query = "select userRole from "+ BackendInterface.Mst_TBL_USER + " where userId = '"+userId+"' ";

		try{
			stmt = getConnectionForDB().createStatement();

			rs = stmt.executeQuery(query); 
		}
		catch (Exception e){
			System.out.println("MetrixDataController.getUserRole() " + e.getMessage());
		}
		return rs;
	}


	/**
	 * This Method will return user work location 
	 */
	public ResultSet getUserWorkLocation(String userId) {

		ResultSet rs = null;

		String query = "select userWorkLocation from "+ BackendInterface.Mst_TBL_USER + " where userId = '"+userId+"' ";

		try{
			stmt = getConnectionForDB().createStatement();

			rs = stmt.executeQuery(query); 
		}
		catch (Exception e){
			System.out.println("MetrixDataController.getUserWorkLocation() " + e.getMessage());
		}
		return rs;
	}


	/**
	 * This Method will return user work location 
	 */
	public ResultSet getUserTeam(String userId) {

		ResultSet rs = null;

		String query = "select teamName from mst_team_tbl" +
				" where teamId in " +
				" (select teamId from mst_user_tbl where userId = '"+userId+"')";

		try{
			stmt = getConnectionForDB().createStatement();

			rs = stmt.executeQuery(query); 
		}
		catch (Exception e){
			System.out.println("MetrixDataController.getUserTeam() " + e.getMessage());
		}
		return rs;
	}



	/**
	 * This Method will update user password 
	 */
	public void updateUserPassword(String newPass, String userName) {  

		System.out.println("In updateUserPassword MDC"); 

		String updateQuery = null;

		updateQuery = "update mst_user_tbl " + "set password = '"+newPass+"' where userName = '"+userName+"' "; 

		try{
			stmt = getConnectionForDB().createStatement();

			int rowAffected = stmt.executeUpdate(updateQuery);

			System.out.println("MetrixDataController.updateUserPassword():try :-->" + rowAffected);
		}
		catch (Exception e){
			System.out.println("MetrixDataController.updateUserPassword():catch :--> " + e.getMessage());
		}
	}

	/**
	 * This Method will return user role 
	 */
	public ResultSet getUserFirstNameFromUserId(String userId) {

		ResultSet rs = null;

		String query = "select firstName from "+ BackendInterface.Mst_TBL_USER + " where userId = '"+userId+"' ";

		try{
			stmt = getConnectionForDB().createStatement();

			rs = stmt.executeQuery(query); 
		}
		catch (Exception e){
			System.out.println("MetrixDataController.getUserRole() " + e.getMessage());
		}
		return rs;
	}

	/**
	 * This Method will return record of table based on user input of datebetween from date and to date 
	 */
	public ResultSet getRecordBetweenTwoDate(String fromDate, String toDate, HttpSession session) {

		System.out.println("Inside getRecordBetweenTwoDate of MDC");

		System.out.println("Inside getRecordBetweenTwoDate of MDC" + " From Date :- "+ fromDate +  " To Date :- "+ toDate);

		ResultSet rs = null;

		UserMaster userMaster = (UserMaster)session.getAttribute("UserMaster");
		String userRole = userMaster.getUserRole();
		String UserId = userMaster.getUserId();
		String whereCluase = null;

		String reqdFromDate = getProperDateForDisplayRecord(fromDate);
		String reqdToDate = getProperDateForDisplayRecord(toDate);

		System.out.println("Inside getRecordBetweenTwoDate of MDC" + "Reqd From Date :- "+ reqdFromDate +  " Reqd To Date :- "+ reqdToDate);

		whereCluase = " where UA.trnActivityDate "+ reqdFromDate +" and " + reqdToDate +" "; 

		//whereCluase = " where UA.trnActivityDate "+ fromDate/*lowerdate*/ +" and " + toDate/*higherDate*/+" "; //'yyyy-mm-dd'

		if(userRole.equals("user")) {	//if user entered then only user data else all the user data should be displayed for the admin
			whereCluase =  " and UA.userId = '"+ UserId +"'" + " order by UA.trnActivityDate desc ";
		}
		else if(userRole.equals("admin")) {
			whereCluase =  " and UA.teamId = '"+ userMaster.getTeamId() +"'" +" order by UA.trnActivityDate desc ";
		}
		else{
			whereCluase = " order by UA.trnActivityDate desc ";
		}

		String historyQuery = "select distinct USR.userName, USR.firstName as fName, USR.lastName as lName, TM.teamName, PDCT.productName, ACT.activityName, " +
				"UA.activityCount, UA.activityMonth, UA.trnActivityDate , UA.userComment "+
				"from trn_useractivity_tbl as UA " + 
				" inner join mst_user_tbl as USR " + 
				" on UA.userId = USR.userId " + 
				"inner join mst_team_tbl as TM " + 
				"on TM.teamId = USR.teamId " + 
				" inner join mst_product_tbl as PDCT " + 
				" on UA.productId = PDCT.productId " + 
				" inner join mst_activity_tbl as ACT " + 
				" on UA.activityId = ACT.activityId " + whereCluase; 

		try{ 
			stmt = getConnectionForDB().createStatement(); 

			//stmt = tapasConnectionPool().createStatement();

			rs = stmt.executeQuery(historyQuery);
		}  
		catch (Exception e){
			System.out.println("MetrixDataController.getHistoryDataFromTbl() " + e.getMessage());  
		}

		System.out.println("Total Number of Record :--- Done"  ); 

		return rs;  
	}

	/**
	 * This Method will convert mm/dd/yyyy to yyyy-mm-dd
	 */
	public String getProperDateForDisplayRecord(String userDate) {

		String convertedDate =  null;
		DateFormat userDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		DateFormat dateFormatNeeded = new SimpleDateFormat("yyyy-MM-dd");

		Date date;
		try {
			date = userDateFormat.parse(userDate);
			convertedDate = dateFormatNeeded.format(date);
		} 
		catch (ParseException e) {
			e.printStackTrace();
		}
		return convertedDate;
	}


	/**
	 * This Method will return user firstName from userName in mst_user_tbl table 
	 */
	public ResultSet getFirstNameFromUserName(String userName) {

		ResultSet rs = null;

		//String query = "select firstName from "+ BackendInterface.Mst_TBL_USER + " where userId = '"+userId+"' ";

		String query =  "select firstName from " + Mst_TBL_USER  + " where userName = '"+userName+"' ";

		try{
			stmt = getConnectionForDB().createStatement();

			rs = stmt.executeQuery(query); 
		}
		catch (Exception e){
			System.out.println("MetrixDataController.getUserRole() " + e.getMessage());
		}
		return rs;
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
	 * This Method will return current month 
	 */
	@SuppressWarnings("unused")
	public ResultSet getRunningMonth() {

		ResultSet rs = null;

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date date = new Date();

		String currMonth  = dateFormat.format(date); 

		System.out.println("currDate time :------" + currMonth); 

		String query = "select MONTHNAME('currMonth') from DUAL";

		//return dateFormat.format(date);

		try{
			stmt = getConnectionForDB().createStatement();
			rs = stmt.executeQuery(query); 

			while(rs.next()) { 
				String cu = rs.getString(0);
			}
		}
		catch (Exception e){
			System.out.println("MetrixDataController.getRunningMonth() " + e.getMessage());
		}
		return rs;
	}
}