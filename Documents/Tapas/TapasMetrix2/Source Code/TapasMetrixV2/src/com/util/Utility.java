package com.util;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import com.bean.UserMaster;
import com.dao.MetrixDataController;

public class Utility {

	static String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

	static String currentMonth = null; 

	static String nextMonth = null;
	
	static String previousMonth = null;
	
	static MetrixDataController mdc = new MetrixDataController();

	public static <T, E> T getKeyByValue(Map<T, E> map, E value) {
		for (Entry<T, E> entry : map.entrySet()) {
			if (value.equals(entry.getValue())) {
				return entry.getKey();
			}
		} 
		return null;
	}

	public static String getCurrentMonth() {

		
		Calendar cal = Calendar.getInstance();    
 
		currentMonth = months[cal.get(Calendar.MONTH)];

		return currentMonth;
	}  

	public static String getNextMonth() {
  
		Calendar cal = Calendar.getInstance();  

		nextMonth = months[cal.get(Calendar.MONTH) + 1 ];

		return nextMonth;
	} 
	
	public static String getPreviousMonth() {

		Calendar cal = Calendar.getInstance();  

		//previousMonth = months[cal.get(Calendar.MONTH) - 1 ];
		
		int monthsToDecrement = -1;
		cal.add(Calendar.MONTH, monthsToDecrement);
		//System.out.println("Date after decrement: " + cal.getTime());

		previousMonth = months[cal.get(Calendar.MONTH)];

		return previousMonth;
	} 
	
	public static String getPrePreviousMonth() {

		Calendar cal = Calendar.getInstance();  

		//previousMonth = months[cal.get(Calendar.MONTH) - 2 ];
		
		int monthsToDecrement = -2;
		cal.add(Calendar.MONTH, monthsToDecrement);

		previousMonth = months[cal.get(Calendar.MONTH)];

		return previousMonth;
	} 
	
	/*public static String getRunningMonth() {
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date date = new Date();
		
		String mo = dateFormat.format(date); 
		
		System.out.println("mo " + mo);  

		String query = "select MONTHNAME()";

		return dateFormat.format(date);
	}*/
	
	
	public static void main(String[] args) {
		
		System.out.println(getPreviousMonth());
		System.out.println(getCurrentMonth()); 
		System.out.println(getNextMonth());
		//System.out.print(getRunningMonth());
		
		System.out.println("dddddddddddd" + mdc.getRunningMonth());
	}


	public String getProperDateForDisplayRecord(String userDate) {

		String convertedDate =  null;
		String dateReceivedFromUser = "12/13/2012";
		DateFormat userDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		DateFormat dateFormatNeeded = new SimpleDateFormat("yyyy-mm-dd");

		Date date;
		try {
			date = userDateFormat.parse(dateReceivedFromUser);
			convertedDate = dateFormatNeeded.format(date);
		} 
		catch (ParseException e) {
			e.printStackTrace();
		}
		return convertedDate;
	}


	public static UserMaster getUserMaster(HttpSession session){
		
		UserMaster userMaster = (UserMaster)session.getAttribute("UserMaster");
		return userMaster;
		
	}
}