<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="top.jsp"%>


<div class="container">
	<div class="row">
		<form method="post" action="writeAction3.jsp">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">게시판
							글쓰기 양식</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control"
							placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>


<tr>
<td>
					<div class="form-group">
						<label class="col-md-4 control-label" for="radios">Inline
							Radios</label>
						<div class="col-md-4">
							<label class="radio-inline" for="radios-0"> <input
								name="radios" id="radios-0" type="radio" checked="checked"
								value="1"> 1
							</label> <label class="radio-inline" for="radios-1"> <input
								name="radios" id="radios-1" type="radio" value="2"> 2
							</label> <label class="radio-inline" for="radios-2"> <input
								name="radios" id="radios-2" type="radio" value="3"> 3
							</label> <label class="radio-inline" for="radios-3"> <input
								name="radios" id="radios-3" type="radio" value="4"> 4
							</label>
						</div>
					</div>
					</td>
	</tr>

					<tr>
						<td><textarea class="form-control" placeholder="글 내용"
								name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>


					<tr>
					<td>
						<div class="form-group">
							<label class="col-md-4 control-label" for="filebutton">File
								Button</label>
							<div class="col-md-4">
								<input name="filebutton" class="input-file" id="filebutton"
									type="file">
							</div>
						</div>
						</td>
					</tr>


				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
	</div>
</div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>



<div class="container">
	<div class="row">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>

					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
		
				</tr>
			</thead>

			<tbody>

				<%
					BbsDAO bbsDAO = new BbsDAO();

					ArrayList<Bbs> list = bbsDAO.getList(pageNumber, 2);

					for (int i = 0; i < list.size(); i++) {
				%>

				<tr>

	

					<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
							<%=list.get(i).getBbsTitle()%></a></td>

					<td><%=list.get(i).getUserID()%></td>

	

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

		<a href="write3.jsp" class="btn btn-primary pull-right"> 글쓰기</a>

		<div class="pagination">
			<s_paging> <a
				href="bbs2.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left" title="이전 페이지"> <span
				class="prev"> <i class="fa fa-hand-o-left"></i> 이전
			</span>
			</a> <span class="numbox"> <s_paging_rep> <%
 	for (int i = 1; i < 5; i++) {
 %><a href="bbs2.jsp?pageNumber=<%=i%>" class="num"> <%=i%>
				</a> <%
 	}
 %> </s_paging_rep>
			</span> <a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left" title="다음 페이지"> <span
				class="next"> 다음 <i class="fa fa-hand-o-right"></i>
			</span>
			</a> </s_paging>
		</div>






	</div>
</div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>



















