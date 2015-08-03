<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.FileNotFoundException" %>
<%@page import="java.io.FileOutputStream" %>
<%@page import="java.io.IOException" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="java.io.File" %>
<%@page import="java.util.HashMap" %>
<%@page import=" java.util.Iterator" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell" %>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle" %>
<%@page import="org.apache.poi.hssf.usermodel.HSSFFont" %>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow" %>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
<%@page import="com.bean.HistoryColumnBean" %>
<%@page import="com.bean.UserMaster" %>
<%@page import="org.apache.poi.ss.usermodel.Row"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Export Result Set</title>
</head>
<body>

<%

try {
	UserMaster userMaster = (UserMaster)session.getAttribute("UserMaster");
	String userRole = userMaster.getUserRole();
	String UserId = userMaster.getUserId();
	String whereCluase = null;

	if(userRole.equals("user")) {
		whereCluase =  " where UA.userId = '"+ UserId +"'" + " order by UA.trnActivityDate desc ";
	}
	else if(userRole.equals("admin")) {
		whereCluase =  " where UA.teamId = '"+ userMaster.getTeamId() +"'" +" order by UA.trnActivityDate desc ";
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

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = null;
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cncmetrics", "root", "root");

	PreparedStatement pstmt = con.prepareStatement(historyQuery);
	ResultSet rs = pstmt.executeQuery();
	ArrayList list = new ArrayList(); 
	
	while(rs.next()){
		HistoryColumnBean idB = new HistoryColumnBean();
		
		idB.setColumn1(rs.getString("fName")) ;			// name
		idB.setColumn2(rs.getString("teamName"));		// team
		idB.setColumn3(rs.getString("productName"));	// product
		idB.setColumn4(rs.getString("activityName"));	// activity
		idB.setColumn5(rs.getInt("activityCount"));		// count activity
		idB.setColumn6(rs.getString("activityMonth"));	// month
		idB.setColumn7(rs.getString("userComment"));	// comment
		idB.setColumn8(rs.getDate("trnActivityDate"));	// date
		list.add(idB);    
	}
	generateExcel(list);
} 
catch (ClassNotFoundException e) {
	e.printStackTrace();
} 
catch (SQLException e) {
	e.printStackTrace();
}
%>

<%!
public static void generateExcel(ArrayList results) {

	HSSFWorkbook l_workBook_out = new HSSFWorkbook();
	HSSFSheet sheet = l_workBook_out.createSheet("HistoryRecords");
	
	  HSSFRow row1 = sheet.createRow((short)0);
      row1.createCell(0).setCellValue("SNo");
      row1.createCell(1).setCellValue("Name");
      row1.createCell(2).setCellValue("Team");
      row1.createCell(3).setCellValue("Product");
      row1.createCell(4).setCellValue("Activity");
      row1.createCell(5).setCellValue("Count");
      row1.createCell(6).setCellValue("Month");
      row1.createCell(7).setCellValue("Comment");
      row1.createCell(8).setCellValue("Date");

	Iterator Itr = results.iterator();
	HSSFRow row;
	int rowCounter = 0;
	sheet.setDefaultRowHeightInPoints(2000);

	sheet.setColumnWidth((short)1, (short)3000); //S no
	sheet.setColumnWidth((short)2, (short)5000); //name
	sheet.setColumnWidth((short)3, (short)3000); //team
	sheet.setColumnWidth((short)4, (short)5000); //product
	sheet.setColumnWidth((short)5, (short)9000); //activity
	sheet.setColumnWidth((short)6, (short)2000); //count 
	sheet.setColumnWidth((short)7, (short)5000); //month
	sheet.setColumnWidth((short)8, (short)7000); //comment
	sheet.setColumnWidth((short)9, (short)3000); //Date 

	HSSFCellStyle cellStyle = l_workBook_out.createCellStyle();
	cellStyle.setWrapText(true); 

	//Create Font
	HSSFFont l_font = l_workBook_out.createFont();
	l_font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

	while(Itr.hasNext()) {

		HistoryColumnBean idB = (HistoryColumnBean)Itr.next();

		if(results == null) {
			System.out.println("No results for the given query");
			continue;
		}
		row = sheet.createRow(rowCounter);
		row.setHeightInPoints((float)25.25);
		int cellCounter = 0;
		HSSFCell cell;

		//S no   
		cell = row.createCell((short) cellCounter);
		cell.setCellValue(String.valueOf(rowCounter+1));

		//Date (optional)
		/* cellCounter++;
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String date = sdf.format(d);
		cell = row.createCell((short) cellCounter);
		cell.setCellValue(date); */

		//column1
		cellCounter++;
		cell = row.createCell((short) cellCounter);
		cell.setCellValue(String.valueOf(checkForNull(idB.getColumn1())));   

		//column2
		cellCounter++;
		cell = row.createCell((short) cellCounter);   
		cell.setCellValue(String.valueOf(checkForNull(idB.getColumn2())));

		//column3
		cellCounter++;
		cell = row.createCell((short) cellCounter);
		cell.setCellValue(String.valueOf(checkForNull(idB.getColumn3())));

		//column4
		cellCounter++;
		cell = row.createCell((short) cellCounter);
		cell.setCellValue(String.valueOf(checkForNull(idB.getColumn4())));


		//column5
		cellCounter++;
		cell = row.createCell((short) cellCounter);
		cell.setCellValue(String.valueOf(checkForNull(idB.getColumn5())));


		//column6
		cellCounter++;
		cell = row.createCell((short) cellCounter);
		cell.setCellValue(String.valueOf(checkForNull(idB.getColumn6())));


		//column7
		cellCounter++;
		cell = row.createCell((short) cellCounter);
		cell.setCellValue(String.valueOf(checkForNull(idB.getColumn7())));


		//column8
		cellCounter++;
		cell = row.createCell((short) cellCounter);
		cell.setCellValue(String.valueOf(checkForNull(idB.getColumn8())));

		rowCounter++;
	}
	writeExcel(l_workBook_out); 
	
} 

%>

<%!
private static void writeExcel(HSSFWorkbook l_workBook_out) { 
	
	/* String l_str_file_out = "D:/HistoryDataResults.xls"; 
	
	FileOutputStream fileOut;
	try {
		fileOut = new FileOutputStream(l_str_file_out);
		l_workBook_out.write(fileOut);
		fileOut.close();
	} 
	catch (FileNotFoundException e) {
		e.printStackTrace();
	} 
	catch (IOException e) {
		e.printStackTrace();
	} */
	 
	
	String metricsPath = System.getProperty("user.home");
	
	//String metricsPath = "M:/10.7.223.66";

	Date date = new Date();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhmmss");
	 
	String formattedDate = sdf.format(date);

	File dirr = new File(metricsPath + "/Tapas Metrics"); 
	if(dirr.exists()){
		System.out.println("A folder with name 'Tapas Metrics' is already exist in the path");
	} 
	else{  
		dirr.mkdir();
	}  

	File subDir = new File(dirr + "/" + formattedDate); 
	if(subDir.exists()){
		System.out.println("A folder with same timestamp is already exist in the path ");
	}
	else{
		subDir.mkdir();
	}

	File outFile = new File(subDir + "/TapasMetricsRecord.xls");  

	FileOutputStream fileOut;
	try {
		fileOut = new FileOutputStream(outFile);
		l_workBook_out.write(fileOut);
		fileOut.close();
	} 
	catch (FileNotFoundException e) { 
		e.printStackTrace();
	}  
	catch (IOException e) { 
		e.printStackTrace();
	}
}
%>

<%!
	private static Object checkForNull(Object obj) {
		if(obj == null) {
			return "";
		}
		else {
			return obj;
		}
	} 
%>

</body>
</html>