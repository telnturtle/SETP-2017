<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "user.book"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="myForm.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body>

	<div class="col-sm-9" style="height: auto; margin: auto;">
		<div id="container">
			<div id="content">
				<h1>안녕하세요 <%= userID %>님</h1>
			</div>
		</div>
	</div>

</body>
</html>