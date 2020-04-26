package com.hk.whome.reservation;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hk.whome.domain.HomeReviewDomain;
import com.hk.whome.domain.PagingDomain;
import com.hk.whome.util.EmptyUtils;

@Controller
@RequestMapping(value = "/reservation")
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	private final int PAGE_SIZE = 5;
	private final int LIST_SIZE = 6;
	
	/**
	 * 숙소 리뷰 등록
	 * @param paramMap
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public Map<String,String> insertReview(@RequestParam Map<String,String> paramMap, Model model){
		
		String resCode = "";
		String homeID = paramMap.get("home_id");
		String userID = paramMap.get("user_id");
		String reviewID = paramMap.get("review_id");
		String reviewComm = paramMap.get("home_review");
		String scoreCL = paramMap.get("cleanliness");
		String scoreA = paramMap.get("accuracy");
		String scoreC = paramMap.get("communication");
		String scoreL = paramMap.get("location");
		String scoreCI = paramMap.get("check_in");
		String scoreS = paramMap.get("satisfaction");
		
		if(EmptyUtils.isEmpty(homeID)) {
			resCode = "E002";
		}
		else if(EmptyUtils.isEmpty(userID)) {
			resCode = "E003";
		}
		else if(EmptyUtils.isEmpty(reviewID)) {
			resCode = "E004";	
		}
		else if(EmptyUtils.isEmpty(reviewComm)) {
			resCode = "E005";
		}
		else if(EmptyUtils.isEmpty(scoreCL) || EmptyUtils.isEmpty(scoreA) || EmptyUtils.isEmpty(scoreC) || EmptyUtils.isEmpty(scoreL) || 
				EmptyUtils.isEmpty(scoreCI) || EmptyUtils.isEmpty(scoreS)) {
			resCode = "E006";
		}
		
		if(resCode.equals("")) {
			
			HomeReviewDomain homeReviewDomain = new HomeReviewDomain();
			homeReviewDomain.setHomeID(homeID);
			homeReviewDomain.setUserID(userID);
			homeReviewDomain.setReviewID(reviewID);
			homeReviewDomain.setReviewComm(reviewComm);
			homeReviewDomain.setScoreA(Integer.parseInt(scoreA));
			homeReviewDomain.setScoreCL(Integer.parseInt(scoreCL));
			homeReviewDomain.setScoreC(Integer.parseInt(scoreC));
			homeReviewDomain.setScoreL(Integer.parseInt(scoreL));
			homeReviewDomain.setScoreCI(Integer.parseInt(scoreCI));
			homeReviewDomain.setScoreS(Integer.parseInt(scoreS));
			
			try {
				reservationService.insertReview(homeReviewDomain);

			} catch (Exception e) {
				e.printStackTrace();
				resCode= "E007";
			}
		}
		Map<String,String> resMap = new HashMap<>();
		resMap.put("resCode", resCode);
		
		model.addAttribute("resDate",resMap);
		
		return resMap;
	}
	
	/**
	 * 숙소 리뷰 가져오기
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getReviewList", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String getReviewList(@RequestParam Map<String,String> paramMap){
		
		int pageNo = EmptyUtils.isEmpty(paramMap.get("page_no")) ? 1 : Integer.parseInt(paramMap.get("page_no"));
		String homeID = paramMap.get("home_id");
		
		//별점 정보 및 후기 개수
		Map<String,String> starRate = reservationService.getReviewStarRate(homeID);
		
		int totalCount = 0;
		if(!EmptyUtils.isEmpty(starRate)) {
			totalCount = Integer.parseInt(String.valueOf(starRate.get("TOTAL_COUNT")));
		}
		
		//페이징 처리
		PagingDomain paging = new PagingDomain(pageNo, PAGE_SIZE, LIST_SIZE,totalCount);
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>  "+paging.toString());
		
		Model getReviewParamModel = new ExtendedModelMap();
		getReviewParamModel.addAttribute("homeID",homeID);
		getReviewParamModel.addAttribute("startListNo" , paging.getStartListNo());
		getReviewParamModel.addAttribute("endListNo" , paging.getEndListNo());

		//리뷰 리스트
		List<HomeReviewDomain> reviewList = reservationService.getReviewList(getReviewParamModel);
		
		//리뷰 작성 날짜 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일");
		for(HomeReviewDomain review : reviewList) {
			review.setStrRegDate(sdf.format(review.getRegDate()));
		}
		
		Map<String,Object> resMap = new HashMap<>();
		resMap.put("review_list", reviewList);
		resMap.put("star_rate", starRate);
		resMap.put("paging", paging);
		
		return new Gson().toJson(resMap).toString();
	}
}
