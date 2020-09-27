package com.delphinium.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.MemberDAO;
import com.delphinium.util.Action;

public class MemberDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDAO mDao = MemberDAO.getInstance();

		String loginUser = (String) session.getAttribute("loginUser");
		session.invalidate();

		mDao.memberDelete(loginUser);

		new MainAction().execute(request, response);

	}

}
