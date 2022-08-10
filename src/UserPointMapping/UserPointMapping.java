package UserPointMapping;

public class UserPointMapping {
    
    private String userID;
    private int point;
    private java.sql.Date recent;
    
    public java.sql.Date getRecent() {
		return recent;
	}
	public void setRecent(java.sql.Date recent) {
		this.recent = recent;
	}
    public String getUserID() {
        return userID;
    }
    public void setUserID(String userID) {
    	this.userID = userID;
    }
    public int getPoint() {
        return point;
    }
    public void setPoint(int point) {
        this.point = point;
    }
}
