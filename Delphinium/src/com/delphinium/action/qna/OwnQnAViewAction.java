package com.delphinium.action.qna;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.QnADAO;
import com.delphinium.dto.QnAVO;
import com.delphinium.util.Action;

public class OwnQnAViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("loginUser");

		String url = "/merchandise/ownQnAView.jsp";
		String md_num = request.getParameter("md_num");

		QnADAO qDao = QnADAO.getInstance();
		ArrayList<QnAVO> qVoList = qDao.ownQAView(md_num, userID);

		request.setAttribute("qVoList", qVoList);
		request.setAttribute("md_num", md_num);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
