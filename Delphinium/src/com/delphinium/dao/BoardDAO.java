package com.delphinium.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.delphinium.dto.BoardVO;
import com.delphinium.util.DBManager;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	private BoardDAO() {

	}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	public void boardWrite(BoardVO bVo, int b_cate) {
		if (b_cate == 0) {
			String sql = "insert into board(b_cate, b_num, b_title, b_content) values(?, no_seq.nextval, ?, ?)";

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, 0);
				pstmt.setString(2, bVo.getB_title());
				pstmt.setString(3, bVo.getB_content());

				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}

		if (b_cate == 1) {
			String sql = "insert into board(b_cate, b_num, b_title, b_content, b_pic1, b_pic2, b_pic3) values(?, pro_seq.nextval, ?, ?, ?, ?, ?)";

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, 1);
				pstmt.setString(2, bVo.getB_title());
				pstmt.setString(3, bVo.getB_content());
				pstmt.setString(4, bVo.getB_pic1());
				pstmt.setString(5, bVo.getB_pic2());
				pstmt.setString(6, bVo.getB_pic3());

				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}

	};

	public void noticeEdit(BoardVO bVo, int b_num) {

		String sql = "update board set b_title=?, b_content=? where b_num=? and b_cate = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bVo.getB_title());
			pstmt.setString(2, bVo.getB_content());
			pstmt.setInt(3, b_num);
			pstmt.setInt(4, 0);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	};

	public void promotionEdit(BoardVO bVo, int b_num) {

		try {
			conn = DBManager.getConnection();

			if (bVo.getB_pic1() == null) {
				String sqlPic1 = "select b_pic1 from board where b_num=? and b_cate = 1";
				pstmt = conn.prepareStatement(sqlPic1);
				pstmt.setInt(1, b_num);
				rs = pstmt.executeQuery();
				if (rs != null) {
					if (rs.next()) {
						String pic1 = rs.getString("b_pic1");
						bVo.setB_pic1(pic1);
					}
				}
			}
			if (bVo.getB_pic2() == null) {
				String sqlPic2 = "select b_pic2 from board where b_num=? and b_cate = 1";
				pstmt = conn.prepareStatement(sqlPic2);
				pstmt.setInt(1, b_num);
				rs = pstmt.executeQuery();
				if (rs != null) {
					if (rs.next()) {
						String pic2 = rs.getString("b_pic2");
						bVo.setB_pic2(pic2);
					}
				}
			}
			if (bVo.getB_pic3() == null) {
				String sqlPic3 = "select b_pic3 from board where b_num=? and b_cate = 1";
				pstmt = conn.prepareStatement(sqlPic3);
				pstmt.setInt(1, b_num);
				rs = pstmt.executeQuery();
				if (rs != null) {
					if (rs.next()) {
						String pic3 = rs.getString("b_pic3");
						bVo.setB_pic3(pic3);
					}
				}
			}

			String sql = "update board set b_title=?, b_content=?, b_pic1 =?, b_pic2 =?, b_pic3=? where b_num=? and b_cate = 1";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bVo.getB_title());
			pstmt.setString(2, bVo.getB_content());
			pstmt.setString(3, bVo.getB_pic1());
			pstmt.setString(4, bVo.getB_pic2());
			pstmt.setString(5, bVo.getB_pic3());
			pstmt.setInt(6, b_num);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	};

	public void boardDelete(int b_cate, int b_num) {
		String sql = "delete board where b_cate=? and b_num=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, b_cate);
			pstmt.setInt(2, b_num);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	};

	public BoardVO noticeView(int b_num) {

		String sql = "select  * from board where b_cate = ? and b_num = ?";
		BoardVO bVo = new BoardVO();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, (b_num));
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {

					bVo.setB_cate(0);
					bVo.setB_num(b_num);
					bVo.setB_title(rs.getString("b_title"));
					bVo.setB_date(rs.getTimestamp("b_date"));
					bVo.setB_content(rs.getString("b_content"));
					bVo.setB_pic1(rs.getString("b_pic1"));
					bVo.setB_pic2(rs.getString("b_pic2"));
					bVo.setB_pic3(rs.getString("b_pic3"));

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	};

	public BoardVO promotionView(int B_Num) {
		String sql = "select  * from board where b_cate = ? and b_num = ?";
		BoardVO bVo = new BoardVO();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, B_Num);
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {

					bVo.setB_cate(1);
					bVo.setB_num(B_Num);
					bVo.setB_title(rs.getString("b_title"));
					bVo.setB_date(rs.getTimestamp("b_date"));
					bVo.setB_content(rs.getString("b_content"));
					bVo.setB_pic1(rs.getString("b_pic1"));
					bVo.setB_pic2(rs.getString("b_pic2"));
					bVo.setB_pic3(rs.getString("b_pic3"));

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	};

	public int totalNotice() {
		String sql = "select count(*) from board where b_cate = 0";
		int totalNotice = -1;
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs != null) {
				if (rs.next()) {
					totalNotice = rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return totalNotice;
	};

	public int totalPromotion() {
		String sql = "select count(*) from board where b_cate = 1";
		int totalPromotion = -1;
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs != null) {
				if (rs.next()) {
					totalPromotion = rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return totalPromotion;
	};

	public ArrayList<BoardVO> getNoticeLists(int start, int end) {

		String sql = "select * from "
				+ "(select rownum as rowN, b_cate, b_num, b_title, b_date, b_content, b_pic1, b_pic2, b_pic3 "
				+ "from (select * from board where b_cate = 0 order by b_num desc)) where rowN between ? and ?";

		ArrayList<BoardVO> noVoList = new ArrayList<BoardVO>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					BoardVO bVo = new BoardVO();

					bVo.setB_cate(0);
					bVo.setB_num(rs.getInt("b_num"));
					bVo.setB_title(rs.getString("b_title"));
					bVo.setB_date(rs.getTimestamp("b_date"));
					bVo.setB_content(rs.getString("b_content"));
					bVo.setB_pic1(rs.getString("b_pic1"));
					bVo.setB_pic2(rs.getString("b_pic2"));
					bVo.setB_pic3(rs.getString("b_pic3"));

					noVoList.add(bVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return noVoList;
	};

	public ArrayList<BoardVO> getPromotionLists(int start, int end) {

		String sql = "select * from "
				+ "(select rownum as rowN, b_cate, b_num, b_title, b_date, b_content, b_pic1, b_pic2, b_pic3 "
				+ "from (select * from board where b_cate = 1 order by b_num desc)) where rowN between ? and ?";

		ArrayList<BoardVO> noVoList = new ArrayList<BoardVO>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					BoardVO bVo = new BoardVO();

					bVo.setB_cate(1);
					bVo.setB_num(rs.getInt("b_num"));
					bVo.setB_title(rs.getString("b_title"));
					bVo.setB_date(rs.getTimestamp("b_date"));
					bVo.setB_content(rs.getString("b_content"));
					bVo.setB_pic1(rs.getString("b_pic1"));
					bVo.setB_pic2(rs.getString("b_pic2"));
					bVo.setB_pic3(rs.getString("b_pic3"));

					noVoList.add(bVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return noVoList;
	};

}
