package com.delphinium.action.merchandise;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.MerchandiseDAO;
import com.delphinium.dto.MerchandiseVO;
import com.delphinium.util.Action;

public class MarMDSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/merchandise/marMDSearchList.jsp";

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");

		String where = request.getParameter("where");
		String query = request.getParameter("query");

		MerchandiseDAO mdDao = MerchandiseDAO.getInstance();
		ArrayList<MerchandiseVO> mdVoQueryList = mdDao.marMDSearch(userID, where, query);
		request.setAttribute("mdVoQueryList", mdVoQueryList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
