package com.delphinium.action.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.CartDAO;
import com.delphinium.dao.OrderDAO;
import com.delphinium.util.Action;

public class OrderAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OrderAction 요청받음");
		String url = "/order/orderSuccess.jsp";

		HttpSession session = request.getSession();
		OrderDAO oDao = OrderDAO.getInstance();
		CartDAO cDao = CartDAO.getInstance();
		String userID = (String) session.getAttribute("loginUser");
		String nums = request.getParameter("nums");

		String[] orders = nums.split(",");
		for (String n : orders) {
			oDao.order(userID, Integer.parseInt(n));
			cDao.deleteCart(userID, Integer.parseInt(n));
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
