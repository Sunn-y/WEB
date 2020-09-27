package com.delphinium.dto;

import java.sql.Timestamp;

public class BoardVO {
	private int b_cate; // notice=0, promotion=1
	private int b_num;
	private String b_title;
	private Timestamp b_date;
	private String b_content;
	private String b_pic1;
	private String b_pic2;
	private String b_pic3;

	public int getB_cate() {
		return b_cate;
	}

	public void setB_cate(int b_cate) {
		this.b_cate = b_cate;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public Timestamp getB_date() {
		return b_date;
	}

	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_pic1() {
		return b_pic1;
	}

	public void setB_pic1(String b_pic1) {
		this.b_pic1 = b_pic1;
	}

	public String getB_pic2() {
		return b_pic2;
	}

	public void setB_pic2(String b_pic2) {
		this.b_pic2 = b_pic2;
	}

	public String getB_pic3() {
		return b_pic3;
	}

	public void setB_pic3(String b_pic3) {
		this.b_pic3 = b_pic3;
	}

	@Override
	public String toString() {
		return "BoardVO [b_cate=" + b_cate + ", b_num=" + b_num + ", b_title=" + b_title + ", b_date=" + b_date
				+ ", b_content=" + b_content + ", b_pic1=" + b_pic1 + ", b_pic2=" + b_pic2 + ", b_pic3=" + b_pic3 + "]";
	}

}
