<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="top.jsp"%>
<link rel="stylesheet" href="css/sidebar.css">
<script>
	function htmlbodyHeightUpdate() {
		var height3 = $(window).height()
		var height1 = $('.nav').height() + 50
		height2 = $('.main').height()
		if (height2 > height3) {
			$('html').height(Math.max(height1, height3, height2) + 10);
			$('body').height(Math.max(height1, height3, height2) + 10);
		} else {
			$('html').height(Math.max(height1, height3, height2));
			$('body').height(Math.max(height1, height3, height2));
		}

	}
	$(document).ready(function() {
		htmlbodyHeightUpdate()
		$(window).resize(function() {
			htmlbodyHeightUpdate()
		});
		$(window).scroll(function() {
			height2 = $('.main').height()
			htmlbodyHeightUpdate()
		});
	});
</script>

</head>

<body>
	<nav class="navbar navbar-inverse sidebar" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">마이페이지</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li>회원정보관리</li>
					<li><a href="pwdCheck.jsp?from=update">개인정보수정</a></li>
					<li><a href="/jsp/mypageControl?action=list&userID=<%=userID%>">내 서재</a></li>
					<li><a href="#">내가 쓴 글</a></li>
					<li><a href="#">내가 쓴 댓글</a></li>
					<li><a href="pwdCheck.jsp?from=delete">회원탈퇴</a></li>
					<li class="nav-divider"></li>
					<li>거래 내역</li>
					<li><a href="#">거래 내역 조회</a></li>
					<li><a href="#">포인트 조회</a></li>
					<li class="nav-divider"></li>
					<li>고객센터</li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>

