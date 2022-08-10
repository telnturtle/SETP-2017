package UserPointMapping;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Calendar;

public class UserPointMappingDao {
    private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
//    private static final String dbUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
    private static final String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    private String dbId = "scott";
    private String dbPassword = "tiger";
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    
    public UserPointMappingDao() {
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(dbUrl, dbId, dbPassword);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public int join(String userId) {
        String SQL = "INSERT INTO UserPointMapping VALUES (?,?,sysdate)";
        if (userId != null) {
        	try {
	            pstmt = conn.prepareStatement(SQL);
	            pstmt.setString(1, userId);
	            pstmt.setInt(2, 100);
	            return pstmt.executeUpdate(); // 정상 -> return 1
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
        } else {
        	return -2; // cannot insert null into ~
        }
        
        return -1;
    }

    public int getPoint(String userId) {
        String SQL = "select point from UserPointMapping where userid=?";
        int point = 0;
        try {
            pstmt = conn.prepareStatement(SQL); 
            pstmt.setString(1,  userId); 
            rs = pstmt.executeQuery();
            rs.next();
            point = rs.getInt("point");
            rs.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return point;
    }

    public void setPoint(int point, String userId) {
    	String SQL = "update UserPointMapping set point=? where userId=?";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		
    		pstmt.setInt(1, point);
    		pstmt.setString(2, userId);
    		pstmt.executeUpdate();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    public java.sql.Date getRecent(String userId) {
        String SQL = "select recent from UserPointMapping where userid=?";
        java.sql.Date recent = null;
        try {
            pstmt = conn.prepareStatement(SQL); 
            pstmt.setString(1,  userId); 
            rs = pstmt.executeQuery();
            rs.next();
            recent = rs.getDate("recent");
            rs.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return recent;
    }

    public boolean isRecentToday(String userId) {
        // String SQL = "select recent from UserPointMapping where userid=?";
        // java.util.Date today = new java.util.Date();
        // java.sql.Date recent = null;
        // try {
        //     pstmt = conn.prepareStatement(SQL); 
        //     pstmt.setString(1,  userId); 
        //     rs = pstmt.executeQuery();
        //     if (rs.next()) {
        //     	recent = rs.getDate("recent");
        //     }
        //     rs.close();

        // } catch(Exception e) {
        //     e.printStackTrace();
        // }
        
        // Calendar cal1 = Calendar.getInstance();
        // cal1.setTime(today);
        
        // int year1 = cal1.get(Calendar.YEAR);
        // int month1 = cal1.get(Calendar.MONTH);
        // int date1 = cal1.get(Calendar.DATE);
        
        // cal1.setTime((java.util.Date)recent);
        // int year2 = cal1.get(Calendar.YEAR);
        // int month2 = cal1.get(Calendar.MONTH);
        // int date2 = cal1.get(Calendar.DATE);
        
        // boolean isToday = year1 == year2 && month1 == month2 && date1 == date2;
		// if (isToday) {
		// 	return true;
		// } else {
		// 	return false;
        // }
        return false;
    }
    
    public void setRecentToday(String userId) {
        String SQL = "update userpointmapping set recent=sysdate where userid=?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public boolean hasId(String userId) {
		boolean hasl = false; //리턴값을 주기위한 변수
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
            psmt = conn.prepareStatement("select id from UserPointMapping where userId=?"); //3/6
			psmt.setString(1, userId);
			
			rs = psmt.executeQuery(); // 4/6
			
			// 5/6
			if(rs.next()) {
				hasl = true;
			}
            
		} catch (SQLException e) {
			System.out.println("UserPointMappingDao.hasId 실패");
		} finally {
			// close(conn, psmt, rs);
		}
		return hasl;
	}
}
