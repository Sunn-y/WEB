package com.delphinium.dto;

import java.sql.Timestamp;

public class OrderVO {
	private String od_num;
	private Timestamp od_date;
	private String userID;
	private String md_num;
	private String cname;
	private String md_name;
	private int md_price;
	private String md_sim_pic;
	private int qty;
	private String md_op1_name;
	private String md_op2_name;
	private String md_op3_name;
	private String md_op1_val;
	private String md_op2_val;
	private String md_op3_val;

	public String getOd_num() {
		return od_num;
	}

	public void setOd_num(String od_num) {
		this.od_num = od_num;
	}

	public Timestamp getOd_date() {
		return od_date;
	}

	public void setOd_date(Timestamp od_date) {
		this.od_date = od_date;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getMd_num() {
		return md_num;
	}

	public void setMd_num(String md_num) {
		this.md_num = md_num;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getMd_name() {
		return md_name;
	}

	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}

	public int getMd_price() {
		return md_price;
	}

	public void setMd_price(int md_price) {
		this.md_price = md_price;
	}

	public String getMd_sim_pic() {
		return md_sim_pic;
	}

	public void setMd_sim_pic(String md_sim_pic) {
		this.md_sim_pic = md_sim_pic;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getMd_op1_name() {
		return md_op1_name;
	}

	public void setMd_op1_name(String md_op1_name) {
		this.md_op1_name = md_op1_name;
	}

	public String getMd_op2_name() {
		return md_op2_name;
	}

	public void setMd_op2_name(String md_op2_name) {
		this.md_op2_name = md_op2_name;
	}

	public String getMd_op3_name() {
		return md_op3_name;
	}

	public void setMd_op3_name(String md_op3_name) {
		this.md_op3_name = md_op3_name;
	}

	public String getMd_op1_val() {
		return md_op1_val;
	}

	public void setMd_op1_val(String md_op1_val) {
		this.md_op1_val = md_op1_val;
	}

	public String getMd_op2_val() {
		return md_op2_val;
	}

	public void setMd_op2_val(String md_op2_val) {
		this.md_op2_val = md_op2_val;
	}

	public String getMd_op3_val() {
		return md_op3_val;
	}

	public void setMd_op3_val(String md_op3_val) {
		this.md_op3_val = md_op3_val;
	}

	@Override
	public String toString() {
		return "OrderVO [od_num=" + od_num + ", od_date=" + od_date + ", userID=" + userID + ", md_num=" + md_num
				+ ", cname=" + cname + ", md_name=" + md_name + ", md_price=" + md_price + ", md_sim_pic=" + md_sim_pic
				+ ", qty=" + qty + ", md_op1_name=" + md_op1_name + ", md_op2_name=" + md_op2_name + ", md_op3_name="
				+ md_op3_name + ", md_op1_val=" + md_op1_val + ", md_op2_val=" + md_op2_val + ", md_op3_val="
				+ md_op3_val + "]";
	}

}
