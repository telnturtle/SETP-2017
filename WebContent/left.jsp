<!--
	파일 이름 : left.jsp 	
	제작 날짜 : 2017-11-18(완)
	기능 : Main화면의 사이드바 구성 
	부가설명 : 각 분야 별 링크 연결
	부득이하게 사이드바의 script, css가 따로 파일구성을 할 시에 적용되지 않아 한 파일에 다 넣은 점을 양해 부탁드립니다.
	일반도서, 웹소설, 웹툰을 큰 틀로 구성
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.net.URLEncoder"%>
<jsp:useBean id= "genre" class = "listctrl.Bookgenre" scope = "request"/>	
<html>
<head>
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
<style>
body, html {
	height: 100%;
}

/* remove outer padding */
.main .row {
	padding: 0px;
	margin: 0px;
}


nav.sidebar.navbar {
	
	/*칸칸마다 생기는 컬러*/
	color: #e7e7e7;
	/*테두리 없애기*/
	border-top:1px #e7e7e7 solid;
	border-left:1px #e7e7e7 solid;
	border-right:1px #e7e7e7 solid;
	border-bottom:1px #e7e7e7 solid;
}

nav.sidebar, .main {
	-webkit-transition: margin 200ms ease-out;
	-moz-transition: margin 200ms ease-out;
	-o-transition: margin 200ms ease-out;
	transition: margin 200ms ease-out;
}

/* Add gap to nav and right windows.*/
.main {
	padding: 10px 10px 0 10px;
	
}

/* .....NavBar: Icon only with coloring/layout.....*/

/*small/medium side display*/
@media ( min-width : 768px) {
	/*Allow main to be next to Nav*/
	
	.main {
		position: absolute;
		width: calc(100% - 40px); /*keeps 100% minus nav size*/
		margin-left: 40px;
		float: right;
		
	}

	/*lets nav bar to be showed on mouseover*/
	nav.sidebar:hover+.main {
		margin-left: 200px;
	}

	/*Center Brand*/
	nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand
	{
		margin-left: 0px;
		/*분야별보기 (title) 색 */
		background-color: #f8f8f8;/*---------------------------*/
	}
	/*Center Brand*/
	nav.sidebar .navbar-brand, nav.sidebar .navbar-header {
		text-align: center;
		width: 100%;
		margin-left: 0px;
		/* 사이드바 헤더 컬러*/
	}
	
	nav.sidebar .navbar-brand:hover{
		color: #777c80;
	} /*사이드바 헤드 hover 될 때 컬러 변경 */

	/*Center Icons*/
	nav.sidebar a {
		padding-right: 13px;
		
	}

	/*adds border top to first nav box */
	nav.sidebar .navbar-nav>li:first-child {
		border-top: 1px solid;
		background-color: #f8f8f8;/*첫번째 리스트 색깔 --------------------*/
	}

	/*adds border to bottom nav boxes*/
	nav.sidebar .navbar-nav>li {
		border-bottom: 1px solid;
		background-color: #f8f8f8; /*리스트 색깔-----------------------*/
		
	}

	/* Colors/style dropdown box*/
	nav.sidebar .navbar-nav .open .dropdown-menu {
		position: static;
		float: none;
		width: auto;
		margin-top: 0;
		background-color: #ffffff; /*드롭다운 배경화면 안쪽*/
		border: 0;
		-webkit-box-shadow: none;
		box-shadow: none;
	}

	/*allows nav box to use 100% width*/
	nav.sidebar .navbar-collapse, nav.sidebar .container-fluid {
		padding: 0 0px 0 0px;
	}

	/*colors dropdown box text */
	.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
		color: #777c80; /*dropdown 글자 색*/
	}

	/*gives sidebar width/height*/
	nav.sidebar {
		width: 200px;
		height: 100%;
		margin-left: -160px;
		float: left;
		z-index: 8000;
		margin-bottom: 0px;
	}

	/*give sidebar 100% width;*/
	nav.sidebar li {
		width: 100%;
	}
	
	nav.sidebar li.dropdown.open>a.dropdown-toggle{
		background-color:#e7e7e7;
	}/*##############눌렀을 시 배경화면 변경############*/

	nav.sidebar li.dropdown.open>a.dropdown-toggle>a:focus{
		color: blue;
		
	}/*###################일단 필요 글자색 변경에###########################*/
	
	nav.sidebar li.dropdown.open>a.dropdown-toggle, nav.sidebar li.dropdown.open>a.dropdown-toggle:focus{

		color:#777c80;
	}/*#######################눌러진 상태일 시, 글자가 파랗게 변경 */
	
	nav.sidebar li.dropdown>a.dropdown-toggle:hover{
			color: #777c80;
	}/*#######눌렀을 때 글자 색 변경 ##############*/
	
	nav.sidebar li.dropdown>a.dropdown-toggle:focus{
			color: #777c80;
	}/*###########이미 한번 눌려서 focus됐을 때 #######*/
	
	navbar navbar-inverse sidebar{
		solid:red;
	}/*테두리 없애기?*/
	
	
	/* Move nav to full on mouse over*/
	nav.sidebar:hover {
		margin-left: 0px;
		
	}
	/*for hiden things when navbar hidden*/
	.forAnimate {
		opacity: 0;

	}
}

