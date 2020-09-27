package com.delphinium.action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.BoardDAO;
import com.delphinium.dto.BoardVO;
import com.delphinium.util.Action;

public class NoticeEditFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/board/noticeEditForm.jsp";

		int b_num = Integer.parseInt(request.getParameter("b_num"));

		BoardDAO bDao = BoardDAO.getInstance();
		BoardVO bVo = bDao.noticeView(b_num);

		request.setAttribute("bVo", bVo);
		request.setAttribute("b_num", b_num);
		request.setAttribute("b_cate", 0);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
