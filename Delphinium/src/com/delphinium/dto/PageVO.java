package com.delphinium.dto;

import java.util.ArrayList;

public class PageVO {
	private int startPage;
	private int endPage;
	private int pageCount;
	private int pageBlock;

	ArrayList<BoardVO> bVoList;
	ArrayList<MerchandiseVO> mdVoList;
	ArrayList<OrderVO> oVoList;
	ArrayList<ReviewVO> rVoList;
	ArrayList<QnAVO> qVoList;

	public ArrayList<ReviewVO> getrVoList() {
		return rVoList;
	}

	public void setrVoList(ArrayList<ReviewVO> rVoList) {
		this.rVoList = rVoList;
	}

	public ArrayList<QnAVO> getqVoList() {
		return qVoList;
	}

	public void setqVoList(ArrayList<QnAVO> qVoList) {
		this.qVoList = qVoList;
	}

	public ArrayList<OrderVO> getoVoList() {
		return oVoList;
	}

	public void setoVoList(ArrayList<OrderVO> oVoList) {
		this.oVoList = oVoList;
	}

	public ArrayList<MerchandiseVO> getMdVoList() {
		return mdVoList;
	}

	public void setMdVoList(ArrayList<MerchandiseVO> mdVoList) {
		this.mdVoList = mdVoList;
	}

	public ArrayList<BoardVO> getbVoList() {
		return bVoList;
	}

	public void setbVoList(ArrayList<BoardVO> bVoList) {
		this.bVoList = bVoList;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

}
