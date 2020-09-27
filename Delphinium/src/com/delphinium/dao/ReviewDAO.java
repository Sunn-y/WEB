package com.delphinium.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.delphinium.dto.ReviewVO;
import com.delphinium.util.DBManager;

public class ReviewDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	int curNum = 1;

	private ReviewDAO() {
	}

	private static ReviewDAO instance = new ReviewDAO();

	public static ReviewDAO getInstance() {
		return instance;
	}

	public void reviewWrite(ReviewVO rvVo, String md_num, String userID) {
		String sql = "insert into review (md_num, rv_num, userid, rv_md_star,  rv_content) values(?,rv_seq.nextval,?,?,?)";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, md_num);
			pstmt.setString(2, userID);
			pstmt.setInt(3, rvVo.getRv_md_star());
			pstmt.setString(4, rvVo.getRv_content());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	};

	public void reviewEdit(ReviewVO rVo) {

		try {
			conn = DBManager.getConnection();

			String sql = "update review set rv_md_star=?, rv_content=? where md_num=? and rv_num=? and userid=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rVo.getRv_md_star());
			pstmt.setString(2, rVo.getRv_content());
			pstmt.setString(3, rVo.getMd_num());
			pstmt.setInt(4, rVo.getRv_num());
			pstmt.setString(5, rVo.getUserID());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	};

	public void reviewDelete(int rv_num) {
		String sql = "delete from review where rv_num=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rv_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	};

	public ArrayList<ReviewVO> ownReview(String userID, String md_num) {
		String sql = "select * from review where userID =? and md_num = ?";
		ArrayList<ReviewVO> rVoList = new ArrayList<ReviewVO>();
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, md_num);
			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					ReviewVO rVo = new ReviewVO();
					rVo.setMd_num(rs.getString("md_num"));
					rVo.setRv_num(rs.getInt("rv_num"));
					rVo.setUserID(rs.getString("userID"));
					rVo.setRv_md_star(rs.getInt("rv_md_star"));
					rVo.setRv_date(rs.getTimestamp("rv_date"));
					rVo.setRv_content(rs.getString("rv_content"));
					rVoList.add(rVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return rVoList;
	};

	public ReviewVO review(String userID, String md_num, String rv_num) {
		String sql = "select * from review where userID =? and md_num = ? and rv_num = ?";
		ReviewVO rVo = new ReviewVO();
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, md_num);
			pstmt.setString(3, rv_num);
			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					rVo.setMd_num(rs.getString("md_num"));
					rVo.setRv_num(rs.getInt("rv_num"));
					rVo.setUserID(rs.getString("userID"));
					rVo.setRv_md_star(rs.getInt("rv_md_star"));
					rVo.setRv_date(rs.getTimestamp("rv_date"));
					rVo.setRv_content(rs.getString("rv_content"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return rVo;
	};

	public ArrayList<ReviewVO> reviewOne(String md_num) {

		String sql = "select * from review where md_num = ? order by rv_num desc";
		ArrayList<ReviewVO> rvVoList = new ArrayList<ReviewVO>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_num);
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					ReviewVO rvVo = new ReviewVO();
					rvVo.setMd_num(rs.getString("md_num"));
					rvVo.setRv_num(rs.getInt("rv_num"));
					rvVo.setUserID(rs.getString("userID"));
					rvVo.setRv_md_star(rs.getInt("rv_md_star"));
					rvVo.setRv_date(rs.getTimestamp("rv_date"));
					rvVo.setRv_content(rs.getString("rv_content"));
					rvVoList.add(rvVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return rvVoList;
	}

	public ArrayList<ReviewVO> reviewList(String md_num, int start, int end) {

		String sql = "select * from (select rownum as rowN, " + "md_num, rv_num, userid, rv_md_star, "
				+ "rv_date, rv_content from (select * from " + "review where md_num = ? order by rv_date "
				+ "desc)) where rowN between ? and ?";

		ArrayList<ReviewVO> rvVoList = new ArrayList<ReviewVO>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					ReviewVO rvVo = new ReviewVO();
					rvVo.setMd_num(rs.getString("md_num"));
					rvVo.setRv_num(rs.getInt("rv_num"));
					rvVo.setUserID(rs.getString("userID"));
					rvVo.setRv_md_star(rs.getInt("rv_md_star"));
					rvVo.setRv_date(rs.getTimestamp("rv_date"));
					rvVo.setRv_content(rs.getString("rv_content"));
					rvVoList.add(rvVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return rvVoList;
	}

	public int total(String md_num) {
		String sql = "select count(*) from review where md_num =?";
		int total = 0;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_num);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					total = rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return total;
	}
}
