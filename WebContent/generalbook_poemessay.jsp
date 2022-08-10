<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="bookctrl.dto.BookDto" import="bookctrl.dao.BookDao" import="java.util.Vector" import = "java.net.URLEncoder"%>

<jsp:useBean id= "genre" class = "listctrl.Bookgenre" scope = "request"/>	
<jsp:useBean id="bookctrl" class="bookctrl.dto.BookDto" scope="application" />
<jsp:useBean id="bookdao" class="bookctrl.dao.BookDao" scope="application" />
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<jsp:include page="top.jsp" flush="true"/>
<jsp:include page="left.jsp" flush="true"/>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시/에세이</title>
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

	<%
		String[] genrelist;
		genrelist = genre.getGenre();//genrelist 배열 안에 시, 에세이 장르 (창작시,어린이시,성공에세이,삶의지혜에세이)

		String GENRE = request.getParameter("getgenre");
	
	%>
	<div class="col-sm-14"
		style="height: 50px; width: 700px; margin: 25px 300px 25px;">
		<div id="container">
			<div id="detail_menu">

					<div class="col-sm-4 col-md-3">
						<div class="thumbnail" style="border:white">
							<a href="generalbook_poemessay.jsp?getgenre=<%=URLEncoder.encode(genrelist[0],"UTF-8")%>"><h5>창작시</h5></a>
						</div>
					</div>
					<div class="col-sm-4 col-md-3">
						<div class="thumbnail"style="border:white">
							<a href="generalbook_poemessay.jsp?getgenre=<%=URLEncoder.encode(genrelist[1],"UTF-8")%>"><h5>어린이시</h5></a>
						</div>
					</div>
					<div class="col-sm-4 col-md-3">
						<div class="thumbnail"style="border:white">
							<a href="generalbook_poemessay.jsp?getgenre=<%=URLEncoder.encode(genrelist[2],"UTF-8")%>"><h5>성공에세이</h5></a>
						</div>
					</div>
					<div class="col-sm-4 col-md-3">
						<div class="thumbnail"style="border:white">
							<a href="generalbook_poemessay.jsp?getgenre=<%=URLEncoder.encode(genrelist[3],"UTF-8")%>"><h5>삶의 지혜 에세이</h5></a>
						</div>
					</div>
			</div>
		</div>
		
	</div>
	<%
	BookDao bdao = new BookDao();
	BookDto btao = new BookDto();
	System.out.println("GENRE2:"+GENRE);
	Vector booklist = bdao.getBooksByGenre(GENRE);//GENRE를 이용, 장르에 맞는 북 리스트 받아오기
	System.out.println(booklist.size()); //GENRE에 맞는 책 개수 표현

	%>
	<div class="col-sm-9" style="height: auto; margin: auto;">
		<div id="container">
			<div id="content">
				<%for(int i=0 ;i<booklist.size();i++) {%>
				<div id="catlist">
					<dl>
						<dt>
							<img src="<%=((BookDto)booklist.get(i)).getCover() %>"
								alt="Product image" width="93" height="128" /><strong>가격: <%=((BookDto)booklist.get(i)).getPrice() %>pt</strong><a
								href="#"><%=((BookDto)booklist.get(i)).getName() %></a>
						</dt>
						<dd>
							<p>
							<p>
							
								<%=((BookDto)booklist.get(i)).getAuthor() %> 저 | <%=((BookDto)booklist.get(i)).getUploadDate() %> | <%=((BookDto)booklist.get(i)).getGenre() %><p>
								회원 조회수 : <%=((BookDto)booklist.get(i)).getViewCount() %><p>
								

							</p>
						</dd>
					</dl>
				</div>
				<%} %>

			</div>
		</div>
	</div>

<!-- 1,2,3,4,5번호 	
<div class="container-fluid">
		
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
 -->
</body>
</html>
	<%@ include file= "bottom.jsp" %>	