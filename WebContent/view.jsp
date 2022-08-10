<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="cmt.CommentDAO"%>
<%@ page import="cmt.Comment"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content="width = device-width" , install-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP SITE</title>
</head>
<script>
function all_forward() 
{ 
var f = document.frmgblist; 
var chk_count = 0; 
if (!confirm("댓글을 다시겠습니까?")) { 
return; 
} 
f.action='./?doc=buddy/forward.html'; 
f.submit(); 
} 
</script>


<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");

		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('성공적으로 등록되었습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		Comment cmt = new CommentDAO().getCmt(bbsID);
		CommentDAO commentDAO = new CommentDAO();
		int[] comment_num = new int[100];
		ArrayList<Comment> repletList = commentDAO.getRepleList(bbsID);
	%>
	<!-- 세션값을 userID에 String형태로 저장하는 과정 -->

	<nav class="navbar navbar-default">
		<!-- 하나의 웹사이트에 전반적인 구성을 보여줌(네비게이션)  -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				<!-- 아이콘 바가 사이트 크기를 줄였을때 나오는 하나의 작대기이다. 즉 3개 -->
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게이판 웹 사이트 </a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a>
				<li class="active"><a href="bbs.jsp">게시판</a>
			</ul>

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
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃 </a></li>

					</ul></li>
			</ul>
			<%
				}
			%>

		</div>
	</nav>

	<%
		if (bbs != null) {
	%>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="3" style="background- text-align: center;">게시판 글
							보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%=bbs.getBbsTitle()%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getUserID()%></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2">
							<% 
								if (bbs.getBbsDate() != null) {
							%> <%=bbs.getBbsDate().substring(0, 4)+"년" + bbs.getBbsDate().substring(4, 6)+"월"+bbs.getBbsDate().substring(6, 8)+"일"+ bbs.getBbsDate().substring(8, 10) + "시 "
							+ bbs.getBbsDate().substring(12, 14) + "분 "%>
							 <%
 	}
 %>

						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent()%>

						</td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary" style="float: right;">목록</a>
			<%
				if (userID != null && userID.equals(bbs.getUserID())) {
			%>
			<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')"
				href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div>
	</div>

	<%
		}
	%>

	<div class="comment">
		<div class="commentWrite well">
			<form method="post" action="commantAction.jsp">
				<p class="secretWrap">
				<div class="form-group">
					<label for="contactComment">Comment</label>
					<textarea name="comment_content" rows="3" class="form-control"></textarea>
					<input type=hidden name="bbsID" value=<%=bbsID%>>

				</div>

				<p>
					<input type="submit" class="btn btn-primary form-control"
						value="댓글달기">

				</p>
			</form>
		</div>
	</div>








	<h3>Comments</h3>
	<table class="table table-striped"
		style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">작성자</th>
				<th style="background-color: #eeeeee; text-align: center;">내용</th>
				<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				<th style="background-color: #eeeeee; text-align: center;">댓글달기</th>
				<th style="background-color: #eeeeee; text-align: center;">달기</th>
			</tr>
		</thead>

		<tbody>
			<%
				for (int i = 0; i < repletList.size(); i++) {
					comment_num[i] = repletList.get(i).getComment_num();
					int st = comment_num[i];
			%>

			<tr>
				<td align = "left"><%=repletList.get(i).getComment_id()%></td>
				<td><%=repletList.get(i).getComment_content()%></td>
				<td><%=repletList.get(i).getComment_date()%></td>
				<td><%=comment_num[i]%></td>
				<td>

					<input type="button" id="pInput" data-toggle="modal" data-target="#layerpop<%=st%>" value="댓글달기" onclick ="all_forward();">


					<form method="post" action="comment.jsp" >

						<div class="modal fade" id="layerpop<%=st%>">
							<div class="modal-dialog">
								<div class="modal-content">
									
									<div class="modal-header">
										<!-- 닫기(x) 버튼 -->

										<button type="button" class="close" data-dismiss="modal"
											>×</button>
										<!-- header title -->

										<h4 class="modal-title">
											<%=st%>댓글 작성</h4>
									</div>

									<textarea name="comment_content" rows="5" style="width: 485px"></textarea>

									<div class="modal-footer">
										<input type=hidden name="bbsID" value=<%=bbsID%>> 
										<input type=hidden name="comment_num" value=<%=comment_num[i]%>>
										<input type="submit" value="등록">
									</div>
								</div>
							</div>
						</div>
					</form>
					


				</td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>






	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>



