/* .....NavBar: Fully showing nav bar..... */
@media ( min-width : 1330px) {
	/*Allow main to be next to Nav*/
	
	.main {
		width: calc(100% - 200px); /*keeps 100% minus nav size*/
		margin-left: 200px;
	}

	/*Show all nav*/
	nav.sidebar {
		margin-left: 0px;
		float: left;	
	}
	/*Show hidden items on nav*/
	nav.sidebar .forAnimate {
		opacity: 1;
		
	}
}

nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus
{
	color: #2f3133; /* 누를때의 텍스트 색 */
	background-color: #e7e7e7; /*누를 떄의 배경색*/
}

nav:hover .forAnimate {
	opacity: 1;
}

section {
	padding-left: 15px;
}

</style>

</head>

<body>
	<nav class="navbar navbar-inverse sidebar" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-sidebar-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">분야별 보기</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-sidebar-navbar-collapse-1">
				<ul class="nav navbar-nav">
					
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">일반도서 <span class="caret"></span><span
							style="font-size: 16px;"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
						<%
						String [] default_genre;//메뉴를 들어갔을 때 가장 default하게 나오는 장르: 시/에세이: 창작시
						default_genre = genre.getGenre();
						System.out.println("left첫번째 장르 : "+ default_genre[0]);
						%>
							<li><a href="generalbook_poemessay.jsp?getgenre=<%=URLEncoder.encode(default_genre[0],"UTF-8")%>">시/에세이</a></li>
							<li><a href="#">자기계발</a></li>
							<li><a href="#">전문분야</a></li>
							<li><a href="#">유아/어린이</a></li>
							<li><a href="#">청소년문학</a></li>
						</ul>
					</li>
					
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">웹소설 <span class="caret"></span><span
							style="font-size: 16px;"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
							<li><a href="#">로맨틱/일상/코미디</a></li>
							<li><a href="#">무협/역사/시대극</a></li>
							<li><a href="#">SF/판타지</a></li>
							<li><a href="#">공포/스릴러/미스터리/추리</a></li>
							
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">웹툰 <span class="caret"></span><span
							style="font-size: 16px;"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
							<li><a href="#">에피소드</a></li>
							<li><a href="#">옴니버스</a></li>
							<li><a href="#">스토리</a></li>
							<li><a href="#">일상</a></li>
							<li><a href="#">개그</a></li>
							<li><a href="#">판타지/시대극</a></li>
							<li><a href="#">액션/스포츠</a></li>
							<li><a href="#">드라마</a></li>
							<li><a href="#">순정/감성</a></li>
							<li><a href="#">스릴러</a></li>
						</ul>
					</li>
				
				</ul>
			</div>
		</div>
	</nav>
	
</body>
</html>

