package com.delphinium.action.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.MemberDAO;
import com.delphinium.dto.MemberVO;
import com.delphinium.util.Action;

public class MemberListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/member/memberList.jsp";

		MemberDAO mDao = MemberDAO.getInstance();

		ArrayList<MemberVO> mVoList = mDao.memberList();

		request.setAttribute("mVoList", mVoList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
