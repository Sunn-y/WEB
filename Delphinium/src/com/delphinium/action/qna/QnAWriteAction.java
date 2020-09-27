package com.delphinium.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.QnADAO;
import com.delphinium.dto.QnAVO;
import com.delphinium.util.Action;

public class QnAWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		String md_num = request.getParameter("md_num");
		String userID = (String) session.getAttribute("loginUser");

		QnAVO qVo = new QnAVO();
		qVo.setMd_num(md_num);
		qVo.setUserID(userID);
		qVo.setQa_title(request.getParameter("qa_title"));
		qVo.setQa_content(request.getParameter("qa_content"));

		QnADAO qDao = QnADAO.getInstance();
		qDao.qaWrite(qVo);

		request.setAttribute("md_num", md_num);

		new OwnQnAViewAction().execute(request, response);
	}
}