package com.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MetrixServ
 */
/**
 * 
 * @author Sandip Kumar Ranjan  && Amol Bhanushali
 *
 */
@WebServlet("/MetrixServ")
public class MetrixServ extends HttpServlet {

	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String Product = request.getParameter("Product");

		int CDF_Created = Integer.parseInt(request.getParameter("CDF_Created"));

		int Sanity_Test = Integer.parseInt(request.getParameter("Sanity_Test"));

		int DMS = Integer.parseInt(request.getParameter("DMS"));

		int Kitting = Integer.parseInt(request.getParameter("Kitting"));

		int Onsite_support = Integer.parseInt(request.getParameter("Onsite_support"));

		int Doc_Report = Integer.parseInt(request.getParameter("Doc_Report"));


		String driverName = "com.mysql.jdbc.Driver";
		String connectionURL = "jdbc:mysql://localhost:3306/customization_metrixDB";
		String username = "root";
		String password = "root";

		PrintWriter out = response.getWriter();
		Connection con = null;
		Statement stmt = null;

		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(connectionURL, username, password);

			stmt = con.createStatement();

			String insertQuery = "insert into Metrix_tbl values ('"+Product+"' , " +
					""+CDF_Created+" , '"+Sanity_Test+"', '"+DMS+"', '"+Kitting+"', '"+Onsite_support+"', '"+Doc_Report+"')";

			stmt.executeUpdate(insertQuery);
			con.close();
			out.println("User data successfully saved into database.");
		} 
		catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MetrixServ() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}