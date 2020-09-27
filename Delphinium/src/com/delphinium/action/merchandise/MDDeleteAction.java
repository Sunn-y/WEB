package com.delphinium.action.merchandise;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.MerchandiseDAO;
import com.delphinium.util.Action;

public class MDDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String md_num = request.getParameter("md_num");

		MerchandiseDAO mdDao = MerchandiseDAO.getInstance();
		mdDao.mdDelete(md_num);

		new MarMDListAction().execute(request, response);

	}
}