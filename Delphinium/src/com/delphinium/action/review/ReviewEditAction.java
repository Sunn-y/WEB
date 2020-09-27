package com.delphinium.action.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.ReviewDAO;
import com.delphinium.dto.ReviewVO;
import com.delphinium.util.Action;

public class ReviewEditAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		String md_num = request.getParameter("md_num");
		int rv_num = Integer.parseInt(request.getParameter("rv_num"));
		String userID = (String) session.getAttribute("loginUser");
		int rv_md_star = Integer.parseInt(request.getParameter("rv_md_star"));

		ReviewDAO rDao = ReviewDAO.getInstance();
		ReviewVO rVo = new ReviewVO();

		rVo.setMd_num(md_num);
		rVo.setRv_num(rv_num);
		rVo.setUserID(userID);
		rVo.setRv_md_star(rv_md_star);
		rVo.setRv_content(request.getParameter("rv_content"));

		rDao.reviewEdit(rVo);

		request.setAttribute("md_num", md_num);

		new OwnReviewAction().execute(request, response);

	}

}
