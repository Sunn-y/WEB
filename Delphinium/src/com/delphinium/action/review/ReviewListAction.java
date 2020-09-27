package com.delphinium.action.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.OrderDAO;
import com.delphinium.dto.PageVO;
import com.delphinium.dto.ReviewVO;
import com.delphinium.util.Action;
import com.delphinium.util.Paging;

public class ReviewListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/merchandise/reviewList.jsp";
		String md_num = request.getParameter("md_num");

		Paging paging = Paging.getInstance();
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.length() == 0) {
			pageNum = "1";
		}

		PageVO pVo = paging.rvPaging(pageNum, md_num);
		request.setAttribute("pVo", pVo);

		ArrayList<ReviewVO> rVoList = pVo.getrVoList();

		OrderDAO oDao = OrderDAO.getInstance();
		ArrayList<String> userIDs = oDao.canWriteReview(md_num);

		request.setAttribute("rVoList", rVoList);
		request.setAttribute("md_num", md_num);
		request.setAttribute("userIDs", userIDs);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
