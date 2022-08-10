package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement; // ��ŷ ����
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO
{
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public UserDAO() {
		
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

	   public int login(String userID, String userPassword)
	   {
	      String SQL = "SELECT userPassword FROM userInfo WHERE userID = ?";
	      
	      try {
	         pstmt = conn.prepareStatement(SQL); 
	         pstmt.setString(1, userID); // userid�� ?�� �� �� �ֵ��� �����ִ� ��.
	         rs = pstmt.executeQuery();
	         if(rs.next())
	         {
	            if(rs.getString(1).equals(userPassword)) {
	               return 1; // �α��� ����
	            }
	            else
	               return 0; //��й�ȣ ����ġ
	         }
	         return -1; //���̵� ����
	         
	      }catch(Exception e)
	      {
	         e.printStackTrace();
	      }   
	      return -2; //������ ���̽� ����
	   }
	   
	   public int join(User user) {
	      String SQL = "INSERT INTO userInfo VALUES(?,?,?,?,?,?,?)";
	      
	      try
	      {
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, user.getUserID());
	         pstmt.setString(2, user.getUserPassword());
	         pstmt.setString(3, user.getUserName());
	         pstmt.setString(4, user.getUserGender());
	         pstmt.setInt(5, user.getUserAge());
	         
	            String[] genre = user.getUserGenre();
	            String userGenre = null;
	            if(genre==null)
	            {
	            	return -2;
	            }
	            for(int i=0;i<genre.length;i++){
	                if(genre[i] != null){
	                   if(userGenre == null)
	                      userGenre = genre[i];
	                   else
	                      userGenre = userGenre + "," + genre[i];
	                }
	            }
	         
	         pstmt.setString(6, userGenre);
	         pstmt.setString(7, user.getUserEmail());
	         return pstmt.executeUpdate();
	      }catch(Exception e)
	      {
	         e.printStackTrace();
	      }
	      return -1;
	   }
	   
	   public boolean pwdCheck(String userID, String userPassword){
	      String sql = "SELECT userPassword FROM userINFO WHERE userID = ?";
	      boolean result=false;
	      try{
	         pstmt = conn.prepareStatement(sql); 
	         pstmt.setString(1, userID); // userid�� ?�� �� �� �ֵ��� �����ִ� ��.
	         rs = pstmt.executeQuery();
	         
	         rs.next();
	         String pwd = rs.getString("userPassword");
	         if(userPassword.equals(pwd)) result = true;
	         else result = false;
	      }catch(Exception e){
	      }
	      return result;
	   }
	   
	   public User getPro(String userID){
	      String sql = "SELECT userId, userPassword, userName, userGender, userAge, userGenre, userEmail FROM userInfo where userID = ?";
	      User pro = new User();
	      try{
	         pstmt = conn.prepareStatement(sql); 
	         pstmt.setString(1, userID); 
	         rs = pstmt.executeQuery();
	         rs.next();
	         
	         pro.setUserID(rs.getString("userID"));
	         pro.setUserPassword(rs.getString("userPassword"));
	         pro.setUserName(rs.getString("userName"));
	         pro.setUserGender(rs.getString("userGender"));
	         pro.setUserAge(rs.getInt("userAge"));
	         
	         String genre = rs.getString("userGenre");
	         String[] userGenre = genre.split(","); 
	         pro.setUserGenre(userGenre);
	         
	         pro.setUserEmail(rs.getString("userEmail"));
	         rs.close();
	      }catch(Exception e){
	      }
	      return pro;
	   }
	   
	   public void updataePro(User user) {
	      String SQL = "UPDATE userInfo SET userPassword=?,userName=?,userGender=?,userAge=?,userGenre=?,userEmail=? WHERE userID=?";
	      
	      try
	      {
	         pstmt = conn.prepareStatement(SQL);
	         
	         pstmt.setString(1, user.getUserPassword());
	         pstmt.setString(2, user.getUserName());
	         pstmt.setString(3, user.getUserGender());
	         pstmt.setInt(4, user.getUserAge());
	         
	         String[] genre = user.getUserGenre();
	            String userGenre = null;
	            for(int i=0;i<genre.length;i++){
	                if(genre[i] != null){
	                   if(userGenre == null)
	                      userGenre = genre[i];
	                   else
	                      userGenre = userGenre + "," + genre[i];
	                }
	            }
	         
	         pstmt.setString(5, userGenre);
	         pstmt.setString(6, user.getUserEmail());
	         pstmt.setString(7, user.getUserID());
	         pstmt.executeUpdate();
	      }catch(Exception e)
	      {
	         e.printStackTrace();
	      }
	   }
	   
	   public void deleteUser(String userID){
	      String sql = "DELETE FROM userInfo WHERE userID = ?";
	      try{
	         pstmt = conn.prepareStatement(sql); 
	         pstmt.setString(1, userID); 
	         pstmt.executeUpdate();
	      }catch(Exception e){
	      }
	   }
	   
	   public ArrayList<book> getAllBuyList(String userID){
	      String sql = "SELECT bookID, bookName FROM book WHERE bookID IN (SELECT bookID FROM userInfo, buyBook WHERE userInfo.userID = buyBook.userID AND userInfo.userID = ?)";
	      
	      ArrayList<book> list = new ArrayList<book>();
	      
	      try{
	         pstmt = conn.prepareStatement(sql); 
	         pstmt.setString(1, userID); // userid�� ?�� �� �� �ֵ��� �����ִ� ��.
	         rs = pstmt.executeQuery();
	         
	         
	         while(rs.next()){
	            book book = new book();
	            book.setBookID(rs.getString("bookID"));
	            book.setBookName(rs.getString("bookName"));
	            list.add(book);
	         }
	         rs.close();         
	      }catch(Exception e){
	      }
	      return list;
	   }
	   

	   
	}