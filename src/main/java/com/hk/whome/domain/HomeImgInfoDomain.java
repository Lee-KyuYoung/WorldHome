package com.hk.whome.domain;

import java.sql.Timestamp;

public class HomeImgInfoDomain {

	private String homeImgKey;
	private String homeID;
	private String homeImgPath;
	private String homeMainImgYN; //메인이미지 여부
	private int homeImgOrder;
	private String delYN;
	private Timestamp homeImgRegDate;
	
	public String getHomeImgKey() {
		return homeImgKey;
	}
	public void setHomeImgKey(String homeImgKey) {
		this.homeImgKey = homeImgKey;
	}
	public String getHomeID() {
		return homeID;
	}
	public void setHomeID(String homeID) {
		this.homeID = homeID;
	}
	public String getHomeImgPath() {
		return homeImgPath;
	}
	public void setHomeImgPath(String homeImgPath) {
		this.homeImgPath = homeImgPath;
	}
	public String getHomeMainImgYN() {
		return homeMainImgYN;
	}
	public void setHomeMainImgYN(String homeMainImgYN) {
		this.homeMainImgYN = homeMainImgYN;
	}
	public int getHomeImgOrder() {
		return homeImgOrder;
	}
	public void setHomeImgOrder(int homeImgOrder) {
		this.homeImgOrder = homeImgOrder;
	}
	public String getDelYN() {
		return delYN;
	}
	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	public Timestamp getHomeImgRegDate() {
		return homeImgRegDate;
	}
	public void setHomeImgRegDate(Timestamp homeImgRegDate) {
		this.homeImgRegDate = homeImgRegDate;
	}
	@Override
	public String toString() {
		return "HomeImgInfoDomain [homeImgKey=" + homeImgKey + ", homeID=" + homeID + ", homeImgPath=" + homeImgPath
				+ ", homeMainImgYN=" + homeMainImgYN + ", homeImgOrder=" + homeImgOrder + ", delYN=" + delYN
				+ ", homeImgRegDate=" + homeImgRegDate + "]";
	}
	
	
}
