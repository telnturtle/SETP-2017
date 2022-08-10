package bookctrl.util;

//상수 정의를 위한 클래스
public class BooksUtil {
   public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
   //맨뒤에 ORA92는 오라클 DB의 SID
   public static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
//   public static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
   //id와 pw
   public static final String USER = "scott";
   public static final String PASS = "tiger";
   
   public static final String GETALLBOOKS = "select * from books";
   public static final String GETBOOK = "select * from books where id=?";
   public static final String GET_BOOKS_TOP_VIEW_COUNT = "select * from ( select * from books order by view_cnt ) where ROWNUM <= ?";
   public static final String GET_BOOKS_AUTHOR = "select * from books where author=?";
   public static final String GET_BOOKS_GENRE = "select * from books where genre=?";
   
   public static final String HASBOOK = "select id from books where id=?";
   
//   public static final String INSERTBOOK = "insert into books values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
   public static final String INSERTBOOK = "insert into books values(books_id_inc.NEXTVAL, ?, ?, ?, ?, ?, ?, SYSDATE, ?, 0, 0, ?)";
//   public static final String UPDATEBOOK = "update books set name=?, author=?, publisher=?, genre=?, price=?, cover=?, upload_date=?"
//      + " where id=?";
   public static final String UPDATEBOOK = "update books set name=?, author=?, publisher=?, genre=?, price=?, cover=?, introduction=?, file_path=?"
      + " where id=?";
   
   public static final String DELETEBOOK = "delete from books where id=?";
   
   public static final String LIKEBYNAME = "select * from books where name like ?";
}