package com.delphinium.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.delphinium.dto.QnAVO;
import com.delphinium.util.DBManager;

public class QnADAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	int curNum = 1;

	private QnADAO() {
	}

	private static QnADAO instance = new QnADAO();

	public static QnADAO getInstance() {
		return instance;
	}

	public void qaWrite(QnAVO qVo) {
		String sql = "insert into qa(md_num, qa_num, userID, qa_title, qa_content, qa_ans) values(?, qa_seq.nextval, ?, ?, ?, ?)";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qVo.getMd_num());
			pstmt.setString(2, qVo.getUserID());
			pstmt.setString(3, qVo.getQa_title());
			pstmt.setString(4, qVo.getQa_content());
			pstmt.setString(5, "답변이 아직 등록되지 않았습니다.");

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void ansWrite(int qa_num, String qa_ans) {
		String sql = "update qa set qa_ans=? where qa_num=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qa_ans);
			pstmt.setInt(2, qa_num);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void qaEdit(QnAVO qVo) {
		String sql = "update qa set qa_title=?, qa_content=?, qa_ans = ? where md_num=? and qa_num=? and userID=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			if (qVo.getQa_ans() == null) {
				sql = "update qa set qa_title=?, qa_content=? where md_num=? and qa_num=? and userID=?";
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, qVo.getQa_title());
				pstmt.setString(2, qVo.getQa_content());
				pstmt.setString(3, qVo.getMd_num());
				pstmt.setInt(4, qVo.getQa_num());
				pstmt.setString(5, qVo.getUserID());
			} else {
				pstmt.setString(1, qVo.getQa_title());
				pstmt.setString(2, qVo.getQa_content());
				pstmt.setString(3, qVo.getQa_ans());
				pstmt.setString(4, qVo.getMd_num());
				pstmt.setInt(5, qVo.getQa_num());
				pstmt.setString(6, qVo.getUserID());
			}
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	};

	public void qaDelete(int qa_num) {
		String sql = "delete from qa where qa_num = ?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qa_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	};

	public ArrayList<QnAVO> ownQAView(String md_num, String userID) {
		String sql = "select * from qa where userID = ? and md_num =? order by qa_date desc";
		ArrayList<QnAVO> qVoList = new ArrayList<QnAVO>();
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, md_num);
			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					QnAVO qVo = new QnAVO();
					qVo.setMd_num(rs.getString("md_num"));
					qVo.setQa_num(rs.getInt("qa_num"));
					qVo.setUserID(rs.getString("userID"));
					qVo.setQa_title(rs.getString("qa_title"));
					qVo.setQa_date(rs.getTimestamp("qa_date"));
					qVo.setQa_content(rs.getString("qa_content"));
					qVo.setQa_ans(rs.getString("qa_ans"));
					qVoList.add(qVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		System.out.println(qVoList);
		return qVoList;
	};

	public ArrayList<QnAVO> qaOne(String md_num) {
		String sql = "select * from qa where md_num = ? order by qa_date desc";
		ArrayList<QnAVO> qVoList = new ArrayList<QnAVO>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_num);
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					QnAVO qVo = new QnAVO();
					qVo.setMd_num(rs.getString("md_num"));
					qVo.setQa_num(rs.getInt("qa_num"));
					qVo.setUserID(rs.getString("userID"));
					qVo.setQa_title(rs.getString("qa_title"));
					qVo.setQa_date(rs.getTimestamp("qa_date"));
					qVo.setQa_content(rs.getString("qa_content"));
					qVo.setQa_ans(rs.getString("qa_ans"));
					qVoList.add(qVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return qVoList;
	}

	public QnAVO qaView(String md_num, String userID, String qa_num) {
		String sql = "select * from qa where md_num = ? and userID = ? and qa_num = ?";
		QnAVO qVo = new QnAVO();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_num);
			pstmt.setString(2, userID);
			pstmt.setString(3, qa_num);
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					qVo.setMd_num(rs.getString("md_num"));
					qVo.setQa_num(rs.getInt("qa_num"));
					qVo.setUserID(rs.getString("userID"));
					qVo.setQa_title(rs.getString("qa_title"));
					qVo.setQa_date(rs.getTimestamp("qa_date"));
					qVo.setQa_content(rs.getString("qa_content"));
					qVo.setQa_ans(rs.getString("qa_ans"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return qVo;
	}

	public ArrayList<QnAVO> qaList(String md_num, int start, int end) {
		String sql = "select * from (select rownum as rowN, " + "md_num, qa_num, userid, qa_title, qa_date, "
				+ "qa_content, qa_ans from (select * from qa "
				+ "where md_num = ? order by qa_date desc)) where rowN between ? and ?";

		ArrayList<QnAVO> qVoList = new ArrayList<QnAVO>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, md_num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					QnAVO qVo = new QnAVO();
					qVo.setMd_num(rs.getString("md_num"));
					qVo.setQa_num(rs.getInt("qa_num"));
					qVo.setUserID(rs.getString("userID"));
					qVo.setQa_title(rs.getString("qa_title"));
					qVo.setQa_date(rs.getTimestamp("qa_date"));
					qVo.setQa_content(rs.getString("qa_content"));
					qVo.setQa_ans(rs.getString("qa_ans"));
					qVoList.add(qVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return qVoList;
	}

	public int total(String md_num) {
		String sql = "select count(*) from qa where md_num = ?";
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