package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;

	private ResultSet rs;

	public BbsDAO() {

		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "se";
			String dbPassword = "0000";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn  = DriverManager.getConnection(dbURL, dbID,dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

	public String getDate() {
		String SQL = "select to_char(sysdate, 'yyyymmddhh24mmss') from dual";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // �����ͺ��̽� ����
	}

	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // ù �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}

	public int write(String bbsTitle, String UserID, String bbsContent) {
		String SQL = "INSERT INTO bbs VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, UserID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	} 
	 

	public ArrayList<Bbs> getList(int pageNumber) {
			
		String SQL = "SELECT BBSID, BBSTITLE, USERID, BBSDATE,BBSCONTENT, BBSAVAILABLE FROM(SELECT bbs.*,ROW_NUMBER() OVER (ORDER BY BBSID) LIMIT_NUM FROM BBS )WHERE BBS_KIND=1 AND BBSID<? AND BBSAVAILABLE =1 AND LIMIT_NUM BETWEEN ?-10 AND ?";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			pstmt.setInt(2, getNext() - (pageNumber - 1) * 10);
			pstmt.setInt(3, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				

				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	
	}
	
	
	public ArrayList<Bbs> getList(int pageNumber, int bbs_kind) {
		
		String SQL = "SELECT BBSID, BBSTITLE, USERID, BBSDATE,BBSCONTENT, BBSAVAILABLE FROM(SELECT bbs.*,ROW_NUMBER() OVER (ORDER BY BBSID) LIMIT_NUM FROM BBS )WHERE BBS_KIND=2 AND BBSID<? AND BBSAVAILABLE =1 AND LIMIT_NUM BETWEEN ?-10 AND ?";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			pstmt.setInt(2, getNext() - (pageNumber - 1) * 10);
			pstmt.setInt(3, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				

				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	
	}
	

	public int write(String bbsTitle, String UserID, String bbsContent, int bbs_kind) {
		String SQL = "INSERT INTO bbs VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, UserID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, bbs_kind);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	} 
	 

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM bbs WHERE BBSID<? AND BBSAVAILABLE =1 ";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM bbS WHERE bbsID=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = 
				"MERGE INTO BBS USING DUAL ON (BBSID = ?) WHEN MATCHED THEN UPDATE SET BBSTITLE=?, BBSCONTENT=? WHEN NOT MATCHED THEN INSERT (BBSID, BBSTITLE, BBSCONTENT) VALUES (?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContent);
			pstmt.setInt(4, bbsID);
			pstmt.setString(5, bbsTitle);
			pstmt.setString(6, bbsContent);
			
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}

	public int delete(int bbsID) {
		String SQL = "MERGE INTO BBS USING DUAL ON (BBSID = ?) WHEN MATCHED THEN UPDATE SET BBSAVAILABLE=0  WHEN NOT MATCHED THEN INSERT (BBSID, BBSAVAILABLE) VALUES (?, 0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.setInt(2, bbsID);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}
}
