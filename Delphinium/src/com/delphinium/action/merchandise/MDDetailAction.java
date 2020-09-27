package com.delphinium.action.merchandise;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.MerchandiseDAO;
import com.delphinium.dao.QnADAO;
import com.delphinium.dao.ReviewDAO;
import com.delphinium.dto.MerchandiseVO;
import com.delphinium.dto.QnAVO;
import com.delphinium.dto.ReviewVO;
import com.delphinium.util.Action;

public class MDDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/merchandise/detailInfo.jsp";
		String md_num = request.getParameter("md_num");

		MerchandiseDAO mdDao = MerchandiseDAO.getInstance();
		MerchandiseVO mdVo = mdDao.detailInfo(md_num);
		request.setAttribute("mdVo", mdVo);
		request.setAttribute("md_num", request.getParameter("md_num"));

		QnADAO qDao = QnADAO.getInstance();
		ArrayList<QnAVO> qVoList = qDao.qaOne(md_num);
		QnAVO qVo = null;
		try {
			qVo = qVoList.get(0);
		} catch (IndexOutOfBoundsException e) {
			System.out.println("등록된 Q&A 없음");
		}
		request.setAttribute("qVo", qVo);

		ReviewDAO rDao = ReviewDAO.getInstance();
		ArrayList<ReviewVO> rVoList = rDao.reviewOne(md_num);
		ReviewVO rVo = null;
		try {
			rVo = rVoList.get(0);
		} catch (IndexOutOfBoundsException e) {
			System.out.println("등록된 리뷰 없음");
		}
		request.setAttribute("rVo", rVo);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}
}
