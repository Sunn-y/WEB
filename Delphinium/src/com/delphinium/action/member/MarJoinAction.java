package com.delphinium.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.MemberDAO;
import com.delphinium.dto.MemberVO;
import com.delphinium.util.Action;

public class MarJoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberVO mVo = new MemberVO();

		mVo.setUserLevel(2);
		mVo.setUserID(request.getParameter("userID"));
		mVo.setUserPW(request.getParameter("userPW"));
		mVo.setCName(request.getParameter("CName"));
		mVo.setName(request.getParameter("name"));
		mVo.setPhone(request.getParameter("phone"));
		mVo.setSNS(request.getParameter("SNS"));
		mVo.setAddress(request.getParameter("address"));

		MemberDAO mDao = MemberDAO.getInstance();
		mDao.marJoin(mVo);

		new JoinSuccessAction().execute(request, response);

	}

}
