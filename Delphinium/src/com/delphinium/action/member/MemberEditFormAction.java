package com.delphinium.action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.MemberDAO;
import com.delphinium.dto.MemberVO;
import com.delphinium.util.Action;

public class MemberEditFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/member/memberEditForm.jsp";

		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("loginUser");

		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.mypage(loginUser);

		request.setAttribute("mVo", mVo);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
