package com.delphinium.action.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dto.OrderVO;
import com.delphinium.dto.PageVO;
import com.delphinium.util.Action;
import com.delphinium.util.Paging;

public class OrderListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/order/ordersList.jsp";

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");

		Paging paging = Paging.getInstance();
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.length() == 0) {
			pageNum = "1";
		}

		PageVO pVo = paging.orderPaging("1", userID);
		request.setAttribute("pVo", pVo);

		ArrayList<OrderVO> oVoList = pVo.getoVoList();
		request.setAttribute("oVoList", oVoList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
