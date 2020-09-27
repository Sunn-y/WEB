package com.delphinium.action.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.action.merchandise.MDDetailAction;
import com.delphinium.dao.CartDAO;
import com.delphinium.dao.OrderDAO;
import com.delphinium.dto.CartVO;
import com.delphinium.util.Action;

public class AddCartAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String wannaMove = request.getParameter("wannaMove");
		String req = request.getParameter("req");
		CartDAO cDao = CartDAO.getInstance();

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");

		String md_num = request.getParameter("md_num");
		String md_name = request.getParameter("md_name");
		int qty = Integer.parseInt(request.getParameter("qty"));
		String md_op1_name = request.getParameter("md_op1_name");
		String md_op2_name = request.getParameter("md_op2_name");
		String md_op3_name = request.getParameter("md_op3_name");
		String md_op1_val = request.getParameter("md_op1_val");
		String md_op2_val = request.getParameter("md_op2_val");
		String md_op3_val = request.getParameter("md_op3_val");

		if (md_op1_name == null) {
			md_op1_name = "可记绝澜";
		}
		if (md_op2_name == null) {
			md_op2_name = "可记绝澜";
		}
		if (md_op3_name == null) {
			md_op3_name = "可记绝澜";
		}
		if (md_op1_val == null) {
			md_op1_val = "可记绝澜";
		}
		if (md_op2_val == null) {
			md_op2_val = "可记绝澜";
		}
		if (md_op3_val == null) {
			md_op3_val = "可记绝澜";
		}

		CartVO cVo = new CartVO();

		cVo.setQty(qty);
		cVo.setMd_op1_name(md_op1_name);
		cVo.setMd_op2_name(md_op2_name);
		cVo.setMd_op3_name(md_op3_name);
		cVo.setMd_op1_val(md_op1_val);
		cVo.setMd_op2_val(md_op2_val);
		cVo.setMd_op3_val(md_op3_val);
		cVo.setUserID(userID);
		cVo.setMd_num(md_num);
		cVo.setMd_name(md_name);

		if (req.equals("ORDER")) {
			OrderDAO oDao = OrderDAO.getInstance();
			oDao.directOrder(cVo);
			request.setAttribute("md_num", md_num);
			String url = "/order/orderSuccess.jsp";

			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}

		if (req.equals("CART")) {
			cDao.addCart(cVo);
			request.setAttribute("md_num", md_num);

			if (wannaMove.equals("true")) {
				new CartAction().execute(request, response);
			}
			if (wannaMove.equals("false")) {
				new MDDetailAction().execute(request, response);
			}
		}
	}

}
