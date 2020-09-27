package com.delphinium.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.QnADAO;
import com.delphinium.dto.QnAVO;
import com.delphinium.util.Action;

public class QnAEditAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		int qa_num = Integer.parseInt(request.getParameter("qa_num"));
		String md_num = request.getParameter("md_num");
		String userLevel = request.getParameter("userLevel");
		String userID = (String) session.getAttribute("loginUser");

		QnAVO qVo = new QnAVO();
		qVo.setMd_num(md_num);
		qVo.setQa_num(qa_num);
		qVo.setQa_title(request.getParameter("qa_title"));
		qVo.setQa_content(request.getParameter("qa_content"));
		qVo.setQa_ans(request.getParameter("qa_ans"));

		if (userLevel.equals("1")) {
			qVo.setUserID(userID);
		}

		if (userLevel.equals("2")) {
			qVo.setUserID(request.getParameter("userID"));
		}

		QnADAO qDao = QnADAO.getInstance();
		qDao.qaEdit(qVo);

		request.setAttribute("md_num", md_num);

		if (userLevel.equals("1")) {
			new OwnQnAViewAction().execute(request, response);
		}

		if (userLevel.equals("2")) {
			new QnAListAction().execute(request, response);
		}
	}
}