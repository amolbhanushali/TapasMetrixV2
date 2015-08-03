<%@page import="com.servlet.ExportDataToExcelServ"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		try {

			/* String filePath = ExportDataToExcelServ.filePath;
			
			String fileName = "TapasMetricsRecord.xls";
			
			System.out.println("File Path in JSP :------>" +filePath); 
			
			System.out.println("File Name in JSP :------>" +fileName); 

			response.setContentType("application/vnd.ms-excel");

			response.setHeader("Content-disposition", "attachment; fileName=\"" + fileName + "\"");

			FileInputStream fis = new FileInputStream(filePath);

			int i = 0;

			while ((i = fis.read()) != -1) {
 
				out.write(i);

				//fis.close();
			}
			/* 
			 BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	          byte by[] = new byte[32768];
	          int index = fis.read(by, 0, 32768);
	          while (index != -1) {
	              index = fis.read(by, 0, 32768);
	          } */
	      /*     fis.close();
	          out.flush();  */ 
		} 
	catch (Exception e) {

			e.printStackTrace();

		}
	%>

</body>
</html>