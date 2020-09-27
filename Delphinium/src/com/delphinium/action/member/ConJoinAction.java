package com.delphinium.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.MemberDAO;
import com.delphinium.dto.MemberVO;
import com.delphinium.util.Action;

public class ConJoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO mVo = new MemberVO();

		String userID = request.getParameter("userID");
		String name = request.getParameter("name");

		mVo.setUserLevel(1);
		mVo.setUserID(userID);
		mVo.setUserPW(request.getParameter("userPW"));
		mVo.setName(name);
		mVo.setBirth(request.getParameter("birth"));
		mVo.setGender(Integer.parseInt(request.getParameter("gender")));
		mVo.setPhone(request.getParameter("phone"));
		mVo.setAddress(request.getParameter("address"));
		mVo.setEvent(Integer.parseInt(request.getParameter("event")));

		MemberDAO mDao = MemberDAO.getInstance();
		mDao.conJoin(mVo);

		request.setAttribute("userID", userID);
		request.setAttribute("name", name);

		new JoinSuccessAction().execute(request, response);

	}

}
