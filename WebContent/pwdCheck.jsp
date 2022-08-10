<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="user.book"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="myForm.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body>
   <form name=form1 action=/jsp/mypageControl method=post>
   <div class = "col-lg-1"></div>
      <div class="col-lg-8">
         <h3 style="text-align: center;">비밀번호 재확인</h3>
         <h4 style="text-align: center;">개인정보 보호를 위해 회원님의 비밀번호를 다시 한번
            확인합니다.</h4>
         <br> <br>
         <div class="col-lg-2"></div>
         <div class="col-lg-8">
         <div class="well">
            <center>
               <table style="width: 90%;height: 60px; margin-left: auto; margin-right: auto; text-align: center">
                  <tr>
                     <td>아이디</td>
                     <td><input type="hidden" name="userID" value=<%= userID %>><%=userID%></td>
                  </tr>
                  <tr>
                     <td>비밀번호</td>
                     <td><input type="password" name="userPassword" width=auto size=20></td>
                  </tr>
               </table>
               <br> 
               <input type="hidden" name="action" value="pwdCheck">
               <input type="hidden" name="from" value=<%=request.getParameter("from")%>>
               <input type="submit" value="확인">
            </center>

         </div>
      </div>
      </div>
   </form>
</body>
</html>