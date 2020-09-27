package com.delphinium.action.qna;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.MerchandiseDAO;
import com.delphinium.dto.PageVO;
import com.delphinium.dto.QnAVO;
import com.delphinium.util.Action;
import com.delphinium.util.Paging;

public class QnAListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/merchandise/qnaList.jsp";
		String md_num = request.getParameter("md_num");

		Paging paging = Paging.getInstance();
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.length() == 0) {
			pageNum = "1";
		}

		PageVO pVo = paging.qaPaging(pageNum, md_num);
		request.setAttribute("pVo", pVo);

		ArrayList<QnAVO> qVoList = pVo.getqVoList();
		request.setAttribute("qVoList", qVoList);
		request.setAttribute("md_num", md_num);

		MerchandiseDAO mdDao = MerchandiseDAO.getInstance();
		String marketer = mdDao.isMarketer(md_num);

		request.setAttribute("marketer", marketer);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
