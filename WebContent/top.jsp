<!--
	파일 이름 : top.jsp 	
	제작 날짜 : 2017-11-6(완)
	기능 : 전체 화면의 탑(네비게이션바) 구성 
	부가설명 : 베스트셀러, 작가광장, 리뷰마당, 마이페이지로 구성
	베스트셀러 : 베스트셀러 소개 사이트
	작가광장 : 아마추어 작가들의 글 편집 사이트로 이동
	리뷰마당 : 사용자들의 리뷰 게시판
	마이페이지 : 사용자들의 기본 정보 수정 사이트로 이동
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content="width = device-width" , install-scale="1">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

</head>
<body>
	<%
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");

      }
      int pageNumber = 1;
      if (request.getParameter("pageNumber") != null) {
         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
      }
   %>
	<div class="container">
		<div class="row">
			<div class="col-sm-14">
				<hgroup>
					<h1>
						<img src="images/logo.PNG" alt="HELLO" class="img-rounded"
							style="width: 60px; height: 60px; overflow: hidden"> 온누리
						전자책 서비스 <small><form class="navbar-form pull-right">
								<input type="text" class="span2" style="width: 150px;">
								<button type="submit" class="btn">검색</button></small>
						</form>
					</h1>
				</hgroup>
			</div>

			<div class="col-sm-12">
				<nav class="navbar navbar-default">
					<!-- 하나의 웹사이트에 전반적인 구성을 보여줌(네비게이션)  -->
					<div class="navbar-header">
					</div>

					<ul class="nav navbar-nav">
						<li class="active"><a href="main.jsp">온누리</a></li>
						<li><a href="#">베스트셀러</a></li>
						<li><a href="bbs2.jsp">작가광장</a></li>
						<li><a href="bbs.jsp">리뷰마당</a></li>
						<li><a href="mypage.jsp">마이페이지</a></li>
					</ul>

					<!-- 로그인 되어 있는 상태인지 여부 확인 후, 그에 맞는 상황 -->
					<%
                  if (userID == null) {
              		 %>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="login.jsp">로그인</a></li>
								<li><a href="join.jsp">회원가입</a></li>
							</ul></li>
					</ul>

					<%
                     }

                     else {
                	  %>
                	  
					<ul class="nav navbar-nav navbar-right">
                  <li class="dropdown"><a href="#" class="dropdown-toggle"
                     data-toggle="dropdown" role="button" aria-haspopup="true"
                     aria-expanded="false"><%= userID %>님<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="logoutAction.jsp">로그아웃</a></li>
                     </ul></li>
               </ul>
					<%
                     }
                  %>

				</nav>
			</div>
		</div>