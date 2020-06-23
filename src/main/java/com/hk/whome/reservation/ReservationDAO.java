package com.hk.whome.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.hk.whome.domain.HomeReservationDomain;
import com.hk.whome.domain.HomeReviewDomain;

public interface ReservationDAO{

	public void insertReview(HomeReviewDomain homeReviewDomain);
	
	public List<HomeReviewDomain> getReviewList(Model model);
	
	public Map<String,String> getReviewStarRate(String homeID);
	
	public void insertHomeReservation(HomeReservationDomain homeReservationDomain);
	
	public List<HomeReservationDomain> getHomeReservationList(Model model);
	
	public int getHomeReservationCnt(Model model);
	
	public List<Map<String,String>> getReservDate(String homeID);
}
