package com.hk.whome.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateUtils {

	/**
	 * 두 날짜 사이의  날짜들을 구하는 매서드
	 * @param dates 
	 * @param start 시작 날짜
	 * @param end 종료 날짜
	 * @return
	 * @throws ParseException
	 */
	public static List<String> getBetweenDay(List<String> dates, String start, String end) throws ParseException{

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		try {
			
			Date startDate = sdf.parse(start);
			Date endDate = sdf.parse(end);
			
			while(startDate.compareTo(endDate) <= 0) {
				dates.add(sdf.format(startDate));
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(startDate);
				cal.add(Calendar.DAY_OF_MONTH, 1);
				
				startDate = cal.getTime();
			}
		} 
		catch (ParseException e) {
			e.printStackTrace();
		}
		return dates;
	}
	
	
}
