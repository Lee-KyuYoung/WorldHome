package com.hk.whome.domain;
import java.sql.Timestamp;

public class HomeReviewDomain {
	
	private String homeID;
	private String userID;
	private String reviewID;
	private String reviewComm;
	private String userImg;
	private String strRegDate;
	private Timestamp regDate;
	private Timestamp modDate;
	private int scoreCL; //청결도 평점
	private int scoreA; //정확도 평점
	private int scoreC; //의사소통 평점
	private int scoreL; //위치 평점
	private int scoreCI; //체크인 평점
	private int scoreS; // 가격대비 만족 평점

	public String getStrRegDate() {
		return strRegDate;
	}
	public void setStrRegDate(String strRegDate) {
		this.strRegDate = strRegDate;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public String getHomeID() {
		return homeID;
	}
	public void setHomeID(String homeID) {
		this.homeID = homeID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getReviewID() {
		return reviewID;
	}
	public void setReviewID(String reviewID) {
		this.reviewID = reviewID;
	}
	public String getReviewComm() {
		return reviewComm;
	}
	public void setReviewComm(String reviewComm) {
		this.reviewComm = reviewComm;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Timestamp getModDate() {
		return modDate;
	}
	public void setModDate(Timestamp modDate) {
		this.modDate = modDate;
	}
	public int getScoreCL() {
		return scoreCL;
	}
	public void setScoreCL(int scoreCL) {
		this.scoreCL = scoreCL;
	}
	public int getScoreA() {
		return scoreA;
	}
	public void setScoreA(int scoreA) {
		this.scoreA = scoreA;
	}
	public int getScoreC() {
		return scoreC;
	}
	public void setScoreC(int scoreC) {
		this.scoreC = scoreC;
	}
	public int getScoreL() {
		return scoreL;
	}
	public void setScoreL(int scoreL) {
		this.scoreL = scoreL;
	}
	public int getScoreCI() {
		return scoreCI;
	}
	public void setScoreCI(int scoreCI) {
		this.scoreCI = scoreCI;
	}
	public int getScoreS() {
		return scoreS;
	}
	public void setScoreS(int scoreS) {
		this.scoreS = scoreS;
	}

}
