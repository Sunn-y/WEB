package com.delphinium.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.delphinium.dto.MemberVO;
import com.delphinium.util.DBManager;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	private MemberDAO() {

	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public int confirmID(String userID) {
		String sql = "select userID from member where userID = ?";
		int result = -1;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					result = 1; // 아이디 중복
				} else {
					result = -1; // 사용 가능한 아이디
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}

	public void conJoin(MemberVO mVo) {
		String sql = " insert into Member (userLevel, userID, userPW, "
				+ "name, birth, gender, phone, address, event) values" + " ( ? , ? , ? , ? , ? , ? , ? , ? , ?) ";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, mVo.getUserLevel());
			pstmt.setString(2, mVo.getUserID());
			pstmt.setString(3, mVo.getUserPW());
			pstmt.setString(4, mVo.getName());
			pstmt.setString(5, mVo.getBirth());
			pstmt.setInt(6, mVo.getGender());
			pstmt.setString(7, mVo.getPhone());
			pstmt.setString(8, mVo.getAddress());
			pstmt.setInt(9, mVo.getEvent());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void marJoin(MemberVO mVo) {
		System.out.println("memberDAO.marJoin 호출");
		String sql = " insert into Member (userLevel, userID, userPW, cname, " + "name, phone, address, sns) values"
				+ " ( ? , ? , ? , ? , ? , ? , ? , ? ) ";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, mVo.getUserLevel());
			pstmt.setString(2, mVo.getUserID());
			pstmt.setString(3, mVo.getUserPW());
			pstmt.setString(4, mVo.getCName());
			pstmt.setString(5, mVo.getName());
			pstmt.setString(6, mVo.getPhone());
			pstmt.setString(7, mVo.getAddress());
			pstmt.setString(8, mVo.getSNS());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public int checkUserLevel(String userID) {
		String sql = " select userLevel from Member where userID = ? ";
		int result = -1; // 존재 X

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					result = rs.getInt("userLevel");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}

	public int login(String userID, String userPW) {
		String sql = " select userPW from Member where userID = ? ";
		int result = -1; // 존재 X

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					String DBPW = rs.getString("userPW");
					if (userPW.equals(DBPW)) {
						result = 1; // 로그인 성공
					}
					if (!(userPW.equals(DBPW))) {
						result = 0; // 아이디는 있으나 비번 불일치
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}

	public MemberVO mypage(String loginUser) {

		MemberVO mVo = new MemberVO();
		String sql = " select * from member where userID = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginUser);

			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					mVo.setUserLevel(rs.getInt("userLevel"));
					mVo.setUserID(rs.getString("userID"));
					mVo.setUserPW(rs.getString("userPW"));
					mVo.setCName(rs.getString("CName"));
					mVo.setName(rs.getString("name"));
					mVo.setBirth(rs.getString("birth"));
					mVo.setGender(rs.getInt("gender"));
					mVo.setPhone(rs.getString("phone"));
					mVo.setAddress(rs.getString("address"));
					mVo.setRegiDate(rs.getTimestamp("regiDate"));
					mVo.setSNS(rs.getString("SNS"));
					mVo.setEvent(rs.getInt("event"));

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return mVo;
	}

	public MemberVO marketInfo(String cname) {

		MemberVO mVo = new MemberVO();
		String sql = " select * from member where cname = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cname);

			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					mVo.setUserLevel(rs.getInt("userLevel"));
					mVo.setUserID(rs.getString("userID"));
					mVo.setUserPW(rs.getString("userPW"));
					mVo.setCName(rs.getString("CName"));
					mVo.setName(rs.getString("name"));
					mVo.setBirth(rs.getString("birth"));
					mVo.setGender(rs.getInt("gender"));
					mVo.setPhone(rs.getString("phone"));
					mVo.setAddress(rs.getString("address"));
					mVo.setRegiDate(rs.getTimestamp("regiDate"));
					mVo.setSNS(rs.getString("SNS"));
					mVo.setEvent(rs.getInt("event"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return mVo;
	}

	public void conEdit(MemberVO mVo, String loginUser) {

		String sql = " update Member set userPW=?, phone=?, address=?, event=? where userID=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mVo.getUserPW());
			pstmt.setString(2, mVo.getPhone());
			pstmt.setString(3, mVo.getAddress());
			pstmt.setInt(4, mVo.getEvent());
			pstmt.setString(5, loginUser);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

	public void marEdit(MemberVO mVo, String loginUser) {

		String sql = " update Member set userPW=?, name=?, phone=?, address=?, SNS=?, event=? where userID=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mVo.getUserPW());
			pstmt.setString(2, mVo.getName());
			pstmt.setString(3, mVo.getPhone());
			pstmt.setString(4, mVo.getAddress());
			pstmt.setString(5, mVo.getSNS());
			pstmt.setInt(6, mVo.getEvent());
			pstmt.setString(7, loginUser);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

	public void memberDelete(String loginUser) {
		String sql = " delete from member where userID = ? ";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, loginUser);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

	public ArrayList<MemberVO> memberList() {
		String sql = " select * from member";
		ArrayList<MemberVO> mVoList = new ArrayList<MemberVO>();

		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs != null) {
				while (rs.next()) {

					MemberVO mVo = new MemberVO();
					mVo.setUserLevel(rs.getInt("userLevel"));
					mVo.setUserID(rs.getString("userID"));
					mVo.setUserPW(rs.getString("userPW"));
					mVo.setCName(rs.getString("CName"));
					mVo.setName(rs.getString("name"));
					mVo.setBirth(rs.getString("birth"));
					mVo.setGender(rs.getInt("gender"));
					mVo.setPhone(rs.getString("phone"));
					mVo.setAddress(rs.getString("address"));
					mVo.setRegiDate(rs.getTimestamp("regiDate"));
					mVo.setSNS(rs.getString("SNS"));
					mVo.setEvent(rs.getInt("event"));

					mVoList.add(mVo);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return mVoList;

	}

	public ArrayList<MemberVO> memberSearch(String where, String query) {
		ArrayList<MemberVO> mVoList = new ArrayList<MemberVO>();
		int userLevel = -1;

		try {
			conn = DBManager.getConnection();

			if (where.equals("userLevel")) {
				if (query.equals("일반")) {
					userLevel = 1;
				}
				if (query.equals("기업")) {
					userLevel = 2;
				}
				String sql1 = " select * from member where userLevel like ?";
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, userLevel);
			}

			if (where.equals("userID")) {
				String sql2 = " select * from member where userID like ?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, "%" + query + "%");
			}

			if (where.equals("name")) {
				String sql3 = " select * from member where name like ?";
				pstmt = conn.prepareStatement(sql3);
				pstmt.setString(1, "%" + query + "%");
			}

			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {

					MemberVO mVo = new MemberVO();
					mVo.setUserLevel(rs.getInt("userLevel"));
					mVo.setUserID(rs.getString("userID"));
					mVo.setUserPW(rs.getString("userPW"));
					mVo.setCName(rs.getString("CName"));
					mVo.setName(rs.getString("name"));
					mVo.setBirth(rs.getString("birth"));
					mVo.setGender(rs.getInt("gender"));
					mVo.setPhone(rs.getString("phone"));
					mVo.setAddress(rs.getString("address"));
					mVo.setRegiDate(rs.getTimestamp("regiDate"));
					mVo.setSNS(rs.getString("SNS"));
					mVo.setEvent(rs.getInt("event"));

					mVoList.add(mVo);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mVoList;
	}

}
