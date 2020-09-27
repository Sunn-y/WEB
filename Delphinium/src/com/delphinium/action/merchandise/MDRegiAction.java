package com.delphinium.action.merchandise;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.delphinium.dao.MerchandiseDAO;
import com.delphinium.dto.MerchandiseVO;
import com.delphinium.util.Action;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MDRegiAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MerchandiseVO mdVo = new MerchandiseVO();
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("loginUser");

		String savePath = "upload";
		int uploadFileSizeLimit = 15 * 1024 * 1024;
		String encType = "UTF-8";
		ServletContext context = request.getSession().getServletContext();
		String uploadFilePath = context.getRealPath(savePath);

		try {

			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType,
					new DefaultFileRenamePolicy());

			mdVo.setMd_name(multi.getParameter("md_name"));
			mdVo.setUserID(loginUser);
			mdVo.setMd_cate(multi.getParameter("md_cate"));
			mdVo.setMd_price(Integer.parseInt(multi.getParameter("md_price")));
			mdVo.setMd_sim_info(multi.getParameter("md_sim_info"));
			mdVo.setMd_det_info(multi.getParameter("md_det_info"));

			mdVo.setMd_op1_name(multi.getParameter("md_op1_name"));
			mdVo.setMd_op2_name(multi.getParameter("md_op2_name"));
			mdVo.setMd_op3_name(multi.getParameter("md_op3_name"));
			mdVo.setMd_op1_val(multi.getParameter("md_op1_val"));
			mdVo.setMd_op2_val(multi.getParameter("md_op2_val"));
			mdVo.setMd_op3_val(multi.getParameter("md_op3_val"));

			String md_sim_pic = multi.getFilesystemName("md_sim_pic");
			String md_det_pic = multi.getFilesystemName("md_det_pic");

			if (md_sim_pic == null) {
				mdVo.setMd_sim_pic("사진없음");
			}
			if (md_sim_pic != null) {
				mdVo.setMd_sim_pic(savePath + "\\" + md_sim_pic);
			}

			if (md_det_pic == null) {
				mdVo.setMd_det_pic("사진없음");
			}
			if (md_det_pic != null) {
				mdVo.setMd_det_pic(savePath + "\\" + md_det_pic);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		MerchandiseDAO mdDao = MerchandiseDAO.getInstance();
		mdDao.mdRegi(mdVo, loginUser);

		new MarMDListAction().execute(request, response);

	}
}
