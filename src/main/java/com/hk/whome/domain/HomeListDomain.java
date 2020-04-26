package com.hk.whome.domain;

public class HomeListDomain {

	private String area;
	private String homeDateIn;
	private String homeDateOut;
	private String homeGuest;
	private int startListNo;
	private int endListNo;

	public int getStartListNo() {
		return startListNo;
	}
	public void setStartListNo(int startListNo) {
		this.startListNo = startListNo;
	}
	public int getEndListNo() {
		return endListNo;
	}
	public void setEndListNo(int endListNo) {
		this.endListNo = endListNo;
	}

	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	/**
	 * @return the homeDate
	 */
	public String getHomeDateIn() {
		return homeDateIn;
	}
	/**
	 * @param homeDate the homeDate to set
	 */
	public void setHomeDateIn(String homeDate) {
		this.homeDateIn = homeDate;
	}
	/**
	 * @return the homeGuest
	 */
	public String getHomeGuest() {
		return homeGuest;
	}
	/**
	 * @param homeGuest the homeGuest to set
	 */
	public void setHomeGuest(String homeGuest) {
		this.homeGuest = homeGuest;
	}
	/**
	 * @return the homeDateOut
	 */
	public String getHomeDateOut() {
		return homeDateOut;
	}
	/**
	 * @param homeDateOut the homeDateOut to set
	 */
	public void setHomeDateOut(String homeDateOut) {
		this.homeDateOut = homeDateOut;
	}
	
	
	

	
	
	
}
