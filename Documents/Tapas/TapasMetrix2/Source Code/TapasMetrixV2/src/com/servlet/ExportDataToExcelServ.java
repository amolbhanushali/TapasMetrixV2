package com.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;     
import java.sql.SQLException;             
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import com.bean.HistoryColumnBean;        
import com.bean.UserMaster;             
import com.util.Utility;
import org.apache.poi.ss.usermodel.Row;    

/**
 * Servlet implementation class ExportDataToExcelServ
 * 
 * This servlet is responsible to generate web page data to excel file.
 * 
 * Developer: SANDIP RANJAN and AMOL BHANUSHALI
 */
@WebServlet("/ExportDataToExcelServ")
public class ExportDataToExcelServ extends HttpServlet {

	private static final long serialVersionUID = 1L;
	//public static String filePath = null;
	File subDir = null;
	File dirr = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExportDataToExcelServ() {
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
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//System.out.println("In doPost of ExportDataToExcelServ");

		HttpSession session = request.getSession();

		try {
			UserMaster userMaster = Utility.getUserMaster(session);
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
			//con = DriverManager.getConnection("jdbc:mysql://10.7.223.104:3306/cncmetrics", "root", "root"); // Commented on 2 July 2013

			//con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cncmetrics", "root", "root");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/slm", "root", "root");
			// jdbc:mysql://127.0.0.1:3306/cncmetrics

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
			generateExcel(list,response);


			/*			File outFile = new File(subDir + "/TapasMetricsRecord.xls"); 
			response.flushBuffer();
			String filename = outFile.getName();
			response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
			 */			
			FileInputStream inputStream = new FileInputStream(subDir + "/TapasMetricsRecord.xls");  //read the file

			response.setHeader("Content-Disposition","attachment; filename=TapasReport.xls");
			try {
				int c;
				while ((c = inputStream.read()) != -1) {
					response.getWriter().write(c);
				}
			} finally {
				if (inputStream != null) 
					inputStream.close();
				// response.getWriter().close(); // Commented on 11 july 2013 6:02 PM
			}

			response.sendRedirect(request.getContextPath()+"/pages/MatrixMainPage.jsp") ;
			response.getWriter().close();
		} 
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "deprecation", "rawtypes" })
	public void generateExcel(ArrayList results,HttpServletResponse res) {

		HSSFWorkbook l_workBook_out = new HSSFWorkbook();
		HSSFSheet sheet = l_workBook_out.createSheet("HistoryRecords");

		Row row1 = sheet.createRow((short)0); 
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
		int rowCounter = 1;
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
			cell.setCellValue(String.valueOf(rowCounter));

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
		writeExcel(l_workBook_out,res);

	} 



	public void writeExcel(HSSFWorkbook bookOut,HttpServletResponse response) { 

		String metricsPath = System.getProperty("user.home");

		/*		String ServerAddress = "10.7.223.66";
		String		ServerPort = "8080";

		try {
			Properties props = new Properties();
			props.setProperty("ServerAddress", ServerAddress);
			props.setProperty("ServerPort", ""+ ServerPort);
			File f = new File("server.properties");
			//OutputStream out = new FileOutputStream( f );
			//props.store(out, "This is an optional header comment string");
		}
		catch (Exception e ) {
			e.printStackTrace();
		}*/

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh mm ss");
		String formattedDate = sdf.format(date);

		dirr = new File(metricsPath + "/Tapas Metrics Data");  

		if(dirr.exists()){
			System.out.println("A folder with name 'Tapas Metrics Data' is already exist in the path");
		} 
		else{  
			dirr.mkdir();
		}  

		subDir = new File(dirr + "/" + formattedDate);  
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
			bookOut.write(fileOut);

			System.out.println("File Path :------ "+ outFile.getAbsolutePath());

			fileOut.close();

			//filePath = outFile.getAbsolutePath();
			//System.out.println("File Path in Servlet :------ > "+ filePath); 
		} 
		catch (FileNotFoundException e) { 
			e.printStackTrace();
		}  
		catch (IOException e) { 
			e.printStackTrace();
		}
	}

	private static Object checkForNull(Object obj) {
		if(obj == null) {
			return "";
		}
		else {
			return obj;
		}
	}
}