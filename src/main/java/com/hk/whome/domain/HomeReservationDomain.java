package com.hk.whome.domain;

import java.sql.Timestamp;

public class HomeReservationDomain {

	private String reservID;
	private String userID;
	private String homeID;
	private String guestCnt;
	private String startDate;
	private String endDate;
	private String reservStatus;
	private String hostPhoneNum;
	private String reservAddr;
	private String hostName;
	private int reservPay;
	private Timestamp regDate;
	private Timestamp modDate;
	
	public String getReservAddr() {
		return reservAddr;
	}
	public void setReservAddr(String reservAddr) {
		this.reservAddr = reservAddr;
	}
	public String getHostPhoneNum() {
		return hostPhoneNum;
	}
	public void setHostPhoneNum(String hostPhoneNum) {
		this.hostPhoneNum = hostPhoneNum;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getReservStatus() {
		return reservStatus;
	}
	public void setReservStatus(String reservStatus) {
		this.reservStatus = reservStatus;
	}
	public String getReservID() {
		return reservID;
	}
	public void setReservID(String reservID) {
		this.reservID = reservID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getHomeID() {
		return homeID;
	}
	public void setHomeID(String homeID) {
		this.homeID = homeID;
	}
	public String getGuestCnt() {
		return guestCnt;
	}
	public void setGuestCnt(String guestCnt) {
		this.guestCnt = guestCnt;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getReservPay() {
		return reservPay;
	}
	public void setReservPay(int reservPay) {
		this.reservPay = reservPay;
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
}
