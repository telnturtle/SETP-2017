package UserPointMapping;

import UserPointMapping.*;

public class PointTest {
	public static void main(String[] args) {
		UserPointMappingDao dao = new UserPointMappingDao();
//		dao.join("666");
//		System.out.println(dao.getPoint("1"));
		System.out.println(dao.isRecentToday("1"));
	}
}
