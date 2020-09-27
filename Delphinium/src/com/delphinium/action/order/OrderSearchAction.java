package com.delphinium.action.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.OrderDAO;
import com.delphinium.dto.OrderVO;
import com.delphinium.util.Action;

public class OrderSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/order/orderSearchList.jsp";

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");

		String query = request.getParameter("query");

		OrderDAO oDao = OrderDAO.getInstance();
		ArrayList<OrderVO> oVoQueryList = oDao.orderSearch(userID, query);

		request.setAttribute("oVoQueryList", oVoQueryList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}
}
