package com.delphinium.action.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.CartDAO;
import com.delphinium.util.Action;

public class DeleteCartAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");
		int num = Integer.parseInt(request.getParameter("num"));

		CartDAO cDao = CartDAO.getInstance();
		cDao.deleteCart(userID, num);

		new CartAction().execute(request, response);
	}
}
