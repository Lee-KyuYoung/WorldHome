package com.hk.whome.reservation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.hk.whome.domain.HomeReviewDomain;

@Repository
public class ReservationDAOImpl implements ReservationDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertReview(HomeReviewDomain homeReviewDomain) {
		sqlSession.insert("com.hk.whome.reservation.sql.insertReview",homeReviewDomain);
	}

	@Override
	public List<HomeReviewDomain> getReviewList(Model model) {
		return sqlSession.selectList("com.hk.whome.reservation.sql.getReviewList",model);
	}

	@Override
	public Map<String, String> getReviewStarRate(String homeID) {
		return sqlSession.selectOne("com.hk.whome.reservation.sql.getReviewStarRate",homeID);
	}
	
	
	
}	
