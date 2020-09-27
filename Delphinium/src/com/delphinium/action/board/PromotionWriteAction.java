package com.delphinium.action.board;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delphinium.dto.BoardVO;
import com.delphinium.util.Action;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.delphinium.dao.BoardDAO;

public class PromotionWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardVO bVo = new BoardVO();

		String savePath = "upload";
		int uploadFileSizeLimit = 15 * 1024 * 1024;
		String encType = "UTF-8";
		ServletContext context = request.getSession().getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println(uploadFilePath);

		try {

			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType,
					new DefaultFileRenamePolicy());

			bVo.setB_cate(1);
			bVo.setB_title(multi.getParameter("b_title"));
			bVo.setB_content(multi.getParameter("b_content"));

			String b_pic1 = multi.getFilesystemName("b_pic1");
			String b_pic2 = multi.getFilesystemName("b_pic2");
			String b_pic3 = multi.getFilesystemName("b_pic3");

			if (b_pic1 == null) {
				bVo.setB_pic1("사진없음");
			}

			if (b_pic1 != null) {
				bVo.setB_pic1(savePath + "\\" + b_pic1);
			}

			if (b_pic2 == null) {
				bVo.setB_pic2("사진없음");
			}

			if (b_pic2 != null) {
				bVo.setB_pic2(savePath + "\\" + b_pic2);
			}

			if (b_pic3 == null) {
				bVo.setB_pic3("사진없음");
			}

			if (b_pic3 != null) {
				bVo.setB_pic3(savePath + "\\" + b_pic3);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		BoardDAO bDao = BoardDAO.getInstance();
		bDao.boardWrite(bVo, 1);

		new PromotionListAction().execute(request, response);
	}

}
