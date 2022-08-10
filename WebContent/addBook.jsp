<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import  = "java.io.PrintWriter" %> 
<%@ page import  = "bbs.BbsDAO" %> 
<%@ page import  = "bbs.Bbs" %> 
<%@ page import  = "java.util.ArrayList" %> 
<%@ include file="top.jsp" %>
	
	
	<div class = "container">
		<div class = "row">
			<table class = "table table-striped" style = "text-align : center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">번호</th>
						<th style="background-color:#eeeeee; text-align:center;">제목</th>
						<th style="background-color:#eeeeee; text-align:center;">작성자</th>
						<th style="background-color:#eeeeee; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<tbody>

    					<%


    					BbsDAO bbsDAO = new BbsDAO();

						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);

							for(int i =0; i<list.size(); i++){

    					%>

    				<tr>

    					<td> <%= list.get(i).getBbsID() %> </td>

    					<td> <a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"> <%= list.get(i).getBbsTitle() %></a></td>

    					<td> <%= list.get(i).getUserID() %> </td>

    					<td> <%= list.get(i).getBbsDate() %></td>

    				</tr>

    					<%

							}

    					%>

				
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
					<a href = "bbs.jsp?pageNumber=<%=pageNumber -1 %>" class  = "btn btn-success btn-arraw-left"> 이전</a>
			<% 
				} if(bbsDAO.nextPage(pageNumber+1)){
			%>
					<a href = "bbs.jsp?pageNumber=<%=pageNumber +1 %>" class  = "btn btn-success btn-arraw-left"> 다음</a>
			<% 
				}
			%>

			<a href = "write2.jsp" class = "btn btn-primary pull-right"> 도서 등록하기</a>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>




