package bookctrl.util;

import java.util.Vector;

import bookctrl.dto.BookDto;

//단순히 받아온 벡터나 DTO를 출력해주기 위한 클래스.
public class ShowBook {
	public static void show(Vector v) {
		Vector _v = new Vector();
		_v = v;
		BookDto dto = new BookDto();
		for (int i=0; i<_v.size(); i++) {
			try {
//				BookDto dto = (BookDto)_v.get(i);
				dto = (BookDto)_v.get(i);
				System.out.println(dto == null);
				System.out.println(dto.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
			//show(dto);
		}
	} //show
	
	public static void show(BookDto dto) {
		System.out.println(dto);
	}
}
