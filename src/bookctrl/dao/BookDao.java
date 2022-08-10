package bookctrl.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Date;
import java.sql.*; // java.sql.Date
import java.util.Date;
//import java.util.Vector;
import java.util.*;
import java.text.*;

import bookctrl.dto.BookDto;
import bookctrl.exc.IdDuplicatedException;
import bookctrl.exc.IdNotFoundException;
import bookctrl.util.BooksUtil;
import bookctrl.util.ShowBook;

public class BookDao extends AbstractBook {
   
   public BookDao() { 
      super(); //객체가 생성될 때 부모를 불러와 드라이버를 로딩하도록 한다.
   } //Constructor
   
   public Vector getAllBook() throws SQLException {
      Vector v = new Vector(2,2); //받아온 데이터를 저장할 벡터
      
      Connection conn = null; //연결부
      PreparedStatement psmt = null; //쿼리부, ?에 값을 주기 위해 PrepareStatement사용
      ResultSet rs = null; //리시버
      
      try {
         // 2/6
         conn = this.getConnection(); //이 클래스에 getConnection이 없으므로 부모에서 호출 
//         System.out.println("2/6 성공 -- getAllBook");
         
         // 3/6
         psmt = conn.prepareStatement(BooksUtil.GETALLBOOKS);
         System.out.println("3/6 성공 -- getAllBook");
         
         // 4/6
         rs = psmt.executeQuery(); //쿼리실행해서 rs에 값을 받아온다. 
         System.out.println("4/6 성공 -- getAllBook");
         
         //5/6 
         while(rs.next()) { //받아온 값에서 다음값이 없을때까지 실행
            int i=1; //컬럼을 넘기기 위한 변수
            int id = rs.getInt(i++); //rs의 값을 받아 저장
            String name = rs.getString(i++);
            String author = rs.getString(i++);
            String publisher = rs.getString(i++);
            String genre = rs.getString(i++);
            int price = rs.getInt(i++);
            String cover = rs.getString(i++);
//            System.out.print("Dao getallbook Debuging... ");
//            java.util.Date upload_date = new java.util.Date(rs.getDate(i++).getTime());
//            java.util.Date upload_date = rs.getDate(i++);
            java.sql.Date upload_date = rs.getDate(i++);
//            System.out.println("2");
//            System.out.println(upload_date==null);
            String introduction = rs.getString(i++);
            int file_size = rs.getInt(i++);
            int view_count = rs.getInt(i++);
            String file_path = rs.getString(i++);
            v.add(new BookDto(id, name, author, publisher, genre, price, cover, upload_date, introduction, file_size, view_count, file_path)); //저장한 값을 벡터에 저장한다.
         }
         System.out.println("5/6 성공 -- getAllBook");
//         System.out.println("v.size()");
//         System.out.println(v.size());
      } catch (SQLException e) {   
         System.out.println("실패 -- getAllBook" + e);
         //throw new SQLException("getAllBook 실패 " + e);
      } finally { //close가 반드시 실행되도록
         this.close(conn, psmt, rs); //부모의 close호출
      }
//      System.out.println("왜안대");
//      ShowBook.show(v);
//      try {
//         return v;         
//      } catch (Exception e) {
//         System.out.println("Debug: catch");
//         e.printStackTrace();
//      }
//      System.out.println("iiii");
//      return new Vector();
      return v;
   } //getAllBook
   
