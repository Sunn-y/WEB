package com.delphinium.action.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.delphinium.dao.ReviewDAO;
import com.delphinium.util.Action;

public class ReviewDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int rv_num = Integer.parseInt(request.getParameter("rv_num"));
		String md_num = request.getParameter("md_num");

		ReviewDAO rvDao = ReviewDAO.getInstance();
		rvDao.reviewDelete(rv_num);

		request.setAttribute("md_num", md_num);

		new OwnReviewAction().execute(request, response);

	}

}
