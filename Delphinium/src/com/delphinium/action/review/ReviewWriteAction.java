package com.delphinium.action.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.ReviewDAO;
import com.delphinium.dto.ReviewVO;
import com.delphinium.util.Action;

public class ReviewWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewVO rvVo = new ReviewVO();

		HttpSession session = request.getSession();

		String md_num = request.getParameter("md_num");
		String rv_num = request.getParameter("rv_num");
		String userID = (String) session.getAttribute("loginUser");
		String rv_content = request.getParameter("rv_content");
		int rv_md_star = Integer.parseInt(request.getParameter("rv_md_star"));

		rvVo.setRv_content(rv_content);
		rvVo.setRv_md_star(rv_md_star);

		ReviewDAO rvDao = ReviewDAO.getInstance();
		rvDao.reviewWrite(rvVo, md_num, userID);

		request.setAttribute("md_num", md_num);
		request.setAttribute("rv_num", rv_num);

		new OwnReviewAction().execute(request, response);
	}

}
