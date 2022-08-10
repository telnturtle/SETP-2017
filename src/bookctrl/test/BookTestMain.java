package bookctrl.test;

import bookctrl.dao.BookDao;
import bookctrl.dto.BookDto;
import bookctrl.util.ShowBook;

import java.util.Vector;
import java.util.*;
import java.text.*;

public class BookTestMain {
	
	public static void main(String[] args) {
		BookDao dao = new BookDao();
//		Vector v = new Vector();
//		BookDto dto = new BookDto();
		try {
//			v = dao.getAllBook();
//			System.out.println("size");
//			System.out.println(v.size());
//			
//			System.out.println(null == v.get(0));
//			if (v.size() > 0) {
//				dto = (BookDto)v.get(0); 				
//				System.out.println(dto == null);
//				try {
//					System.out.println(dto.toString()); // 여기서 에러 남
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
			
			
			
			//dao.insertBook(666, "Computer Networking", "Kurose Ross", "PEARSON", "전공책", 20, ""); //인서트
			//dao.updateBook("s004", "아무개", "부산시"); //업데이트
			//dao.deleteBook("66"); //딜리트

			System.out.println("\n//모든 책 출력");
			ShowBook.show(dao.getAllBook()); //모든 책 출력
			
			System.out.println("\n//한 <- 글자 들어간 책 출력");
			ShowBook.show(dao.getAllBookByName("한")); //글자 들어간 책 출력
			ShowBook.show(dao.getBook(666)); //해당 책 출력
			System.out.println("\nShowBook.show(dao.getBooksByTopViewCount(3));");
//			v = dao.getBooksByTopViewCount(3);
//			ShowBook.show(v);
			ShowBook.show(dao.getBooksByTopViewCount(3));
			ShowBook.show(dao.getBooksByGenre("/"));
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
