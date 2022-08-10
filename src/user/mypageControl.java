package user;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.io.PrintWriter;

/**
 * Servlet implementation class mybookControl
 */
@WebServlet("/mypageControl")
public class mypageControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDAO dao = new UserDAO();
		String address = null;
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String action = request.getParameter("action");
		if(action == null || action.equals("list")){
			ArrayList<book> list = dao.getAllBuyList(request.getParameter("userID"));
			request.setAttribute("bookList", list);
			address = "mybook.jsp";
		}
		else if(action.equals("pwdCheck")){
			String userID= request.getParameter("userID");
			String userPassword = request.getParameter("userPassword");
			boolean check = dao.pwdCheck(userID, userPassword);
			
			if(check) {
				String from = request.getParameter("from");
				if(from.equals("update")){
					User pro = dao.getPro(request.getParameter("userID"));
					request.setAttribute("pro", pro);
					address = "updatePro.jsp";
				}
				else if(from.equals("delete")){
					HttpSession session = request.getSession();
					dao.deleteUser(userID);
					session.invalidate();
					out.println("<script language='javascript'>");
					out.println("alert('탈퇴됐습니다.');");
					out.println("location.href='test.jsp'");
					out.println("</script>");
					out.close();
					
				}
				}
			else{
				out.println("<script language='javascript'>");
				out.println("alert('비밀번호가 맞지 않습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
		}
		else if(action.equals("update")){
			User pro = new User();
			pro.setUserID(request.getParameter("userID"));
			pro.setUserPassword(request.getParameter("userPassword"));
			pro.setUserName(request.getParameter("userName"));
			pro.setUserGender(request.getParameter("userGender"));
			pro.setUserAge(Integer.parseInt(request.getParameter("userAge")));
			pro.setUserGenre(request.getParameterValues("userGenre"));
			pro.setUserEmail(request.getParameter("userEmail"));
			dao.updataePro(pro);
			request.setAttribute("pro",pro);
			address = "updatePro.jsp";
		}
		if(address!=null){
			RequestDispatcher dispatcher = request.getRequestDispatcher(address);
			dispatcher.forward(request, response);
		}
	}

}
