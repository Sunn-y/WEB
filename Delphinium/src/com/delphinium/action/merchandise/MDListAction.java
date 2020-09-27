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

public class MDListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/merchandise/merchandiseList.jsp";

		MerchandiseDAO mdDao = MerchandiseDAO.getInstance();
		String md_cate = request.getParameter("sort");
		ArrayList<MerchandiseVO> mdVoList = mdDao.mdList(md_cate);
		int totalMD = mdDao.totalMD(md_cate);

		request.setAttribute("mdVoList", mdVoList);
		request.setAttribute("md_cate", md_cate);
		request.setAttribute("totalMD", totalMD);

		request.setAttribute("md_num", request.getAttribute("md_num"));

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}
}
