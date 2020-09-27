package com.delphinium.action.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.CartDAO;
import com.delphinium.dto.CartVO;
import com.delphinium.util.Action;

public class CartAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/order/cart.jsp";

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");

		CartDAO cDao = CartDAO.getInstance();
		ArrayList<CartVO> cVoList = cDao.viewCart(userID);

		int sum = 0;
		for (CartVO c : cVoList) {
			sum += c.getMd_price();
		}
		request.setAttribute("cVoList", cVoList);
		request.setAttribute("total", cVoList.size());
		request.setAttribute("sum", sum);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
