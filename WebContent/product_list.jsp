<!--
   파일 이름 : product_list.jsp    
   제작 날짜 : 
   기능 : 일반 책 구매 사이트에서 책 정보를 불러와 표로 표현
   부가설명 : Beans 참고
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:useBean id="bookctrl" class="bookctrl.dto.BookDto" scope="application" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
/* box model hacks not catered for in the demo */
/* global reset for demo purposes only - use a proper reset in a real page*/
* {
   margin: 0;
   padding: 0
}

p {
   margin: 0 0 .5em 0
}

h1 {
   margin: 1em 0;
   text-align: center
}

#catlist {
   border: 1px dashed #ccc;
   border-bottom: none;
   width: 660px;
   margin: 10px auto;
}

#catlist dl {
   width: 640px;
   margin: 0 auto;
   border-bottom: 1px dashed #ccc;
   padding: 10px;
   overflow: hidden;
   background: #f2f2f2;
}

#catlist dd {
   overflow: auto
}

#catlist dt strong {
   float: right;
   padding: 0 0 0 20px;
}

#catlist dt img {
   float: left;
   margin: 0 10px 0 0;
   border: 1px solid #000;
}

* html dd {
   height: 1%
} /* 3px jog*/
</style>
</head>

<body>

   <div class="col-sm-9" style="height: auto; margin: auto;">
      <div id="container">
         <div id="content">

            <div id="catlist">
               <dl>
                  <dt>
                     <img src="http://placehold.it/300x200" alt="Product image"
                        width="93" height="62" /><strong>[금액]</strong><a
                        href="#"><%=bookctrl.getName()%>[도서이름]</a>
                  </dt>
                  <dd>
                     <p>[저자]|[업로드 날짜][장르]
                     
                     </p>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <img src="http://placehold.it/300x200" alt="Product image"
                        width="93" height="62" /><strong>[금액]</strong><a
                        href="#"><%=bookctrl.getName()%>[도서이름]</a>
                  </dt>
                  <dd>
                     <p>[저자]|[업로드 날짜][장르]
                     
                     </p>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <img src="http://placehold.it/300x200" alt="Product image"
                        width="93" height="62" /><strong>[금액]</strong><a
                        href="#"><%=bookctrl.getName()%>[도서이름]</a>
                  </dt>
                  <dd>
                     <p>[저자]|[업로드 날짜][장르]
                     
                     </p>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <img src="http://placehold.it/300x200" alt="Product image"
                        width="93" height="62" /><strong>[금액]</strong><a
                        href="#"><%=bookctrl.getName()%>[도서이름]</a>
                  </dt>
                  <dd>
                     <p>[저자]|[업로드 날짜][장르]
                     
                     </p>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <img src="http://placehold.it/300x200" alt="Product image"
                        width="93" height="62" /><strong>[금액]</strong><a
                        href="#"><%=bookctrl.getName()%>[도서이름]</a>
                  </dt>
                  <dd>
                     <p>[저자]|[업로드 날짜][장르]
                     
                     </p>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <img src="http://placehold.it/300x200" alt="Product image"
                        width="93" height="62" /><strong>[금액]</strong><a
                        href="#"><%=bookctrl.getName()%>[도서이름]</a>
                  </dt>
                  <dd>
                     <p>[저자]|[업로드 날짜][장르]
                     
                     </p>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <img src="http://placehold.it/300x200" alt="Product image"
                        width="93" height="62" /><strong>[금액]</strong><a
                        href="#"><%=bookctrl.getName()%>[도서이름]</a>
                  </dt>
                  <dd>
                     <p>[저자]|[업로드 날짜][장르]
                     
                     </p>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <img src="http://placehold.it/300x200" alt="Product image"
                        width="93" height="62" /><strong>[금액]</strong><a
                        href="#"><%=bookctrl.getName()%>[도서이름]</a>
                  </dt>
                  <dd>
                     <p>[저자]|[업로드 날짜][장르]
                     
                     </p>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <img src="http://placehold.it/300x200" alt="Product image"
                        width="93" height="62" /><strong>[금액]</strong><a
                        href="#"><%=bookctrl.getName()%>[도서이름]</a>
                  </dt>
                  <dd>
                     <p>[저자]|[업로드 날짜][장르]
                     
                     </p>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <img src="http://placehold.it/300x200" alt="Product image"
                        width="93" height="62" /><strong>[금액]</strong><a
                        href="#"><%=bookctrl.getName()%>[도서이름]</a>
                  </dt>
                  <dd>
                     <p>[저자]|[업로드 날짜][장르]
                     
                     </p>
                  </dd>
               </dl>
                           
            </div>


         </div>
      </div>
   

   </div>
   
   <div class="container">
         <div class="row">
            <center>
               <nav aria-label="Page navigation">
               <ul class="pagination">
                  <li><a href="#" aria-label="Previous"> <span
                        aria-hidden="true">«</span>
                  </a></li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li><a href="#" aria-label="Next"> <span
                        aria-hidden="true">»</span>
                  </a></li>
               </ul>
               </nav>
            </center>
         </div>
      </div>
</body>
</html>