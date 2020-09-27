package com.delphinium.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dto.BoardVO;
import com.delphinium.util.Action;
import com.delphinium.dao.BoardDAO;

public class NoticeEditAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVO bVo = new BoardVO();
		int b_num = Integer.parseInt(request.getParameter("b_num"));

		bVo.setB_cate(0);
		bVo.setB_num(b_num);
		bVo.setB_title(request.getParameter("b_title"));
		bVo.setB_content(request.getParameter("b_content"));

		BoardDAO bDao = BoardDAO.getInstance();
		bDao.noticeEdit(bVo, b_num);

		request.setAttribute("bVo", bVo);
		request.setAttribute("b_num", b_num);
		request.setAttribute("b_cate", 0);

		new NoticeViewAction().execute(request, response);

	}

}
