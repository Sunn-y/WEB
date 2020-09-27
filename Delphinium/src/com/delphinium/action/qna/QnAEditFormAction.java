package com.delphinium.action.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.QnADAO;
import com.delphinium.dto.QnAVO;
import com.delphinium.util.Action;

public class QnAEditFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/merchandise/qnaEditForm.jsp";

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");
		int userLevel = (Integer) session.getAttribute("userLevel");

		if (userLevel == 2) {
			userID = request.getParameter("userID");
		}

		String md_num = request.getParameter("md_num");
		String qa_num = request.getParameter("qa_num");

		QnADAO qDao = QnADAO.getInstance();
		QnAVO qVo = qDao.qaView(md_num, userID, qa_num);

		request.setAttribute("md_num", md_num);
		request.setAttribute("qa_num", qa_num);
		request.setAttribute("qVo", qVo);

		System.out.println(qVo);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
