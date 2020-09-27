package com.delphinium.action.merchandise;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.MerchandiseDAO;
import com.delphinium.dto.MerchandiseVO;
import com.delphinium.util.Action;

public class MDSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/merchandise/searchMDList.jsp";

		String query = request.getParameter("query");

		MerchandiseDAO mdDao = MerchandiseDAO.getInstance();
		ArrayList<MerchandiseVO> mdVoQueryList = mdDao.merchandiseSearch(query);

		request.setAttribute("mdVoQueryList", mdVoQueryList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
