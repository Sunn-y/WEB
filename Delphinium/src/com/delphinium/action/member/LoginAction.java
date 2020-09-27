package com.delphinium.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.MemberDAO;
import com.delphinium.util.Action;

public class LoginAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userID = request.getParameter("loginID");
		String userPW = request.getParameter("loginPW");

		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.login(userID, userPW);
		int userLevel = mDao.checkUserLevel(userID);

		if (result == 0) {
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다!");
			new LoginFormAction().execute(request, response);
		}

		if (result == -1) {
			request.setAttribute("msg", "아이디가 존재하지 않습니다!");
			new LoginFormAction().execute(request, response);
		}

		if (result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", userID);
			session.setAttribute("userLevel", userLevel);
			new MainAction().execute(request, response);
		}

	}
}
