package com.delphinium.action.merchandise;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dto.MerchandiseVO;
import com.delphinium.dto.PageVO;
import com.delphinium.util.Action;
import com.delphinium.util.Paging;

public class MarMDListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/merchandise/marMDList.jsp";

		HttpSession session = request.getSession();
		String md_id = (String) session.getAttribute("loginUser");

		Paging paging = Paging.getInstance();
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.length() == 0) {
			pageNum = "1";
		}

		PageVO pVo = paging.MDPaging(pageNum, md_id);
		request.setAttribute("pVo", pVo);

		ArrayList<MerchandiseVO> mdVoList = pVo.getMdVoList();
		request.setAttribute("mdVoList", mdVoList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}
}
