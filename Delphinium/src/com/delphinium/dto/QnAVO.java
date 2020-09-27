package com.delphinium.dto;

import java.sql.Timestamp;

public class QnAVO {
	private String md_num;
	private int qa_num;
	private String userID;
	private String qa_title;
	private Timestamp qa_date;
	private String qa_content;
	private String qa_ans;

	public String getMd_num() {
		return md_num;
	}

	public void setMd_num(String md_num) {
		this.md_num = md_num;
	}

	public int getQa_num() {
		return qa_num;
	}

	public void setQa_num(int qa_num) {
		this.qa_num = qa_num;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public Timestamp getQa_date() {
		return qa_date;
	}

	public void setQa_date(Timestamp qa_date) {
		this.qa_date = qa_date;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public String getQa_ans() {
		return qa_ans;
	}

	public void setQa_ans(String qa_ans) {
		this.qa_ans = qa_ans;
	}

	@Override
	public String toString() {
		return "QAVO [md_num=" + md_num + ", qa_num=" + qa_num + ", userID=" + userID + ", qa_title=" + qa_title
				+ ", qa_date=" + qa_date + ", qa_content=" + qa_content + ", qa_ans=" + qa_ans + "]";
	}

}
