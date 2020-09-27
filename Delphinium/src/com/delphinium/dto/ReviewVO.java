package com.delphinium.dto;

import java.sql.Timestamp;

public class ReviewVO {
	private String md_num;
	private int rv_num;
	private String userID;
	private int rv_md_star;
	private Timestamp rv_date;
	private String rv_content;

	public String getMd_num() {
		return md_num;
	}

	public void setMd_num(String md_num) {
		this.md_num = md_num;
	}

	public int getRv_num() {
		return rv_num;
	}

	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getRv_md_star() {
		return rv_md_star;
	}

	public void setRv_md_star(int rv_md_star) {
		this.rv_md_star = rv_md_star;
	}

	public Timestamp getRv_date() {
		return rv_date;
	}

	public void setRv_date(Timestamp rv_date) {
		this.rv_date = rv_date;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	@Override
	public String toString() {
		return "ReviewVO [md_num=" + md_num + ", rv_num=" + rv_num + ", userID=" + userID + ", rv_md_star=" + rv_md_star
				+ ", rv_date=" + rv_date + ", rv_content=" + rv_content + ", getMd_num()=" + getMd_num()
				+ ", getRv_num()=" + getRv_num() + ", getUserID()=" + getUserID() + ", getRv_md_star()="
				+ getRv_md_star() + ", getRv_date()=" + getRv_date() + ", getRv_content()=" + getRv_content()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

}
