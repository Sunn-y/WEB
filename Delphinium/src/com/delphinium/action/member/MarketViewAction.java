package com.delphinium.action.member;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.MemberDAO;
import com.delphinium.dto.MemberVO;
import com.delphinium.util.Action;

public class MarketViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/member/marketView.jsp";
		String cname = URLDecoder.decode(request.getParameter("cname"), "UTF-8");

		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.marketInfo(cname);

		request.setAttribute("mVo", mVo);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
