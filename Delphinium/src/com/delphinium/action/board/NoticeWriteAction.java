package com.delphinium.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dto.BoardVO;
import com.delphinium.util.Action;
import com.delphinium.dao.BoardDAO;

public class NoticeWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardVO bVo = new BoardVO();

		int b_cate = Integer.parseInt(request.getParameter("b_cate"));

		bVo.setB_cate(b_cate);
		bVo.setB_title(request.getParameter("b_title"));
		bVo.setB_content(request.getParameter("b_content"));

		BoardDAO bDao = BoardDAO.getInstance();
		bDao.boardWrite(bVo, b_cate);

		new NoticeListAction().execute(request, response);
	}

}
