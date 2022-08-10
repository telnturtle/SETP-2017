<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import  = "user.UserDAO" %>
<%@ page import  = "UserPointMapping.*" %>
<%@ page import  = "java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건노오는 데이터를 UTF로 받는다. -->
<jsp:useBean id = "user" class = "user.User" scope = "page"/>
<jsp:setProperty name = "user" property = "userID"/>
<jsp:setProperty name = "user" property = "userPassword"/><!-- 넘오오는 아이디와 패스워드를 받는다. -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP SITE</title>
</head>
<body>
   <%
      String userID = null;
      //session으로부터 userID 값을 받아왔는 그 값이 null이 아니라면 미리 userID에 그 값을 넣어준다.
      if(session.getAttribute("userID")!=null)
      {
         userID = (String) session.getAttribute("userID");
      }
      
      //userID가 null이 아니라면 이미 로그인된 상태이기 때문에 main page로 넘어간다.
      if(userID!= null)
      {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('이미 로그인 되어있습니다.')");
         script.println("location.href='main.jsp'");
         script.println("</script>");
      }
   
      UserDAO userDAO = new UserDAO();
      UserPointMappingDao pointDao = new UserPointMappingDao();
      int result = userDAO.login(user.getUserID(), user.getUserPassword());
      if (result ==1)
      {
         // 
         // 일일출석 과정
         // 
         String _user_id = user.getUserID();
         if (pointDao.hasId(_user_id)) {
            if (pointDao.isRecentToday(_user_id)) {
               // 아무것도안함
            } else {
               pointDao.setPoint(pointDao.getPoint(_user_id)+10, _user_id);
               // script.println("<script>");
               // script.println("alert('10포인트가 적립되었습니다.')");
               // script.println("</script>");
            }
            pointDao.setRecentToday(_user_id);
         } else {
            int res_join_to_point = pointDao.join(_user_id);
            if (res_join_to_point == 1) {
                pointDao.setPoint(pointDao.getPoint(_user_id)+10, _user_id);
            } else if (res_join_to_point == -2) {
                System.out.println("**********\n로그인 과정, 포인트 DB에 없는 유저를 추가하는 과정, 오류 발생, \nuserID == NULL\n**********");
            } else {
                System.out.println("**********\n로그인 과정, 포인트 DB에 없는 유저를 추가하는 과정, 오류 발생");
                System.out.println("return code = "+Integer.toString(res_join_to_point)+"\n**********");
            }
         }
         
         // 
         // 원래 있던 코드
         // 
         session.setAttribute("userID",user.getUserID());
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("location.href = 'main.jsp'");
         script.println("</script>");
      }
      else if (result ==0)
      {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('비밀번호가 틀립니다.')");
         script.println("history.back()");
         script.println("</script>");
      }
      else if (result ==-1)
      {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('존재하지 않는 아이디입니다.')");
         script.println("history.back()");
         script.println("</script>");
      }
      else if (result ==0)
      {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('데이터베이스 오류가 발생했습니다.')");
         script.println("history.back()");
         script.println("</script>");
      }
   
   %>
   
</body>
</html>


















