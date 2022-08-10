<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<jsp:include page="top.jsp" flush="true"/>
<jsp:include page="left.jsp" flush="true"/>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹소설</title>
</head>
<body>

   <div class="col-sm-14"
      style="height: 50px; width: 700px; margin: 25px 300px 25px;">
      <div id="container">
         <div id="detail_menu">

               <div class="col-sm-4 col-md-3">
                  <div class="thumbnail" style="border:white">
                     <a href="#"><h5>로맨틱</h5></a>
                  </div>
               </div>
               <div class="col-sm-4 col-md-3">
                  <div class="thumbnail"style="border:white">
                     <a href="#"><h5>일상물</h5></a>
                  </div>
               </div>
               <div class="col-sm-4 col-md-3">
                  <div class="thumbnail"style="border:white">
                     <a href="#"><h5>코미디</h5></a>
                  </div>
               </div>

         </div>
      </div>
      
   </div>
   <%@ include file="product_list.jsp" %>
</body>
</html>
   <%@ include file= "bottom.jsp" %>   