   public Vector getAllBookByName(String names) throws SQLException {
      
      Vector v = new Vector(2,2);
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      try {
         conn = this.getConnection(); // 2/6
         System.out.println("2/6 성공 -- getAllBookByName");
         
         psmt = conn.prepareStatement(BooksUtil.LIKEBYNAME); // 3/6
         psmt.setString(1,"%" + names + "%"); //첫번째 ?에 두번째 아규먼트로 대체한다.
         System.out.println("3/6 성공 -- getAllBookByName");
         
         rs = psmt.executeQuery(); // 4/6
         System.out.println("4/6 성공 -- getAllBookByName");
         
         while(rs.next()) { // 5/6
            int i=1;
            int id = rs.getInt(i++);
            String name = rs.getString(i++);
            String author = rs.getString(i++);
            String publisher = rs.getString(i++);
            String genre = rs.getString(i++);
            int price = rs.getInt(i++);
            String cover = rs.getString(i++);
//            java.util.Date upload_date = new java.util.Date(rs.getDate(i++).getTime());
            java.sql.Date upload_date = rs.getDate(i++);
            String introduction = rs.getString(i++);
            int file_size = rs.getInt(i++);
            int view_count = rs.getInt(i++);
            String file_path = rs.getString(i++);
            v.add(new BookDto(id, name, author, publisher, genre, price, cover, upload_date, introduction, file_size, view_count, file_path)); //저장한 값을 벡터에 저장한다.
         }
         System.out.println("5/6 성공 -- getAllBookByName");
         
      } catch (SQLException e) {   
         System.out.println("실패 -- getAllBookByName" + e);
         throw new SQLException("getAllBookByName 실패 " + e);
      } finally {
         this.close(conn, psmt, rs);
      }
      return v;
   } //getAllBookByName
   
   public BookDto getBook(int ids) throws SQLException {//1로우이므로 DTO로 반환
      BookDto dto = new BookDto();
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      try {
         conn = this.getConnection(); // 2/6
         System.out.println("2/6 성공 -- getBook");
         
         psmt = conn.prepareStatement(BooksUtil.GETBOOK); // 3/6
         psmt.setInt(1, ids);
         System.out.println("3/6 성공 -- getBook");
         
         rs = psmt.executeQuery(); // 4/6
         System.out.println("4/6 성공 -- getBook");
         
         while(rs.next()) { // 5/6
            int i=1;
            int _id = rs.getInt(i++);
            String _name = rs.getString(i++);
            String _author = rs.getString(i++);
            String _publisher = rs.getString(i++);
            String _genre = rs.getString(i++);   
            int _price = rs.getInt(i++);
            String _cover = rs.getString(i++);
            java.sql.Date _upload_date = rs.getDate(i++);
            String _introduction = rs.getString(i++);
            int _file_size = rs.getInt(i++);
            int _view_count = rs.getInt(i++);
            String _file_path = rs.getString(i++);            
            dto = new BookDto(_id, _name, _author, _publisher, _genre, _price, _cover, _upload_date, _introduction, _file_size, _view_count, _file_path);
         }
         System.out.println("5/6 성공 -- getBook");
         
      } catch (SQLException e) {   
         System.out.println("실패 -- getBook" + e);
         throw new SQLException("getBook 실패 " + e);
      } finally {
         this.close(conn, psmt, rs);
      }
      return dto;
   } //getBook
   
   public Vector getBooksByTopViewCount(int topN) throws SQLException {
      Vector v = new Vector(2,2);
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      try {
         conn = this.getConnection(); // 2/6
         System.out.println("2/6 성공 -- getBooksByTopViewCount");
         
         psmt = conn.prepareStatement(BooksUtil.GET_BOOKS_TOP_VIEW_COUNT); // 3/6
         psmt.setString(1, Integer.toString(topN)); //첫번째 ?에 두번째 아규먼트로 대체한다.
         System.out.println("3/6 성공 -- getBooksByTopViewCount");
         
         rs = psmt.executeQuery(); // 4/6
         System.out.println("4/6 성공 -- getBooksByTopViewCount");
         
         while(rs.next()) { // 5/6
            int i=1;
            int id = rs.getInt(i++);
            String name = rs.getString(i++);
            String author = rs.getString(i++);
            String publisher = rs.getString(i++);
            String genre = rs.getString(i++);
            int price = rs.getInt(i++);
            String cover = rs.getString(i++);
            java.sql.Date upload_date = rs.getDate(i++);
            String introduction = rs.getString(i++);
            int file_size = rs.getInt(i++);
            int view_count = rs.getInt(i++);
            String file_path = rs.getString(i++);
            v.add(new BookDto(id, name, author, publisher, genre, price, cover, upload_date, introduction, file_size, view_count, file_path));
         }
         System.out.println("5/6 성공 -- getBooksByTopViewCount");
         
      } catch (SQLException e) {   
         System.out.println("실패 -- getBooksByTopViewCount" + e);
         throw new SQLException("getBooksByTopViewCount 실패 " + e);
      } finally {
         this.close(conn, psmt, rs);
      }
      return v;
   }
   
