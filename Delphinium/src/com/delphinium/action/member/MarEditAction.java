package com.delphinium.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.MemberDAO;
import com.delphinium.dto.MemberVO;
import com.delphinium.util.Action;

public class MarEditAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO mVo = new MemberVO();

		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("loginUser");
		Integer userLevel = (Integer) session.getAttribute("userLevel");

		mVo.setUserLevel(userLevel);
		mVo.setUserID(request.getParameter("userID"));
		mVo.setUserPW(request.getParameter("userPW"));
		mVo.setCName(request.getParameter("cname"));
		mVo.setName(request.getParameter("name"));
		mVo.setPhone(request.getParameter("phone"));
		mVo.setAddress(request.getParameter("address"));
		mVo.setSNS(request.getParameter("sns"));

		MemberDAO mDao = MemberDAO.getInstance();
		mDao.marEdit(mVo, loginUser);

		new MemberEditFormAction().execute(request, response);

	}

}
