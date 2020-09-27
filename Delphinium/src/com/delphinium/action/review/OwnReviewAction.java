package com.delphinium.action.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.ReviewDAO;
import com.delphinium.dto.ReviewVO;
import com.delphinium.util.Action;

public class OwnReviewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");

		String url = "/merchandise/ownReview.jsp";
		String md_num = request.getParameter("md_num");

		ReviewDAO rvDao = ReviewDAO.getInstance();
		ArrayList<ReviewVO> rVoList = rvDao.ownReview(userID, md_num);

		request.setAttribute("rVoList", rVoList);
		request.setAttribute("md_num", md_num);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
