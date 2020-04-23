package com.hk.whome.domain;

import java.sql.Timestamp;

public class UserInfoDomain {

	private String userId;
	private String userPw;
	private String userName;
	private String userBirth;
	private String userAddress1;
	private String userAddress2;
	private String userEmail;
	private String userPhone;
	private String userAuth;
	private String userIntroduce;
	private String userImg;
	private String userD_YN;
	private Timestamp userModDate;
	private Timestamp userRegData;
	
	
	public String getUserIntroduce() {
		return userIntroduce;
	}
	public void setUserIntroduce(String userIntroduce) {
		this.userIntroduce = userIntroduce;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress1() {
		return userAddress1;
	}
	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}
	public String getUserAddress2() {
		return userAddress2;
	}
	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}
	public String getUserAuth() {
		return userAuth;
	}
	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}
	public Timestamp getUserModDate() {
		return userModDate;
	}
	public void setUserModDate(Timestamp userModDate) {
		this.userModDate = userModDate;
	}
	public Timestamp getUserRegData() {
		return userRegData;
	}
	public void setUserRegData(Timestamp userRegData) {
		this.userRegData = userRegData;
	}
	public String getUserD_YN() {
		return userD_YN;
	}
	public void setUserD_YN(String userD_YN) {
		this.userD_YN = userD_YN;
	}
	
}
