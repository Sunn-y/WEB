package com.delphinium.util;

import java.util.ArrayList;

import com.delphinium.dao.BoardDAO;
import com.delphinium.dao.MerchandiseDAO;
import com.delphinium.dao.OrderDAO;
import com.delphinium.dao.QnADAO;
import com.delphinium.dao.ReviewDAO;
import com.delphinium.dto.BoardVO;
import com.delphinium.dto.MerchandiseVO;
import com.delphinium.dto.OrderVO;
import com.delphinium.dto.PageVO;
import com.delphinium.dto.QnAVO;
import com.delphinium.dto.ReviewVO;

public class Paging {

	private static Paging instance = new Paging();

	private Paging() {
	}

	public static Paging getInstance() {
		return instance;
	}

	public PageVO noticePaging(String pageNum) {
		PageVO pVo = new PageVO();

		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);

		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		ArrayList<BoardVO> bVoList = null;
		BoardDAO bDao = BoardDAO.getInstance();
		int total = bDao.totalNotice();
		// int modulo = total - (currentPage - 1) * pageSize;

		if (total > 0) {
			bVoList = bDao.getNoticeLists(start, end);
		}

		int pageBlock = 3;
		int add = total % pageSize == 0 ? 0 : 1;
		int pageCount = total / pageSize + add;
		int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;

		pVo.setStartPage(startPage);
		pVo.setEndPage(endPage);
		pVo.setPageBlock(pageBlock);
		pVo.setPageCount(pageCount);
		pVo.setbVoList(bVoList);

		return pVo;
	}

	public PageVO promotionPaging(String pageNum) {
		PageVO pVo = new PageVO();

		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);

		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		ArrayList<BoardVO> bVoList = null;
		BoardDAO bDao = BoardDAO.getInstance();
		int total = bDao.totalPromotion();
		// int modulo = total - (currentPage - 1) * pageSize;

		if (total > 0) {
			bVoList = bDao.getPromotionLists(start, end);
		}

		int pageBlock = 3;
		int add = total % pageSize == 0 ? 0 : 1;
		int pageCount = total / pageSize + add;
		int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;

		pVo.setStartPage(startPage);
		pVo.setEndPage(endPage);
		pVo.setPageBlock(pageBlock);
		pVo.setPageCount(pageCount);
		pVo.setbVoList(bVoList);

		return pVo;
	}

	public PageVO MDPaging(String pageNum, String userID) {
		PageVO pVo = new PageVO();

		int pageSize = 3;
		int currentPage = Integer.parseInt(pageNum);

		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		ArrayList<MerchandiseVO> mdVoList = null;
		MerchandiseDAO bDao = MerchandiseDAO.getInstance();
		int total = bDao.totalMD(userID);
		// int modulo = total - (currentPage - 1) * pageSize;

		if (total > 0) {
			mdVoList = bDao.marMDList(userID, start, end);
		}

		int pageBlock = 3;
		int add = total % pageSize == 0 ? 0 : 1;
		int pageCount = total / pageSize + add;
		int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;

		pVo.setStartPage(startPage);
		pVo.setEndPage(endPage);
		pVo.setPageBlock(pageBlock);
		pVo.setPageCount(pageCount);
		pVo.setMdVoList(mdVoList);

		return pVo;
	}

	public PageVO orderPaging(String pageNum, String userID) {
		PageVO pVo = new PageVO();

		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);

		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		ArrayList<OrderVO> oVoList = null;
		OrderDAO oDao = OrderDAO.getInstance();
		int total = oDao.total(userID);

		if (total > 0) {
			oVoList = oDao.orderList(userID, start, end);
		}

		int pageBlock = 3;
		int add = total % pageSize == 0 ? 0 : 1;
		int pageCount = total / pageSize + add;
		int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;

		pVo.setStartPage(startPage);
		pVo.setEndPage(endPage);
		pVo.setPageBlock(pageBlock);
		pVo.setPageCount(pageCount);
		pVo.setoVoList(oVoList);

		return pVo;
	}

	public PageVO qaPaging(String pageNum, String md_num) {
		PageVO pVo = new PageVO();

		int pageSize = 3;
		int currentPage = Integer.parseInt(pageNum);

		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		ArrayList<QnAVO> qVoList = null;
		QnADAO qDao = QnADAO.getInstance();
		int total = qDao.total(md_num);

		if (total > 0) {
			qVoList = qDao.qaList(md_num, start, end);
		}

		int pageBlock = 3;
		int add = total % pageSize == 0 ? 0 : 1;
		int pageCount = total / pageSize + add;
		int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;

		pVo.setStartPage(startPage);
		pVo.setEndPage(endPage);
		pVo.setPageBlock(pageBlock);
		pVo.setPageCount(pageCount);
		pVo.setqVoList(qVoList);

		return pVo;
	}

	public PageVO rvPaging(String pageNum, String md_num) {
		PageVO pVo = new PageVO();

		int pageSize = 3;
		int currentPage = Integer.parseInt(pageNum);

		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		ArrayList<ReviewVO> rVoList = null;
		ReviewDAO rvDao = ReviewDAO.getInstance();
		int total = rvDao.total(md_num);

		if (total > 0) {
			rVoList = rvDao.reviewList(md_num, start, end);
		}

		int pageBlock = 3;
		int add = total % pageSize == 0 ? 0 : 1;
		int pageCount = total / pageSize + add;
		int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;

		pVo.setStartPage(startPage);
		pVo.setEndPage(endPage);
		pVo.setPageBlock(pageBlock);
		pVo.setPageCount(pageCount);
		pVo.setrVoList(rVoList);

		return pVo;
	}
}