   public Vector getBooksByAuthor(String author) throws SQLException {
      Vector v = new Vector(2,2);
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      try {
         conn = this.getConnection(); // 2/6
         System.out.println("2/6 성공 -- getBooksByAuthor");
         
         psmt = conn.prepareStatement(BooksUtil.GET_BOOKS_AUTHOR); // 3/6
         psmt.setString(1, author);
         System.out.println("3/6 성공 -- getBooksByAuthor");
         
         rs = psmt.executeQuery(); // 4/6
         System.out.println("4/6 성공 -- getBooksByAuthor");
         
         while(rs.next()) { // 5/6
            int i=1;
            int _id = rs.getInt(i++);
            String _name = rs.getString(i++);
            String _author = rs.getString(i++);
            String _publisher = rs.getString(i++);
            String _genre = rs.getString(i++);
            int _price = rs.getInt(i++);
            String _cover = rs.getString(i++);
            java.sql.Date _upload_date = rs.getDate(i++);
            String _introduction = rs.getString(i++);
            int _file_size = rs.getInt(i++);
            int _view_count = rs.getInt(i++);
            String _file_path = rs.getString(i++);
            v.add(new BookDto(_id, _name, _author, _publisher, _genre, _price, _cover, _upload_date, _introduction, _file_size, _view_count, _file_path));
         }
         System.out.println("5/6 성공 -- getBooksByAuthor");
         
      } catch (SQLException e) {   
         System.out.println("실패 -- getBooksByAuthor" + e);
         throw new SQLException("getBooksByAuthor 실패 " + e);
      } finally {
         this.close(conn, psmt, rs);
      }
      return v;
   }
   
   public Vector getBooksByGenre(String genre) throws SQLException {
      Vector v = new Vector(2,2);
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      try {
         conn = this.getConnection(); // 2/6
         System.out.println("2/6 성공 -- getBooksByGenre");
         
         psmt = conn.prepareStatement(BooksUtil.GET_BOOKS_GENRE); // 3/6
         psmt.setString(1, genre);
         System.out.println("3/6 성공 -- getBooksByGenre");
         
         rs = psmt.executeQuery(); // 4/6
         System.out.println("4/6 성공 -- getBooksByGenre");
         
         while(rs.next()) { // 5/6
            int i=1;
            int _id = rs.getInt(i++);
            String _name = rs.getString(i++);
            String _author = rs.getString(i++);
            String _publisher = rs.getString(i++);
            String _genre = rs.getString(i++);
            int _price = rs.getInt(i++);
            String _cover = rs.getString(i++);
            java.sql.Date _upload_date = rs.getDate(i++);
            String _introduction = rs.getString(i++);
            int _file_size = rs.getInt(i++);
            int _view_count = rs.getInt(i++);
            String _file_path = rs.getString(i++);
            v.add(new BookDto(_id, _name, _author, _publisher, _genre, _price, _cover, _upload_date, _introduction, _file_size, _view_count, _file_path));
         }
         System.out.println("5/6 성공 -- getBooksByGenre");
         
      } catch (SQLException e) {   
         System.out.println("실패 -- getBooksByGenre" + e);
         throw new SQLException("getBooksByGenre 실패 " + e);
      } finally {
       /*  this.close(conn, psmt, rs);*/
      }
      return v;
   }
   
