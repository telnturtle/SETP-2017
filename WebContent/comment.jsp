<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cmt.CommentDAO"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>

<% request.setCharacterEncoding("UTF-8"); %>
<!-- 건노오는 데이터를 UTF로 받는다. -->
<jsp:useBean id="cmt" class="cmt.Comment" scope="page" />
<jsp:setProperty name="cmt" property="comment_content" />
<jsp:setProperty name="cmt" property="comment_num" />
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsID" />
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
		if(cmt.getComment_content()==null)
				{
					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else
					
				{
					CommentDAO cmtDAO = new CommentDAO();
					BbsDAO bbsDAO = new BbsDAO();
					
				
					boolean result = cmtDAO.reple(
							(int)cmtDAO.getNext(),
							bbs.getBbsID(),
							userID,
							cmt.getComment_num(),
							cmt.getComment_content(),
							cmt.getComment_depth(),
							cmt.getComment_seq()
							);
					if (result ==false)
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
						script.println("location.href='view.jsp'");
						script.println("</script>");
					}
				}
		
		
	}
	
	
		
		
		
	%>

</body>
</html>

