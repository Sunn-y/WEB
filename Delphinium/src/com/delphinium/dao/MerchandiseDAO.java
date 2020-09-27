package com.delphinium.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.delphinium.dto.MerchandiseVO;
import com.delphinium.util.DBManager;

public class MerchandiseDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	private MerchandiseDAO() {
	}

	private static MerchandiseDAO instance = new MerchandiseDAO();

	public static MerchandiseDAO getInstance() {
		return instance;
	}

	public void mdRegi(MerchandiseVO mdVo, String loginUser) {
		String sql = "insert into merchandise " + "(md_num, md_name, userID, cname, md_cate, md_price, "
				+ "md_sim_info, md_sim_pic, md_det_info, md_det_pic, "
				+ "md_op1_name, md_op1_val, md_op2_name, md_op2_val, " + "md_op3_name, md_op3_val) values ( "
				+ "'MD' || md_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?)";

		String cname = cnameSearch(loginUser);

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mdVo.getMd_name());
			pstmt.setString(2, loginUser);
			pstmt.setString(3, cname);
			pstmt.setString(4, mdVo.getMd_cate());
			pstmt.setInt(5, mdVo.getMd_price());
			pstmt.setString(6, mdVo.getMd_sim_info());
			pstmt.setString(7, mdVo.getMd_sim_pic());
			pstmt.setString(8, mdVo.getMd_det_info());
			pstmt.setString(9, mdVo.getMd_det_pic());

			if (mdVo.getMd_op1_name().length() == 0) {
				pstmt.setString(10, "可记绝澜");
			}

			if (mdVo.getMd_op1_name().length() > 0) {
				pstmt.setString(10, mdVo.getMd_op1_name());
			}

			if (mdVo.getMd_op1_val().length() == 0) {
				pstmt.setString(11, "可记绝澜");
			}

			if (mdVo.getMd_op1_val().length() > 0) {
				pstmt.setString(11, mdVo.getMd_op1_val());
			}

			if (mdVo.getMd_op2_name().length() == 0) {
				pstmt.setString(12, "可记绝澜");
			}

			if (mdVo.getMd_op2_name().length() > 0) {
				pstmt.setString(12, mdVo.getMd_op2_name());
			}

			if (mdVo.getMd_op2_val().length() == 0) {
				pstmt.setString(13, "可记绝澜");
			}

			if (mdVo.getMd_op2_val().length() > 0) {
				pstmt.setString(13, mdVo.getMd_op2_val());
			}

			if (mdVo.getMd_op3_name().length() == 0) {
				pstmt.setString(14, "可记绝澜");
			}

			if (mdVo.getMd_op3_name().length() > 0) {
				pstmt.setString(14, mdVo.getMd_op3_name());
			}

			if (mdVo.getMd_op3_val().length() == 0) {
				pstmt.setString(15, "可记绝澜");
			}

			if (mdVo.getMd_op3_val().length() > 0) {
				pstmt.setString(15, mdVo.getMd_op3_val());
			}

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void mdEdit(MerchandiseVO mdVo, String loginUser, String md_num) {
		String sql = "update merchandise set md_name = ?, md_cate = ?, md_price = ?, md_sim_info = ?, md_sim_pic = ?, md_det_info = ?, md_det_pic = ?, md_op1_name = ?, md_op2_name = ?, md_op3_name = ?, md_op1_val = ?, md_op2_val = ?, md_op3_val = ? where userID = ? and md_num = ?";
		try {
			conn = DBManager.getConnection();

			if (mdVo.getMd_sim_pic() == null) {
				String sqlPic1 = "select md_sim_pic from merchandise where userID=? and md_num = ?";
				pstmt = conn.prepareStatement(sqlPic1);
				pstmt.setString(1, loginUser);
				pstmt.setString(2, md_num);
				rs = pstmt.executeQuery();
				if (rs != null) {
					if (rs.next()) {
						String pic1 = rs.getString("md_sim_pic");
						mdVo.setMd_sim_pic(pic1);
					}
				}
			}

			if (mdVo.getMd_det_pic() == null) {
				String sqlPic2 = "select md_det_pic from merchandise where userID=? and md_num = ?";
				pstmt = conn.prepareStatement(sqlPic2);
				pstmt.setString(1, loginUser);
				pstmt.setString(2, md_num);
				rs = pstmt.executeQuery();
				if (rs != null) {
					if (rs.next()) {
						String pic2 = rs.getString("md_det_pic");
						mdVo.setMd_det_pic(pic2);
					}
				}
			}
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mdVo.getMd_name());
			pstmt.setString(2, mdVo.getMd_cate());
			pstmt.setInt(3, mdVo.getMd_price());
			pstmt.setString(4, mdVo.getMd_sim_info());
			pstmt.setString(5, mdVo.getMd_sim_pic());
			pstmt.setString(6, mdVo.getMd_det_info());
			pstmt.setString(7, mdVo.getMd_det_pic());
			pstmt.setString(8, mdVo.getMd_op1_name());
			pstmt.setString(9, mdVo.getMd_op2_name());
			pstmt.setString(10, mdVo.getMd_op3_name());
			pstmt.setString(11, mdVo.getMd_op1_val());
			pstmt.setString(12, mdVo.getMd_op2_val());
			pstmt.setString(13, mdVo.getMd_op3_val());
			pstmt.setString(14, loginUser);
			pstmt.setString(15, md_num);

			pstmt.executeUpdate();
		} catch (

		Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
	}

	public void mdDelete(String md_num) {
		String sql = "delete from merchandise where md_num = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, md_num);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public ArrayList<MerchandiseVO> mdList(String md_cate) {
		String sql = "select * from merchandise where md_cate = ? order by md_num desc";
		ArrayList<MerchandiseVO> mdVoList = new ArrayList<MerchandiseVO>();

		try {
			conn = DBManager.getConnection();

			if (md_cate.equals("NEW")) {
				sql = "select * from (select rownum as rowN, md_num, md_name, "
						+ "userID, cname, md_cate, md_date, md_price, md_sim_info, "
						+ "md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, "
						+ "md_op3_name, md_op1_val, md_op2_val, md_op3_val from "
						+ "(select * from merchandise order by md_date desc)) where rowN between ? and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, 1);
				pstmt.setInt(2, 12);
			} else {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, md_cate);
			}
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					MerchandiseVO mdVo = new MerchandiseVO();

					mdVo.setMd_num(rs.getString("md_num"));
					mdVo.setMd_name(rs.getString("md_name"));
					mdVo.setUserID(rs.getString("userID"));
					mdVo.setCname(rs.getString("cname"));
					mdVo.setMd_cate(rs.getString("md_cate"));
					mdVo.setMd_date(rs.getTimestamp("md_date"));
					mdVo.setMd_price(rs.getInt("md_price"));
					mdVo.setMd_sim_info(rs.getString("md_sim_info"));
					mdVo.setMd_sim_pic(rs.getString("md_sim_pic"));
					mdVo.setMd_det_info(rs.getString("md_det_info"));
					mdVo.setMd_det_pic(rs.getString("md_det_pic"));
					mdVo.setMd_op1_name(rs.getString("md_op1_name"));
					mdVo.setMd_op2_name(rs.getString("md_op2_name"));
					mdVo.setMd_op3_name(rs.getString("md_op3_name"));
					mdVo.setMd_op1_val(rs.getString("md_op1_val"));
					mdVo.setMd_op2_val(rs.getString("md_op2_val"));
					mdVo.setMd_op3_val(rs.getString("md_op3_val"));

					mdVoList.add(mdVo);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mdVoList;
	}

	public ArrayList<MerchandiseVO> marMDList(String md_id, int start, int end) {
		String sql = "select * from (select rownum as rowN, md_num, md_name, userID, "
				+ "cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, "
				+ "md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, "
				+ "md_op1_val, md_op2_val, md_op3_val from "
				+ "(select * from merchandise where userID = ? order by md_date desc)) " + "where rowN between ? and ?";

		ArrayList<MerchandiseVO> mdVoList = new ArrayList<MerchandiseVO>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					MerchandiseVO mdVo = new MerchandiseVO();

					mdVo.setMd_num(rs.getString("md_num"));
					mdVo.setMd_name(rs.getString("md_name"));
					mdVo.setUserID(rs.getString("userID"));
					mdVo.setCname(rs.getString("cname"));
					mdVo.setMd_cate(rs.getString("md_cate"));
					mdVo.setMd_date(rs.getTimestamp("md_date"));
					mdVo.setMd_price(rs.getInt("md_price"));
					mdVo.setMd_sim_info(rs.getString("md_sim_info"));
					mdVo.setMd_sim_pic(rs.getString("md_sim_pic"));
					mdVo.setMd_det_info(rs.getString("md_det_info"));
					mdVo.setMd_det_pic(rs.getString("md_det_pic"));
					mdVo.setMd_op1_name(rs.getString("md_op1_name"));
					mdVo.setMd_op2_name(rs.getString("md_op2_name"));
					mdVo.setMd_op3_name(rs.getString("md_op3_name"));
					mdVo.setMd_op1_val(rs.getString("md_op1_val"));
					mdVo.setMd_op2_val(rs.getString("md_op2_val"));
					mdVo.setMd_op3_val(rs.getString("md_op3_val"));

					mdVoList.add(mdVo);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mdVoList;
	}

	public MerchandiseVO mdInfo(String userID, String md_num) {
		String sql = "select * from merchandise where userID = ? and md_num = ?";
		MerchandiseVO mdVo = new MerchandiseVO();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, md_num);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {

					mdVo.setMd_num(rs.getString("md_num"));
					mdVo.setMd_name(rs.getString("md_name"));
					mdVo.setUserID(rs.getString("userID"));
					mdVo.setCname(rs.getString("cname"));
					mdVo.setMd_cate(rs.getString("md_cate"));
					mdVo.setMd_date(rs.getTimestamp("md_date"));
					mdVo.setMd_price(rs.getInt("md_price"));
					mdVo.setMd_sim_info(rs.getString("md_sim_info"));
					mdVo.setMd_sim_pic(rs.getString("md_sim_pic"));
					mdVo.setMd_det_info(rs.getString("md_det_info"));
					mdVo.setMd_det_pic(rs.getString("md_det_pic"));
					mdVo.setMd_op1_name(rs.getString("md_op1_name"));
					mdVo.setMd_op2_name(rs.getString("md_op2_name"));
					mdVo.setMd_op3_name(rs.getString("md_op3_name"));
					mdVo.setMd_op1_val(rs.getString("md_op1_val"));
					mdVo.setMd_op2_val(rs.getString("md_op2_val"));
					mdVo.setMd_op3_val(rs.getString("md_op3_val"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mdVo;
	}

	public MerchandiseVO detailInfo(String md_num) {
		String sql = "select * from merchandise where MD_NUM = ?";
		MerchandiseVO mdVo = new MerchandiseVO();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_num);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {

					mdVo.setMd_num(rs.getString("md_num"));
					mdVo.setMd_name(rs.getString("md_name"));
					mdVo.setUserID(rs.getString("userID"));
					mdVo.setCname(rs.getString("cname"));
					mdVo.setMd_cate(rs.getString("md_cate"));
					mdVo.setMd_date(rs.getTimestamp("md_date"));
					mdVo.setMd_price(rs.getInt("md_price"));
					mdVo.setMd_sim_info(rs.getString("md_sim_info"));
					mdVo.setMd_sim_pic(rs.getString("md_sim_pic"));
					mdVo.setMd_det_info(rs.getString("md_det_info"));
					mdVo.setMd_det_pic(rs.getString("md_det_pic"));
					mdVo.setMd_op1_name(rs.getString("md_op1_name"));
					mdVo.setMd_op2_name(rs.getString("md_op2_name"));
					mdVo.setMd_op3_name(rs.getString("md_op3_name"));
					mdVo.setMd_op1_val(rs.getString("md_op1_val"));
					mdVo.setMd_op2_val(rs.getString("md_op2_val"));
					mdVo.setMd_op3_val(rs.getString("md_op3_val"));

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mdVo;
	}

	public int totalMD(String userID) {
		String sql = "select count(*) from merchandise where userID = ?";
		int totalMD = -1;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					totalMD = rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return totalMD;
	};

	public ArrayList<MerchandiseVO> merchandiseSearch(String query) {
		String sql = " select * from merchandise where upper(cname) like ? or upper(md_name) like ?";

		ArrayList<MerchandiseVO> mdVoList = new ArrayList<MerchandiseVO>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			String up_query = query.toUpperCase();

			pstmt.setString(1, "%" + up_query + "%");
			pstmt.setString(2, "%" + up_query + "%");
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					MerchandiseVO mdVo = new MerchandiseVO();
					mdVo.setMd_num(rs.getString("md_num"));
					mdVo.setMd_name(rs.getString("md_name"));
					mdVo.setUserID(rs.getString("userID"));
					mdVo.setCname(rs.getString("cname"));
					mdVo.setMd_cate(rs.getString("md_cate"));
					mdVo.setMd_date(rs.getTimestamp("md_date"));
					mdVo.setMd_price(rs.getInt("md_price"));
					mdVo.setMd_sim_info(rs.getString("md_sim_info"));
					mdVo.setMd_sim_pic(rs.getString("md_sim_pic"));
					mdVo.setMd_det_info(rs.getString("md_det_info"));
					mdVo.setMd_det_pic(rs.getString("md_det_pic"));
					mdVo.setMd_op1_name(rs.getString("md_op1_name"));
					mdVo.setMd_op2_name(rs.getString("md_op2_name"));
					mdVo.setMd_op3_name(rs.getString("md_op3_name"));
					mdVo.setMd_op1_val(rs.getString("md_op1_val"));
					mdVo.setMd_op2_val(rs.getString("md_op2_val"));
					mdVo.setMd_op3_val(rs.getString("md_op3_val"));

					mdVoList.add(mdVo);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mdVoList;
	}

	public ArrayList<MerchandiseVO> marMDSearch(String userID, String where, String query) {
		String sql = null;
		ArrayList<MerchandiseVO> mdVoList = new ArrayList<MerchandiseVO>();
		String up_query = query.toUpperCase();

		try {
			conn = DBManager.getConnection();

			if (where.equals("md_name")) {
				sql = "select * from merchandise where userID = ? and upper(md_name) like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userID);
				pstmt.setString(2, "%" + up_query + "%");
			}

			if (where.equals("md_num")) {
				sql = "select * from merchandise where userID = ? and md_num like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userID);
				pstmt.setString(2, "%" + up_query + "%");
			}

			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					MerchandiseVO mdVo = new MerchandiseVO();
					mdVo.setMd_num(rs.getString("md_num"));
					mdVo.setMd_name(rs.getString("md_name"));
					mdVo.setUserID(rs.getString("userID"));
					mdVo.setCname(rs.getString("cname"));
					mdVo.setMd_cate(rs.getString("md_cate"));
					mdVo.setMd_date(rs.getTimestamp("md_date"));
					mdVo.setMd_price(rs.getInt("md_price"));
					mdVo.setMd_sim_info(rs.getString("md_sim_info"));
					mdVo.setMd_sim_pic(rs.getString("md_sim_pic"));
					mdVo.setMd_det_info(rs.getString("md_det_info"));
					mdVo.setMd_det_pic(rs.getString("md_det_pic"));
					mdVo.setMd_op1_name(rs.getString("md_op1_name"));
					mdVo.setMd_op2_name(rs.getString("md_op2_name"));
					mdVo.setMd_op3_name(rs.getString("md_op3_name"));
					mdVo.setMd_op1_val(rs.getString("md_op1_val"));
					mdVo.setMd_op2_val(rs.getString("md_op2_val"));
					mdVo.setMd_op3_val(rs.getString("md_op3_val"));

					mdVoList.add(mdVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mdVoList;
	}

	public String cnameSearch(String userID) {
		String sql = "select cname from member where userID = ?";
		String cname = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					cname = rs.getString("cname");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return cname;
	}

	public String isMarketer(String md_num) {
		String sql = "select userID from merchandise where md_num = ?";
		String marketer = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_num);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					marketer = rs.getString("userID");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return marketer;
	}

}
