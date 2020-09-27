package com.delphinium.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.delphinium.dto.CartVO;
import com.delphinium.dto.MerchandiseVO;
import com.delphinium.dto.OrderVO;
import com.delphinium.util.DBManager;

public class OrderDAO {

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	private OrderDAO() {
	}

	private static OrderDAO instance = new OrderDAO();

	public static OrderDAO getInstance() {
		return instance;
	}

	public void order(String userID, int number) {
		String sql = "INSERT INTO orders (od_num, userID, md_num, md_name, "
				+ "cname, md_price, md_sim_pic, qty, md_op1_name, md_op2_name, "
				+ "md_op3_name, md_op1_val, md_op2_val, md_op3_val) "
				+ "SELECT concat('OD',od_seq.nextval), userID, md_num, md_name, cname, "
				+ "md_price, md_sim_pic, qty, md_op1_name, md_op2_name, "
				+ "md_op3_name, md_op1_val, md_op2_val, md_op3_val " + "FROM  cart WHERE num = ? and userID = ?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, userID);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void directOrder(CartVO cVo) {
		String sql = "insert into orders (od_num, userID, md_num, md_name, cname, md_price, md_sim_pic,"
				+ " qty, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, "
				+ "md_op3_val)values ('OD'||od_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		CartDAO cDao = CartDAO.getInstance();
		MerchandiseVO mVo = cDao.mdInfo(cVo.getMd_num());
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cVo.getUserID());
			pstmt.setString(2, cVo.getMd_num());
			pstmt.setString(3, cVo.getMd_name());
			pstmt.setString(4, mVo.getCname());
			pstmt.setInt(5, (mVo.getMd_price() * cVo.getQty()));
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

	public ArrayList<OrderVO> orderList(String userID, int start, int end) {
		ArrayList<OrderVO> oVoList = new ArrayList<OrderVO>();
		String sql = "select * from (select rownum as rowN, od_num, od_date, userID, "
				+ "md_num, md_name, cname, md_price, md_sim_pic, qty, md_op1_name, "
				+ "md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val from "
				+ "(select * from orders where userID =? order by od_date desc)) where rowN between ? and ?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					OrderVO oVo = new OrderVO();
					oVo.setOd_num(rs.getString("od_num"));
					oVo.setOd_date(rs.getTimestamp("od_date"));
					oVo.setUserID(rs.getString("userID"));
					oVo.setMd_num(rs.getString("md_num"));
					oVo.setCname(rs.getString("cname"));
					oVo.setMd_name(rs.getString("md_name"));
					oVo.setMd_price(rs.getInt("md_price"));
					oVo.setMd_sim_pic(rs.getString("md_sim_pic"));
					oVo.setQty(rs.getInt("qty"));
					oVo.setMd_op1_name(rs.getString("md_op1_name"));
					oVo.setMd_op2_name(rs.getString("md_op2_name"));
					oVo.setMd_op3_name(rs.getString("md_op3_name"));
					oVo.setMd_op1_val(rs.getString("md_op1_val"));
					oVo.setMd_op2_val(rs.getString("md_op2_val"));
					oVo.setMd_op3_val(rs.getString("md_op3_val"));
					oVoList.add(oVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return oVoList;
	}

	public OrderVO orderView(String od_num) {
		String sql = "select * from orders where od_num = ?";
		OrderVO oVo = new OrderVO();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, od_num);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					oVo.setOd_num(rs.getString("od_num"));
					oVo.setOd_date(rs.getTimestamp("od_date"));
					oVo.setUserID(rs.getString("userID"));
					oVo.setMd_num(rs.getString("md_num"));
					oVo.setCname(rs.getString("cname"));
					oVo.setMd_name(rs.getString("md_name"));
					oVo.setMd_price(rs.getInt("md_price"));
					oVo.setMd_sim_pic(rs.getString("md_sim_pic"));
					oVo.setQty(rs.getInt("qty"));
					oVo.setMd_op1_name(rs.getString("md_op1_name"));
					oVo.setMd_op2_name(rs.getString("md_op2_name"));
					oVo.setMd_op3_name(rs.getString("md_op3_name"));
					oVo.setMd_op1_val(rs.getString("md_op1_val"));
					oVo.setMd_op2_val(rs.getString("md_op2_val"));
					oVo.setMd_op3_val(rs.getString("md_op3_val"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return oVo;
	}

	public ArrayList<OrderVO> orderSearch(String userID, String query) {
		String sql = " select * from orders where userID = ? and upper(md_name) like ?";
		String up_query = query.toUpperCase();

		ArrayList<OrderVO> oVoList = new ArrayList<OrderVO>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, "%" + up_query + "%");
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					OrderVO oVo = new OrderVO();
					oVo.setOd_num(rs.getString("od_num"));
					oVo.setOd_date(rs.getTimestamp("od_date"));
					oVo.setUserID(rs.getString("userID"));
					oVo.setMd_num(rs.getString("md_num"));
					oVo.setCname(rs.getString("cname"));
					oVo.setMd_name(rs.getString("md_name"));
					oVo.setMd_price(rs.getInt("md_price"));
					oVo.setMd_sim_pic(rs.getString("md_sim_pic"));
					oVo.setQty(rs.getInt("qty"));
					oVo.setMd_op1_name(rs.getString("md_op1_name"));
					oVo.setMd_op2_name(rs.getString("md_op2_name"));
					oVo.setMd_op3_name(rs.getString("md_op3_name"));
					oVo.setMd_op1_val(rs.getString("md_op1_val"));
					oVo.setMd_op2_val(rs.getString("md_op2_val"));
					oVo.setMd_op3_val(rs.getString("md_op3_val"));
					oVoList.add(oVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return oVoList;
	}

	public String phone(String cname) {
		String sql = "select phone from member where cname = ?";
		String phone = "";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cname);

			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					phone = rs.getString("phone");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return phone;
	}

	public int total(String userID) {
		String sql = "select count(*) from orders where userID = ?";
		int total = -1;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
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
	};

	public ArrayList<String> canWriteReview(String md_num) {
		String sql = "select userID from orders where md_num = ?";
		ArrayList<String> userIDs = new ArrayList<String>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_num);
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					String userID = rs.getString("userID");
					userIDs.add(userID);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return userIDs;
	};
}