package com.hk.whome.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.hk.whome.domain.HomeReservationDomain;
import com.hk.whome.domain.HomeReviewDomain;

@Service
@Transactional(value="transactionManager", rollbackFor = {Exception.class})
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDAO reservationDAO;

	@Override
	public void insertReview(HomeReviewDomain homeReviewDomain) {
		reservationDAO.insertReview(homeReviewDomain);
	}

	@Override
	public List<HomeReviewDomain> getReviewList(Model model) {
		return reservationDAO.getReviewList(model);
	}

	@Override
	public Map<String, String> getReviewStarRate(String homeID) {
		return reservationDAO.getReviewStarRate(homeID);
	}

	@Override
	public void insertHomeReservation(HomeReservationDomain homeReservationDomain) {
		reservationDAO.insertHomeReservation(homeReservationDomain);
	}

	@Override
	public List<HomeReservationDomain> getHomeReservationList(Model model) {
		return reservationDAO.getHomeReservationList(model);
	}

	@Override
	public int getHomeReservationCnt(Model model) {
		return reservationDAO.getHomeReservationCnt(model);
	}

	@Override
	public List<Map<String,String>> getReservDate(String homeID) {
		return reservationDAO.getReservDate(homeID);
	}

	
}
