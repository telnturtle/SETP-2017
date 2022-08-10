<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.book"%>
<jsp:useBean id="bookList" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="myForm.jsp"%>
<link rel="stylesheet" href="css/sidebar.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div class="col-sm-9" style="height: auto; margin: auto;">
		<div id="container">
			<div id="content">
				<h1><%=userID%>님의 서재</h1>
				<br><br>
				<ul class="nav">
					<%
						for (int i = 0; i < bookList.size(); i++) {
							book b = (book) bookList.get(i);
					%>
					<li><a href="#"><%=b.getBookName()%></a></li>
					<%
						}
					%>
				</ul>

			</div>
		</div>
	</div>

</body>
</html>