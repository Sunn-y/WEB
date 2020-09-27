package com.delphinium.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dao.QnADAO;
import com.delphinium.util.Action;

public class QnADeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int qa_num = Integer.parseInt(request.getParameter("qa_num"));
		String md_num = request.getParameter("md_num");

		QnADAO qDao = QnADAO.getInstance();
		qDao.qaDelete(qa_num);

		request.setAttribute("md_num", md_num);

		new OwnQnAViewAction().execute(request, response);
	}
}
