package cmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.jdbc.pool.DataSource;

import bbs.Bbs;

public class CommentDAO {
	private Connection conn;

	private ResultSet rs;
	PreparedStatement pstmt;

	public CommentDAO() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "se", "0000");


		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getSeq() {
		String SQL = "SELECT COMMENT_SEQ.NEXTVAL FROM DUAL";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 1; // ù �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}
	public String getDate() {
		String SQL = "select to_char(sysdate, 'yyyymmddhh24mmss') from dual";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1)+1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // �����ͺ��̽� ����
	}
	
	public int getDepth(int COMMENT_PARENT) {
		String SQL = "select  MAX(COMMENT_DEPTH) from BOARD_COMMENT WHERE COMMENT_PARENT = ?";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, COMMENT_PARENT);
			rs = pstmt.executeQuery();
			if (rs!= null) {
				  while (rs.next()) {
				    return rs.getInt(1);
				  }
				  return rs.getInt(1); //this will throw Exhausted resultset
				}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	// ��� ���
	public boolean insertComment(int COMMENT_NUM, int COMMENT_BOARD, String COMMENT_ID, int COMMENT_PARENT,
			String COMMENT_CONTENT,int COMMENT_SEQ) {
		boolean result = false;

		try {

			// �ڵ� Ŀ���� false�� �Ѵ�.

			String sql = "INSERT INTO BOARD_COMMENT(COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE, COMMENT_PARENT, COMMENT_CONTENT,COMMENT_SEQ)VALUES(?,?,?,sysdate,?,?,?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, COMMENT_NUM);
			pstmt.setInt(2, COMMENT_BOARD);
			pstmt.setString(3, COMMENT_ID);
			pstmt.setInt(4, COMMENT_PARENT);
			pstmt.setString(5, COMMENT_CONTENT);
			pstmt.setInt(6, getSeq());
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				result = true;
				conn.commit(); // �Ϸ�� Ŀ��
			}

		} catch (Exception e1) {

			e1.printStackTrace();
		}

		close();
		return result;
	} // end boardInsert();
	
	// ��� ���
	public boolean insertComment(int COMMENT_NUM, int COMMENT_BOARD, String COMMENT_ID, int COMMENT_PARENT,
			String COMMENT_CONTENT,int COMMENT_SEQ,int COMMENT_KIND) {
		boolean result = false;

		try {

			// �ڵ� Ŀ���� false�� �Ѵ�.

			String sql = "INSERT INTO BOARD_COMMENT(COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE, COMMENT_PARENT, COMMENT_CONTENT,COMMENT_SEQ,COMMENT_KIND)VALUES(?,?,?,sysdate,?,?,?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, COMMENT_NUM);
			pstmt.setInt(2, COMMENT_BOARD);
			pstmt.setString(3, COMMENT_ID);
			pstmt.setInt(4, COMMENT_PARENT);
			pstmt.setString(5, COMMENT_CONTENT);
			pstmt.setInt(6, getSeq());
			pstmt.setInt(7, 2);
			
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				result = true;
				conn.commit(); // �Ϸ�� Ŀ��
			}

		} catch (Exception e1) {

			e1.printStackTrace();
		}

		close();
		return result;
	} // end boardInsert();
	
	
	public boolean reple(int COMMENT_NUM, int COMMENT_BOARD, String COMMENT_ID, int COMMENT_PARENT,
			String COMMENT_CONTENT ,int COMMENT_DEPTH, int COMMENT_SEQ) {
		boolean result = false;

		try {

			// �ڵ� Ŀ���� false�� �Ѵ�.

			String sql = "INSERT INTO BOARD_COMMENT(COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE, COMMENT_PARENT, COMMENT_CONTENT, COMMENT_DEPTH, COMMENT_SEQ)VALUES(?,?,?,sysdate,?,?,?,?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, COMMENT_NUM);
			pstmt.setInt(2, COMMENT_BOARD);
			if (getDepth(COMMENT_PARENT) ==0)
			{
				pstmt.setString(3," �� "+COMMENT_ID);
			}
			else if (getDepth(COMMENT_PARENT) ==1)
			{
				pstmt.setString(3," ���� "+COMMENT_ID);
			}
			else if (getDepth(COMMENT_PARENT) ==2)
			{
				pstmt.setString(3," ������ "+COMMENT_ID);
			}
			else {
				pstmt.setString(3," �������� "+COMMENT_ID);
			}
			pstmt.setInt(4, COMMENT_PARENT);
			pstmt.setString(5,COMMENT_CONTENT);
			pstmt.setInt(6, getDepth(COMMENT_PARENT)+1);
			pstmt.setInt(7, COMMENT_SEQ);
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				result = true;
				conn.commit(); // �Ϸ�� Ŀ��
			}

		} catch (Exception e1) {

			e1.printStackTrace();
		}

		close();
		return result;
	} // end boardInsert();
	
	public boolean reple(int COMMENT_NUM, int COMMENT_BOARD, String COMMENT_ID, int COMMENT_PARENT,
			String COMMENT_CONTENT ,int COMMENT_DEPTH, int COMMENT_SEQ, int COMMENT_KIND) {
		boolean result = false;

		try {

			// �ڵ� Ŀ���� false�� �Ѵ�.

			String sql = "INSERT INTO BOARD_COMMENT(COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE, COMMENT_PARENT, COMMENT_CONTENT, COMMENT_DEPTH, COMMENT_SEQ, COMMENT_KIND)VALUES(?,?,?,sysdate,?,?,?,?,?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, COMMENT_NUM);
			pstmt.setInt(2, COMMENT_BOARD);
			if (getDepth(COMMENT_PARENT) ==0)
			{
				pstmt.setString(3," �� "+COMMENT_ID);
			}
			else if (getDepth(COMMENT_PARENT) ==1)
			{
				pstmt.setString(3," ���� "+COMMENT_ID);
			}
			else if (getDepth(COMMENT_PARENT) ==2)
			{
				pstmt.setString(3," ������ "+COMMENT_ID);
			}
			else {
				pstmt.setString(3," �������� "+COMMENT_ID);
			}
			pstmt.setInt(4, COMMENT_PARENT);
			pstmt.setString(5,COMMENT_CONTENT);
			pstmt.setInt(6, getDepth(COMMENT_PARENT)+1);
			pstmt.setInt(7, COMMENT_SEQ);
			pstmt.setInt(8, 2);
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				result = true;
				conn.commit(); // �Ϸ�� Ŀ��
			}

		} catch (Exception e1) {

			e1.printStackTrace();
		}

		close();
		return result;
	} // end boardInsert();

	public int getNext() {
		String SQL = "SELECT COMMENT_NUM FROM BOARD_COMMENT ORDER BY COMMENT_NUM DESC";
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

	// ��� ��� ��������
	public ArrayList<Comment> getCommentList(int boardNum) {
		ArrayList<Comment> list = new ArrayList<Comment>();

		try {

			/*
			 * ����� ������ ó���� �ϰ�ʹٸ� �� ������ ����ϸ� �ȴ�. SELECT * FROM (SELECT ROWNUM AS rnum, data.*
			 * FROM (SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE,
			 * COMMENT_PARENT, COMMENT_CONTENT FROM BOARD_COMMENT WHERE COMMENT_BOARD = ?
			 * START WITH COMMENT_PARENT = 0 CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT)
			 * data) WHERE rnum>=? and rnum<=? ;
			 */

			StringBuffer sql = new StringBuffer();
			sql.append("    SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD,");
			sql.append("            COMMENT_ID, COMMENT_DATE,");
			sql.append("            COMMENT_PARENT, COMMENT_CONTENT");
			sql.append("    FROM BOARD_COMMENT");
			sql.append("    WHERE COMMENT_BOARD = ?");
			sql.append("    START WITH COMMENT_PARENT = 0");
			sql.append("    CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNum);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();

				comment.setComment_num(rs.getInt("COMMENT_NUM"));
				comment.setComment_board(rs.getInt("COMMENT_BOARD"));
				comment.setComment_id(rs.getString("COMMENT_ID"));
				comment.setComment_date(rs.getString("COMMENT_DATE"));
				comment.setComment_parent(rs.getInt("COMMENT_PARENT"));
				comment.setComment_content(rs.getString("COMMENT_CONTENT"));
				list.add(comment);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}

		close();
		return list;
	} // end getCommentList
	
	public ArrayList<Comment> getCommentList(int boardNum, int COMMENT_KIND) {
		ArrayList<Comment> list = new ArrayList<Comment>();

		try {

			/*
			 * ����� ������ ó���� �ϰ�ʹٸ� �� ������ ����ϸ� �ȴ�. SELECT * FROM (SELECT ROWNUM AS rnum, data.*
			 * FROM (SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE,
			 * COMMENT_PARENT, COMMENT_CONTENT FROM BOARD_COMMENT WHERE COMMENT_BOARD = ?
			 * START WITH COMMENT_PARENT = 0 CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT)
			 * data) WHERE rnum>=? and rnum<=? ;
			 */

			StringBuffer sql = new StringBuffer();
			sql.append("    SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD,");
			sql.append("            COMMENT_ID, COMMENT_DATE,");
			sql.append("            COMMENT_PARENT, COMMENT_CONTENT");
			sql.append("    FROM BOARD_COMMENT");
			sql.append("    WHERE COMMENT_BOARD = ? AND COMMENT_KIND=2");
			sql.append("    START WITH COMMENT_PARENT = 0");
			sql.append("    CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNum);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();

				comment.setComment_num(rs.getInt("COMMENT_NUM"));
				comment.setComment_board(rs.getInt("COMMENT_BOARD"));
				comment.setComment_id(rs.getString("COMMENT_ID"));
				comment.setComment_date(rs.getString("COMMENT_DATE"));
				comment.setComment_parent(rs.getInt("COMMENT_PARENT"));
				comment.setComment_content(rs.getString("COMMENT_CONTENT"));
				list.add(comment);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}

		close();
		return list;
	} // end getCommentList
	
	
	public ArrayList<Comment> getRepleList(int boardNum) {
		ArrayList<Comment> list = new ArrayList<Comment>();

		try {

			/*
			 * ����� ������ ó���� �ϰ�ʹٸ� �� ������ ����ϸ� �ȴ�. SELECT * FROM (SELECT ROWNUM AS rnum, data.*
			 * FROM (SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE,
			 * COMMENT_PARENT, COMMENT_CONTENT FROM BOARD_COMMENT WHERE COMMENT_BOARD = ?
			 * START WITH COMMENT_PARENT = 0 CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT)
			 * data) WHERE rnum>=? and rnum<=? ;
			 */

			StringBuffer sql = new StringBuffer();
			sql.append("select  * from BOARD_COMMENT WHERE COMMENT_BOARD = ? START WITH COMMENT_PARENT =0 CONNECT BY PRIOR  COMMENT_NUM= COMMENT_PARENT ORDER SIBLINGS BY COMMENT_NUM ASC");


			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNum);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();

				comment.setComment_num(rs.getInt("COMMENT_NUM"));
				comment.setComment_board(rs.getInt("COMMENT_BOARD"));
				comment.setComment_id(rs.getString("COMMENT_ID"));
				comment.setComment_date(rs.getString("COMMENT_DATE"));
				comment.setComment_parent(rs.getInt("COMMENT_PARENT"));
				comment.setComment_content(rs.getString("COMMENT_CONTENT"));
				comment.setComment_parent(rs.getInt("COMMENT_DEPTH"));
				comment.setComment_parent(rs.getInt("COMMENT_SEQ"));
				list.add(comment);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}

		close();
		return list;
	} // end getCommentList
	
	public ArrayList<Comment> getRepleList(int boardNum,int COMMENT_KIND) {
		ArrayList<Comment> list = new ArrayList<Comment>();

		try {

			/*
			 * ����� ������ ó���� �ϰ�ʹٸ� �� ������ ����ϸ� �ȴ�. SELECT * FROM (SELECT ROWNUM AS rnum, data.*
			 * FROM (SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE,
			 * COMMENT_PARENT, COMMENT_CONTENT FROM BOARD_COMMENT WHERE COMMENT_BOARD = ?
			 * START WITH COMMENT_PARENT = 0 CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT)
			 * data) WHERE rnum>=? and rnum<=? ;
			 */

			StringBuffer sql = new StringBuffer();
			sql.append("select  * from BOARD_COMMENT WHERE COMMENT_KIND=2 COMMENT_BOARD = ? START WITH COMMENT_PARENT =0 CONNECT BY PRIOR  COMMENT_NUM= COMMENT_PARENT ORDER SIBLINGS BY COMMENT_NUM ASC");


			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNum);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();

				comment.setComment_num(rs.getInt("COMMENT_NUM"));
				comment.setComment_board(rs.getInt("COMMENT_BOARD"));
				comment.setComment_id(rs.getString("COMMENT_ID"));
				comment.setComment_date(rs.getString("COMMENT_DATE"));
				comment.setComment_parent(rs.getInt("COMMENT_PARENT"));
				comment.setComment_content(rs.getString("COMMENT_CONTENT"));
				comment.setComment_parent(rs.getInt("COMMENT_DEPTH"));
				comment.setComment_parent(rs.getInt("COMMENT_SEQ"));
				list.add(comment);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}

		close();
		return list;
	} // end getCommentList
	
	public Comment getCmt(int bbsID) {
		String SQL = "SELECT * FROM BOARD_COMMENT WHERE COMMENT_BOARD=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Comment cmt = new Comment();
				cmt.setComment_num(rs.getInt(1));
				cmt.setComment_board(rs.getInt(2));
				cmt.setComment_id(rs.getString(3));
				cmt.setComment_date(rs.getString(4));
				cmt.setComment_parent(rs.getInt(5));
				cmt.setComment_content(rs.getString(6));
				return cmt;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	// DB �ڿ�����
	private void close() {
		try {
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	} // end close()

}
