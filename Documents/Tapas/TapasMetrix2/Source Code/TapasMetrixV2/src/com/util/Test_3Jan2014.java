package com.util;

import java.util.Calendar;

public class Test_3Jan2014 {

	static String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

	static String currentMonth = null; 
	static String previousMonth = null;
	static String nextMonth = null;

	public static void main(String[] args) {

		System.out.println("Current month : " + getCurrentMonth());

		System.out.println("Previous month : " + getPreviousMonth());

		System.out.println("Next month : " + getNextMonth());

		System.out.println("Pre Previous month : " + getPrePreviousMonth());

		/*Calendar cal = Calendar.getInstance();    

		int year = cal.get(cal.YEAR);  
		int month = cal.get(cal.MONTH)+1; //zero-based  
		System.out.println("year = "+year+"\nmonth = "+month);


		Calendar cal1 =  Calendar.getInstance();
		cal1.add(Calendar.MONTH ,-1);
		//format it to MMM-yyyy // January-2012
		String previousMonthYear  = new SimpleDateFormat("MMM-yyyy").format(cal1.getTime());
		System.out.println("Prevs month : " + previousMonthYear);*/
	}

	public static String getCurrentMonth() {

		Calendar cal = Calendar.getInstance();    

		currentMonth = months[cal.get(Calendar.MONTH)];

		return currentMonth;
	} 

	public static String getPreviousMonth() {

		Calendar cal = Calendar.getInstance();  

		int monthsToDecrement = -1;
		cal.add(Calendar.MONTH, monthsToDecrement);
		//System.out.println("Date after decrement: " + cal.getTime());

		previousMonth = months[cal.get(Calendar.MONTH)];

		return previousMonth;
	} 

	public static String getNextMonth() {

		Calendar cal = Calendar.getInstance();  

		nextMonth = months[cal.get(Calendar.MONTH) + 1 ];

		return nextMonth;
	} 

	public static String getPrePreviousMonth() {

		Calendar cal = Calendar.getInstance();  

		int monthsToDecrement = -2;
		cal.add(Calendar.MONTH, monthsToDecrement);

		previousMonth = months[cal.get(Calendar.MONTH)];

		return previousMonth;
	} 
}