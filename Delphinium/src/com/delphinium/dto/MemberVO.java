package com.delphinium.dto;

import java.sql.Timestamp;

public class MemberVO {

	private int userLevel;
	private String userID;
	private String userPW;
	private String CName;
	private String name;
	private String birth;
	private int gender;
	private String phone;
	private String address;
	private Timestamp regiDate;
	private String SNS;
	private int event;
	
	
	
	
	@Override
	public String toString() {
		return "MemberVO [userLevel=" + userLevel + ", userID=" + userID + ", userPW=" + userPW + ", CName=" + CName
				+ ", name=" + name + ", birth=" + birth + ", gender=" + gender + ", phone=" + phone + ", address="
				+ address + ", regiDate=" + regiDate + ", SNS=" + SNS + ", event=" + event + "]";
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getCName() {
		return CName;
	}
	public void setCName(String cName) {
		CName = cName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Timestamp regiDate) {
		this.regiDate = regiDate;
	}
	public String getSNS() {
		return SNS;
	}
	public void setSNS(String sNS) {
		SNS = sNS;
	}
	public int getEvent() {
		return event;
	}
	public void setEvent(int event) {
		this.event = event;
	}
	
	

	

}
