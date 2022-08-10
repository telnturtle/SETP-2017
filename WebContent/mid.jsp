<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<div class="col-sm-8" style="height: auto; margin: auto;">
   <div id="container">
      <div id="content">
         <center>
            <h1><img src=images/bookIcon.png style="width: 50px; height: 50px;">&nbsp;오늘의 신간</h1>
         </center>
         <div class="container" style="width:700px;">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
               <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1"></li>
                  <li data-target="#myCarousel" data-slide-to="2"></li>
               </ol>
               <div class="carousel-inner">
                  <div class="item active">
                     <img src=images/4.JPG style="width: auto; height: 300px;">
                  </div>
                  <div class="item">
                     <img src=images/5.JPG style="width: auto; height: 300px;">
                  </div>
                  <div class="item">
                     <img src=images/6.JPG style="width: auto; height: 300px;">
                  </div>
               </div>
               <a class="left carousel-control " href="#myCarousel"
                  data-slide="prev"> <span
                  class="glyphicon glyphicon-chevron-left"></span>
               </a> <a class="right carousel-control " href="#myCarousel"
                  data-slide="next"> <span
                  class="glyphicon glyphicon-chevron-right"></span>
               </a>
            </div>
         </div>
         <hr size="3" width="700">
         <h3>
            &nbsp;&nbsp;추천 마법사
            <form class="navbar-form pull-right">
               <button type="submit" class="btn">로그인 하기</button>
               <button type="submit" class="btn">전체보기+</button>
            </form>
         </h3>

         <p style="line-height: 0.01%">
            <br>
         </p>
         <center>
            <div class="col-sm-4 col-md-3">
               <div class="thumbnail">
                  <img src=images/book1.jpg style="height: 200px;">
                  <h4>book1</h4>
               </div>
            </div>
            <div class="col-sm-4 col-md-3">
               <div class="thumbnail">
                  <img src=images/book2.jpg style="height: 200px;">
                  <h4>book2</h4>
               </div>
            </div>
            <div class="col-sm-4 col-md-3">
               <div class="thumbnail">
                  <img src=images/book3.jpg style="height: 200px;">
                  <h4>book3</h4>
               </div>
            </div>
            <div class="col-sm-4 col-md-3">
               <div class="thumbnail">
                  <img src=images/book4.jpg style="height: 200px;">
                  <h4>book1</h4>
               </div>
            </div>
         </center>

         <hr size="3" width="700">
         <h3>
            &nbsp;&nbsp;베스트셀러
            <form class="navbar-form pull-right">
               <button type="submit" class="btn">전체보기+</button>
            </form>
         </h3>
         <p style="line-height: 0.01%">
            <br>
         </p>
         <center>
            <div class="col-sm-4 col-md-3">
               <div class="thumbnail">
                  <img src=images/book1.jpg style="height: 200px;">
                  <h4>book1</h4>
               </div>
            </div>
            <div class="col-sm-4 col-md-3">
               <div class="thumbnail">
                  <img src=images/book2.jpg style="height: 200px;">
                  <h4>book2</h4>
               </div>
            </div>
            <div class="col-sm-4 col-md-3">
               <div class="thumbnail">
                  <img src=images/book3.jpg style="height: 200px;">
                  <h4>book3</h4>
               </div>
            </div>
            <div class="col-sm-4 col-md-3">
               <div class="thumbnail">
                  <img src=images/book4.jpg style="height: 200px;">
                  <h4>book1</h4>
               </div>
            </div>
         </center>
      </div>
   </div>
</div>