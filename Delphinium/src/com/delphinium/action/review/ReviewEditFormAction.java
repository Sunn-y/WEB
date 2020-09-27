package com.delphinium.action.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.ReviewDAO;
import com.delphinium.dto.ReviewVO;
import com.delphinium.util.Action;

public class ReviewEditFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/merchandise/reviewEditForm.jsp";
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");
		String md_num = request.getParameter("md_num");
		String rv_num = request.getParameter("rv_num");

		ReviewDAO rvDao = ReviewDAO.getInstance();
		ReviewVO rVo = rvDao.review(userID, md_num, rv_num);

		request.setAttribute("md_num", md_num);
		request.setAttribute("rv_num", rv_num);
		request.setAttribute("rVo", rVo);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
