package com.delphinium.action.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.OrderDAO;
import com.delphinium.dto.OrderVO;
import com.delphinium.util.Action;

public class OrderViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/order/orderView.jsp";

		String od_num = request.getParameter("od_num");

		OrderDAO odDao = OrderDAO.getInstance();
		OrderVO oVo = odDao.orderView(od_num);
		String cname = oVo.getCname();
		String phone = odDao.phone(cname);

		request.setAttribute("oVo", oVo);
		request.setAttribute("phone", phone);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