   //insert, delete, update에서 현재 있는 id인지를 확인하기 위한 메서드
   public boolean hasId(int id) { 
      boolean hasl = false; //리턴값을 주기위한 변수
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      try {
         conn = this.getConnection();// 2/6
         
         psmt = conn.prepareStatement(BooksUtil.HASBOOK); //3/6
         psmt.setInt(1, id );
         
         rs = psmt.executeQuery(); // 4/6
         
         // 5/6
         if(rs.next()) {
            hasl = true;
         }
         
      } catch (SQLException e) {
         System.out.println("hasId 실패");
      } finally {
         this.close(conn, psmt, rs);
      }
      return hasl;
   }
   
//   public boolean insertBook(int id, String name, String author, String publisher, String genre, int price, String cover, String upload_date) throws IdDuplicatedException, SQLException {
   public boolean insertBook(String name, String author, String publisher, String genre, int price, String cover, String introduction, int file_size, int view_count, String file_path) throws IdDuplicatedException, SQLException {
      
//      if(this.hasId(id)) { 
//         throw new IdDuplicatedException(id + "가 이미 존재합니다."); //사용자 정의 익셉션
//      }
      
      boolean ins = false;
      Connection conn = null;
      PreparedStatement psmt = null;
      
      int count = 0; //쿼리실행이 잘 되었나를 확인하기 위한 변수
      
      try {
         conn = this.getConnection();// 2/6
         
         psmt = conn.prepareStatement(BooksUtil.INSERTBOOK); // 3/6
//         psmt.setInt(1, id);
         psmt.setString(1, name.trim());
         psmt.setString(2, author.trim());
         psmt.setString(3, publisher.trim());
         psmt.setString(4, genre.trim());
         psmt.setInt(5, price);
         psmt.setString(6, cover.trim());
//         psmt.setDate(8, new java.sql.Date(upload_date));
         psmt.setString(7, introduction);
         psmt.setString(8, file_path.trim());
         
         count = psmt.executeUpdate();
         if (count>0) { //쿼리가 잘 실행되었으면
            ins = true; //반환값을 true로...
         }
         
      } catch (SQLException e) {
         System.out.println("실패했습니다. -- insertBook" + e);
         throw new SQLException();
      } finally {
         this.close(conn, psmt, null);
      }
      
      return ins;
   }
   
//   public boolean updateBook(int id, String name, String author, String publisher, String genre, int price, String cover, String upload_date) throws IdNotFoundException, SQLException {
   public boolean updateBook(String name, String author, String publisher, String genre, int price, String cover, String introduction, String file_path) throws IdNotFoundException, SQLException {   
      
//      if(!this.hasId(id)) {
//         throw new IdNotFoundException(id + "가 없습니다.");
//      }
      
      boolean ins = false;
      Connection conn = null;
      PreparedStatement psmt = null;
      
      int count = 0;
      
      try {
         conn = this.getConnection();// 2/6
         
         psmt = conn.prepareStatement(BooksUtil.UPDATEBOOK); // 3/6
//         psmt.setInt(1, id);
         psmt.setString(1, name.trim());
         psmt.setString(2, author.trim());
         psmt.setString(3, publisher.trim());
         psmt.setString(4, genre.trim());
         psmt.setInt(5, price);
         psmt.setString(6, cover.trim());
//         psmt.setString(8, upload_date.trim());
         psmt.setString(7, introduction.trim());
         psmt.setString(8, file_path.trim());
         
         count = psmt.executeUpdate();
         if (count>0) {
            ins = true;
         }
         
      } catch (SQLException e) {
         System.out.println("실패했습니다. -- updateBook" + e);
         throw new SQLException();
      } finally {
         this.close(conn, psmt, null);
      }
      
      return ins;
   }
   
   public boolean deleteBook(int id) throws IdNotFoundException, SQLException {
      
      if(!this.hasId(id)) {
         throw new IdNotFoundException(id + "가 없습니다.");
      }
      
      boolean ins = false;
      Connection conn = null;
      PreparedStatement psmt = null;
      
      int count = 0;
      
      try {
         conn = this.getConnection();// 2/6
         
         psmt = conn.prepareStatement(BooksUtil.DELETEBOOK); // 3/6
         psmt.setInt(1, id);
         
         count = psmt.executeUpdate();
         if (count>0) {
            ins = true;
         }
         
      } catch (SQLException e) {
         System.out.println("실패했습니다. -- deleteBook" + e);
         throw new SQLException();
      } finally {
         this.close(conn, psmt, null);
      }
      
      return ins;
   }
}