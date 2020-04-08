package com.hk.whome.domain;

import java.sql.Timestamp;

public class HomeInfoDomain {

	private String homeID;
	private String userID;
	private String homeAddr1;
	private String homeAddr2;
	private String homePostCode;
	private String homeTitle;
	private String homeComment;
	private String homeETCComment;
	private String homeType;
	private String homemaxGuest;
	private String homeTraffic;
	private String homeSurround;
	private String homeFacility;
	private String homeGuestRule;
	private String homePrecaution;
	private String homeAvailableReservStartDay;
	private String homeAvailableReservEndDay;
	private int highPay;
	private int rowPay;
	private int homeReserveCnt;
	private int homeViCnt;
	private int homeBathroomCnt;
	private int homeBedCnt;
	private String DelYN;
	private String homeRegStep;
	private Timestamp homeModDate;
	private Timestamp homeRegData;
	private String homeIsOnlyGuest;
	private String homeRange;

	
	public String getHomeAvailableReservStartDay() {
		return homeAvailableReservStartDay;
	}
	public void setHomeAvailableReservStartDay(String homeAvailableReservStartDay) {
		this.homeAvailableReservStartDay = homeAvailableReservStartDay;
	}
	public String getHomeAvailableReservEndDay() {
		return homeAvailableReservEndDay;
	}
	public void setHomeAvailableReservEndDay(String homeAvailableReservEndDay) {
		this.homeAvailableReservEndDay = homeAvailableReservEndDay;
	}
	public String getHomeGuestRule() {
		return homeGuestRule;
	}
	public void setHomeGuestRule(String homeGuestRule) {
		this.homeGuestRule = homeGuestRule;
	}
	public String getHomePrecaution() {
		return homePrecaution;
	}
	public void setHomePrecaution(String homePrecaution) {
		this.homePrecaution = homePrecaution;
	}
	public String getHomeETCComment() {
		return homeETCComment;
	}
	public void setHomeETCComment(String homeETCComment) {
		this.homeETCComment = homeETCComment;
	}
	public String getHomeFacility() {
		return homeFacility;
	}
	public void setHomeFacility(String homeFacility) {
		this.homeFacility = homeFacility;
	}
	public String getHomePostCode() {
		return homePostCode;
	}
	public void setHomePostCode(String homePostCode) {
		this.homePostCode = homePostCode;
	}
	public int getHomeBathroomCnt() {
		return homeBathroomCnt;
	}
	public void setHomeBathroomCnt(int homeBathroomCnt) {
		this.homeBathroomCnt = homeBathroomCnt;
	}
	public int getHomeBedCnt() {
		return homeBedCnt;
	}
	public void setHomeBedCnt(int homeBedCnt) {
		this.homeBedCnt = homeBedCnt;
	}
	public String getHomemaxGuest() {
		return homemaxGuest;
	}
	public void setHomemaxGuest(String homemaxGuest) {
		this.homemaxGuest = homemaxGuest;
	}
	public String getHomeRange() {
		return homeRange;
	}
	public void setHomeRange(String homeRange) {
		this.homeRange = homeRange;
	}
	public String getHomeType() {
		return homeType;
	}
	public void setHomeType(String homeType) {
		this.homeType = homeType;
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
	public String getHomeAddr1() {
		return homeAddr1;
	}
	public void setHomeAddr1(String homeAddr1) {
		this.homeAddr1 = homeAddr1;
	}
	public String getHomeAddr2() {
		return homeAddr2;
	}
	public void setHomeAddr2(String homeAddr2) {
		this.homeAddr2 = homeAddr2;
	}
	public String getHomeTitle() {
		return homeTitle;
	}
	public void setHomeTitle(String homeTitle) {
		this.homeTitle = homeTitle;
	}
	public String getHomeComment() {
		return homeComment;
	}
	public void setHomeComment(String homeComment) {
		this.homeComment = homeComment;
	}
	public String getHomeTraffic() {
		return homeTraffic;
	}
	public void setHomeTraffic(String homeTraffic) {
		this.homeTraffic = homeTraffic;
	}
	public String getHomeSurround() {
		return homeSurround;
	}
	public void setHomeSurround(String homeSurround) {
		this.homeSurround = homeSurround;
	}
	public int getHighPay() {
		return highPay;
	}
	public void setHighPay(int highPay) {
		this.highPay = highPay;
	}
	public int getRowPay() {
		return rowPay;
	}
	public void setRowPay(int rowPay) {
		this.rowPay = rowPay;
	}
	public int getHomeReserveCnt() {
		return homeReserveCnt;
	}
	public void setHomeReserveCnt(int homeReserveCnt) {
		this.homeReserveCnt = homeReserveCnt;
	}
	public int getHomeViCnt() {
		return homeViCnt;
	}
	public void setHomeViCnt(int homeViCnt) {
		this.homeViCnt = homeViCnt;
	}
	public String getDelYN() {
		return DelYN;
	}
	public void setDelYN(String delYN) {
		DelYN = delYN;
	}
	public Timestamp getHomeModDate() {
		return homeModDate;
	}
	public void setHomeModDate(Timestamp homeModDate) {
		this.homeModDate = homeModDate;
	}
	public Timestamp getHomeRegData() {
		return homeRegData;
	}
	public void setHomeRegData(Timestamp homeRegData) {
		this.homeRegData = homeRegData;
	}
	public String getHomeIsOnlyGuest() {
		return homeIsOnlyGuest;
	}
	public void setHomeIsOnlyGuest(String homeIsOnlyGuest) {
		this.homeIsOnlyGuest = homeIsOnlyGuest;
	}
	
	public String getHomeRegStep() {
		return homeRegStep;
	}
	public void setHomeRegStep(String homeRegStep) {
		this.homeRegStep = homeRegStep;
	}
	
	@Override
	public String toString() {
		return "HomeInfoDomain [homeID=" + homeID + ", userID=" + userID + ", homeAddr1=" + homeAddr1 + ", homeAddr2="
				+ homeAddr2 + ", homeTitle=" + homeTitle + ", homeComment=" + homeComment + ", homeTraffic="
				+ homeTraffic + ", homeSurround=" + homeSurround + ", highPay=" + highPay + ", rowPay=" + rowPay
				+ ", homeReserveCnt=" + homeReserveCnt + ", homeViCnt=" + homeViCnt + ", DelYN=" + DelYN
				+ ", homeRegStep=" + homeRegStep + ", homeModDate=" + homeModDate + ", homeRegData=" + homeRegData
				+ ", homeIsOnlyGuest=" + homeIsOnlyGuest + "]";
	}

}
