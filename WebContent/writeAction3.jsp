<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import  = "bbs.BbsDAO" %>
<%@ page import  = "java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건노오는 데이터를 UTF로 받는다. -->
<jsp:useBean id = "bbs" class = "bbs.Bbs" scope = "page"/>
<jsp:setProperty name = "bbs" property = "bbsTitle"/>
<jsp:setProperty name = "bbs" property = "bbsContent"/><!-- 넘오오는 아이디와 패스워드를 받는다. -->


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP SITE</title>
</head>
<body>
	<%
	
	String userID = null;
	if(session.getAttribute("userID")!=null)
	{
		userID = (String) session.getAttribute("userID");
	}
	
	if(userID == null)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	else{
		if(bbs.getBbsTitle()==null||bbs.getBbsContent()==null)
				{
					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else
				{
					BbsDAO bbsDAO = new BbsDAO();
					int result = bbsDAO.write(bbs.getBbsTitle(),userID, bbs.getBbsContent(),2);
					if (result ==-1)
					{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else
					{	
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='bbs.jsp'");
						script.println("</script>");
					}
				}
		
		
	}
	
	
		
		
		
	%>
	
</body>
</html>



















