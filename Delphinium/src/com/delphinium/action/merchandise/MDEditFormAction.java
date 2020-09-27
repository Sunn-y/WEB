package com.delphinium.action.merchandise;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.MerchandiseDAO;
import com.delphinium.dto.MerchandiseVO;
import com.delphinium.util.Action;

public class MDEditFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/merchandise/MDEditForm.jsp";

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");
		String md_num = request.getParameter("md_num");

		MerchandiseDAO mdDao = MerchandiseDAO.getInstance();
		MerchandiseVO mdVo = mdDao.mdInfo(userID, md_num);

		request.setAttribute("mdVo", mdVo);
		request.setAttribute("md_num", md_num);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
