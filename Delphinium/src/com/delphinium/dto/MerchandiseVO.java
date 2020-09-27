package com.delphinium.dto;

import java.sql.Timestamp;

public class MerchandiseVO {

	private String md_num;
	private String md_name;
	private String userID;
	private String cname;
	private String md_cate;
	private Timestamp md_date;
	private int md_price;
	private String md_sim_info;
	private String md_sim_pic;
	private String md_det_info;
	private String md_det_pic;
	private String md_op1_name;
	private String md_op2_name;
	private String md_op3_name;
	private String md_op1_val;
	private String md_op2_val;
	private String md_op3_val;
	public String getMd_num() {
		return md_num;
	}
	public void setMd_num(String md_num) {
		this.md_num = md_num;
	}
	public String getMd_name() {
		return md_name;
	}
	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getMd_cate() {
		return md_cate;
	}
	public void setMd_cate(String md_cate) {
		this.md_cate = md_cate;
	}
	public Timestamp getMd_date() {
		return md_date;
	}
	public void setMd_date(Timestamp md_date) {
		this.md_date = md_date;
	}
	public int getMd_price() {
		return md_price;
	}
	public void setMd_price(int md_price) {
		this.md_price = md_price;
	}
	public String getMd_sim_info() {
		return md_sim_info;
	}
	public void setMd_sim_info(String md_sim_info) {
		this.md_sim_info = md_sim_info;
	}
	public String getMd_sim_pic() {
		return md_sim_pic;
	}
	public void setMd_sim_pic(String md_sim_pic) {
		this.md_sim_pic = md_sim_pic;
	}
	public String getMd_det_info() {
		return md_det_info;
	}
	public void setMd_det_info(String md_det_info) {
		this.md_det_info = md_det_info;
	}
	public String getMd_det_pic() {
		return md_det_pic;
	}
	public void setMd_det_pic(String md_det_pic) {
		this.md_det_pic = md_det_pic;
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
		return "MerchandiseVO [md_num=" + md_num + ", md_name=" + md_name + ", userID=" + userID + ", cname=" + cname
				+ ", md_cate=" + md_cate + ", md_date=" + md_date + ", md_price=" + md_price + ", md_sim_info="
				+ md_sim_info + ", md_sim_pic=" + md_sim_pic + ", md_det_info=" + md_det_info + ", md_det_pic="
				+ md_det_pic + ", md_op1_name=" + md_op1_name + ", md_op2_name=" + md_op2_name + ", md_op3_name="
				+ md_op3_name + ", md_op1_val=" + md_op1_val + ", md_op2_val=" + md_op2_val + ", md_op3_val="
				+ md_op3_val + "]";
	}

	

}
