package com.delphinium.action.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dto.BoardVO;
import com.delphinium.dto.PageVO;
import com.delphinium.util.Action;
import com.delphinium.util.Paging;

public class PromotionListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/board/promotionList.jsp";

		Paging paging = Paging.getInstance();
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.length() == 0) {
			pageNum = "1";
		}

		PageVO pVo = paging.promotionPaging(pageNum);
		request.setAttribute("pVo", pVo);

		ArrayList<BoardVO> proVoList = pVo.getbVoList();
		request.setAttribute("proVoList", proVoList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
