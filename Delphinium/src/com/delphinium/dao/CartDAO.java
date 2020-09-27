package com.delphinium.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.delphinium.dto.CartVO;
import com.delphinium.dto.MerchandiseVO;
import com.delphinium.util.DBManager;

public class CartDAO {

	private static CartDAO instance = new CartDAO();

	public static CartDAO getInstance() {
		return instance;
	}

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	public ArrayList<CartVO> viewCart(String userID) {
		ArrayList<CartVO> cVoList = new ArrayList<CartVO>();
		String sql = "select * from cart where userID = ? order by num desc";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					CartVO cVo = new CartVO();
					cVo.setNumber(rs.getInt("num"));
					cVo.setUserID(rs.getString("userID"));
					cVo.setMd_num(rs.getString("md_num"));
					cVo.setCname(rs.getString("cname"));
					cVo.setMd_name(rs.getString("md_name"));
					cVo.setMd_price(rs.getInt("md_price"));
					cVo.setMd_sim_pic(rs.getString("md_sim_pic"));
					cVo.setQty(rs.getInt("qty"));
					cVo.setMd_op1_name(rs.getString("md_op1_name"));
					cVo.setMd_op2_name(rs.getString("md_op2_name"));
					cVo.setMd_op3_name(rs.getString("md_op3_name"));
					cVo.setMd_op1_val(rs.getString("md_op1_val"));
					cVo.setMd_op2_val(rs.getString("md_op2_val"));
					cVo.setMd_op3_val(rs.getString("md_op3_val"));
					cVoList.add(cVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return cVoList;
	}

	public void addCart(CartVO cVo) {
		String sql = "insert into cart values (cart_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		MerchandiseVO mVo = mdInfo(cVo.getMd_num());
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cVo.getUserID());
			pstmt.setString(2, cVo.getMd_num());
			pstmt.setString(3, cVo.getMd_name());
			pstmt.setString(4, mVo.getCname());
			pstmt.setInt(5, mVo.getMd_price());
			pstmt.setString(6, mVo.getMd_sim_pic());
			pstmt.setInt(7, cVo.getQty());
			pstmt.setString(8, cVo.getMd_op1_name());
			pstmt.setString(9, cVo.getMd_op2_name());
			pstmt.setString(10, cVo.getMd_op3_name());
			pstmt.setString(11, cVo.getMd_op1_val());
			pstmt.setString(12, cVo.getMd_op2_val());
			pstmt.setString(13, cVo.getMd_op3_val());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void editCart(CartVO cVo) {
		String sql = "update cart set qty = ?, md_op1_name =?,  md_op2_name =?,  md_op3_name =?, "
				+ "md_op1_val =?, md_op2_val =?, md_op3_val =? where userID = ? and num = ?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cVo.getQty());
			pstmt.setString(2, cVo.getMd_op1_name());
			pstmt.setString(3, cVo.getMd_op2_name());
			pstmt.setString(4, cVo.getMd_op3_name());
			pstmt.setString(5, cVo.getMd_op1_val());
			pstmt.setString(6, cVo.getMd_op2_val());
			pstmt.setString(7, cVo.getMd_op3_val());
			pstmt.setString(8, cVo.getUserID());
			pstmt.setInt(9, cVo.getNumber());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void deleteCart(String userID, int number) {
		String sql = "delete from cart where userID = ? and num = ?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setInt(2, number);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void emptyCart(String userID) {
		String sql = "delete from cart where userID = ?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public MerchandiseVO mdInfo(String md_num) {
		String sql = "select cname, md_name, md_price, md_sim_pic from merchandise where md_num = ?";
		MerchandiseVO mVo = new MerchandiseVO();
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_num);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					mVo.setCname(rs.getString("cname"));
					mVo.setMd_name(rs.getString("md_name"));
					mVo.setMd_price(rs.getInt("md_price"));
					mVo.setMd_sim_pic(rs.getString("md_sim_pic"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mVo;
	}

}
