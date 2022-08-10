package bookctrl.dto;

import java.io.Serializable;
import java.util.Date;
import java.text.SimpleDateFormat;
   
//DTO : DB의 한 Row를 클래스화 시킨다. 
//여러개일 경우 이 클래스의 객체를 하나씩 벡터에 집어 넣는다.
public class BookDto implements Serializable {//순서를 위한 시리얼라이져블 인터페이스
   
   private int id; //DB에서 사용된 칸디날리티
   private String name;
   private String author;
   private String publisher;
   private String genre;
   private int price;
   private String cover;
   private java.sql.Date upload_date;
   private String introduction;
   private int file_size;
   private int view_count;
   private String file_path;
   
   public BookDto() {   
   } 

   public BookDto(int id, String name, String author, String publisher, String genre, int price, String cover, java.sql.Date upload_date, String introduction, int file_size, int view_count, String file_path) { //DTO를 만든다.
      super();
      this.id = id;
      this.name = name;
      this.author = author;
      this.publisher = publisher;
      this.genre = genre;
      this.price = price;
      this.cover = cover;
      this.upload_date = upload_date;
      this.introduction = introduction;
      this.file_size = file_size;
      this.view_count = view_count;
      this.file_path = file_path;
   }
   
   //getter / setter+
   
   public String getAuthor() {
      return author;
   }

   public void setAuthor(String author) {
      this.author = author;
   }

   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }
   
   public String getPublisher() {
      return publisher;
   }
   
   public void setPublisher(String publisher) {
      this.publisher = publisher;
   }
   
   public String getGenre() {
      return genre;
   }
   
   public void setGenre(String genre) {
      this.genre = genre;
   }
   
   public int getPrice() {
      return price;
   }
   
   public void setPrice(int price) {
      this.price = price;
   }
   
   public String getCover() {
      return cover;
   }
   
   public void setCover(String cover) {
      this.cover = cover;
   }
   
   public java.util.Date getUploadDate() {
      return upload_date;
   }
   
   public void setUploadDate(java.sql.Date upload_date) {
      this.upload_date = upload_date;
   }
   
   public String getIntroduction() {
      return introduction;
   }
   
   public void setIntroduction(String introduction) {
      this.introduction = introduction;
   }
   
   public int getFileSize() {
      return file_size;
   }
   
   public void setFileSize(int file_size) {
      this.file_size = file_size;
   }
   
   public int getViewCount() {
      return view_count;
   }
   
   public void setViewCount(int view_count) {
      this.view_count = view_count;
   }

   public String getFilePath() {
      return file_path;
   }

   public void setFilePath(String file_path) {
      this.file_path = file_path;
   }
   
   public String toString() {
      
      try {
   //      SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");        
            SimpleDateFormat df = new SimpleDateFormat("MM-dd-yyyy");
   //       Using DateFormat format method we can create a string 
   //       representation of a date with the defined format.
            String reportDate = df.format(this.upload_date);
            return "[" + Integer.toString(this.id) + "/" + this.name + "/" + this.author + "/" + this.publisher + "/" + this.genre + "/" + this.price + "/" + this.cover + "/" + reportDate + "]";
   //      return "[" + Integer.toString(this.id) + "/" + this.name + "/" + this.author + "/" + this.publisher + "/" + this.genre + "/" + this.price + "/" + this.cover + "]";
      } catch (Exception e) {
         e.printStackTrace();
         return "[" + Integer.toString(this.id) + "/" + this.name + "/" + this.author + "/" + this.publisher + "/" + this.genre + "/" + this.price + "/" + this.cover + "]";
      }
      
//      return "[" + Integer.toString(this.id) + "/" + this.name + "/" + this.author + "/" + this.publisher + "/" + this.genre + "/" + this.price + "/" + this.cover + "]";
   }
}