package com.hk.whome.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.hk.whome.domain.HomeReviewDomain;

public interface ReservationService {

	public void insertReview(HomeReviewDomain homeReviewDomain);	
	
	public List<HomeReviewDomain> getReviewList(Model model);
	
	public Map<String,String> getReviewStarRate(String homeID);
}
