<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="top.jsp"%>


<div class="container">
	<div class="row">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			
			<tbody>

				<%
					BbsDAO bbsDAO = new BbsDAO();
				

					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);

					for (int i = 0; i < list.size(); i++) {
				%>

				<tr>
					
					<td><%=list.get(i).getBbsID()%></td>
					
					<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
							<%=list.get(i).getBbsTitle()%></a></td>

					<td><%=list.get(i).getUserID()%></td>

					<td><%=list.get(i).getBbsDate()%></td>

				</tr>

				<%
					}
				%>


			</tbody>
		</table>
		
		
		<!--  
		<%if (pageNumber != 1) {%>
		<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
			class="btn btn-success btn-arraw-left"> 이전</a>
		<%}
			if (bbsDAO.nextPage(pageNumber + 1)) {%>
		<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
			class="btn btn-success btn-arraw-left"> 다음</a>
		<%}%>
		-->
		<form class="navbar-form pull-right">
			<input type="text" class="span2" style="width: 150px;">
			<button type="submit" class="btn">검색</button>
		</form>

		<a href="write.jsp" class="btn btn-primary pull-right"> 글쓰기</a>

		<div class="pagination">
			<s_paging> <a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left" title="이전 페이지"> <span
				class="prev">
			<i class="fa fa-hand-o-left"></i> 이전
			</span>
			</a>
			 <span class="numbox"> <s_paging_rep> <% for(int i = 1 ; i<5 ; i++) {
			%><a href="bbs.jsp?pageNumber=<%=i%>" class="num"> <%= i %> </a>
			<%}%>
			 </s_paging_rep>
			</span> <a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left" title="다음 페이지"> <span
				class="next"> 다음 <i class="fa fa-hand-o-right"></i>
			</span>
			</a> 
			</s_paging>
		</div>






	</div>
</div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>



















