package app.servlet;

import java.util.Date;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

public class DurationTime {
	
	public static String findDifference(Date d1, Date d2) {
		String str = "";
		try {

			long difference_In_Time = d2.getTime() - d1.getTime();

			long difference_In_Seconds = (difference_In_Time / 1000) % 60;

			long difference_In_Minutes = (difference_In_Time / (1000 * 60)) % 60;

			long difference_In_Hours = (difference_In_Time / (1000 * 60 * 60)) % 24;

		//	long difference_In_Years = (difference_In_Time / (1000l * 60 * 60 * 24 * 365));

			long difference_In_Days = (difference_In_Time / (1000 * 60 * 60 * 24)) % 365;


			str = difference_In_Days + "D: " + difference_In_Hours
					+ "h: " + difference_In_Minutes + "m: " + difference_In_Seconds + "s";
			
		}
		catch (ParseException e) {
			e.printStackTrace();
		}
		return str;
	}
}
