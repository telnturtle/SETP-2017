<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="pro" class="user.User" scope="request"/>

<html>
<head>
<%@ include file="myForm.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content="width = device-width" , install-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP SITE</title>
</head>
<body>
	<br>
	<div class="container">
		
		<div class="col-lg-8">
			<div class="jumbotron" style="padding-top: 20px;">
				<form name=form2 action=/jsp/mypageControl method=post class="form-horizontal">
					<h3 style="text-align: center;">회원정보 수정</h3>
					<br>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="userID" value = <%=pro.getUserID() %> readonly>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="userPassword" maxlength="20" value=<%=pro.getUserPassword() %>>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">이름</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" value=<%= pro.getUserName() %>
								name="userName" maxlength="20">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">성별</label>
						<div class="col-sm-10">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off" value="male" checked>남자
								</label> 
								<label class="btn btn-primary"> 
								<input type="radio" name="userGender" autocomplete="off" value="female " checked>여자
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">나이</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" value = <%= pro.getUserAge() %>
								name="userAge" maxlength="20">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">관심분야</label>
						<div class="col-sm-10">
							<input type="checkbox" name="userGenre" value="소설">소설 <input
								type="checkbox" name="userGenre" value="시/에세이">시/에세이 <input
								type="checkbox" name="userGenre" value="경제/경영">경제/경영 <input
								type="checkbox" name="userGenre" value="자기계발">자기계발 <input
								type="checkbox" name="userGenre" value="인문">인문<br>
							<input type="checkbox" name="userGenre" value="역사/문화">역사/문화
							<input type="checkbox" name="userGenre" value="사회">사회 <input
								type="checkbox" name="userGenre" value="과학/공학">과학/공학 <input
								type="checkbox" name="userGenre" value="예술/대중문화">예술/대중문화
							<input type="checkbox" name="userGenre" value="종교">종교
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">E-mail</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" value=<%= pro.getUserEmail() %>
								name="userEmail" maxlength="20">
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="hidden" name="action" value="update">
							<input type="submit" class="btn btn-primary" value="수정">
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="col-lg-2"></div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>



















