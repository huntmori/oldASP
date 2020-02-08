<html> 
<head> 
<title>글 내용 보기</title> 
<link href="basic.css" rel="stylesheet" type="text/css"> 
</head> 
<body bgcolor="black" text="red" link="red" alink="red" vlink="red" background="back2.jpg">
 
<table cellspacing=0 cellpadding=2 border="0" width="800" align=> 
<tr> 
<td align="left" width="100"><b>내용보기</b></td> 
<td width="100" align="right">&nbsp;</td> 
<td align="right" width="300">&nbsp;[<a href="list.asp">전체리스트</a>] [<a href="javascript:history.go(-1)">돌아가기</a>]</td> 
</tr> 
</table> 
<!-- #include file="inc.asp" --> 
<% 
'내용을 볼 글번호를 전송받는다 
Sid= Request.QueryString("sid") 
 
'조회수를 1증가시킨다 
Set DB = Server.Createobject("ADODB.connection") 
DB.open Connstring 
SQL = "UPDATE NEWS " 
SQL = SQL & " SET VISIT=VISIT + 1 " 
SQL = SQL & " WHERE SID = " & Sid 
DB.Execute(SQL) 
 
'내용을 볼 레코드의 각 필드값을 가져온다 
SQL = "SELECT TOP 1 Subject,Content,Visit,Stime FROM NEWS " 
SQL = SQL & " WHERE SID =" & Sid 
Set RS = DB.Execute(SQL) 
 
'한꺼번에 모두 가져와서 변수에 대입 
Subject = server.htmlencode(rs("subject")) '태그없이 문자 처리 
Content = server.htmlencode(rs("content")) '태그없이 문자 처리 

Visit = rs("visit") 
STime = rs("stime") 
 
RS.CLose 
Set RS=nothing 
DB.CLose 
Set DB=nothing 
 
%> 
<br>
<table width="600" border=0 cellpadding="5" cellspacing=0 cellpading=2 style='word-break:break-all;'> 
<tr bgcolor="#CCCCCC"> 
<td height="1" colspan="2"></td> 
</tr> 
<tr bgcolor="#ededed"> 
<td colspan="2">제목 : <%=Subject%></td> 
</tr> 
<tr bgcolor="#ededed"> 
<td width="267">조회수 : <%=Visit%></td> 
<td width="250" align="right">작성시간 : <%=STime%></td> 
</tr> 
<tr bgcolor="#CCCCCC"> 
<td height="1" colspan="2"></td> 
</tr> 
</table> 
 
<br> 
<table width=540 border=0 cellpadding="5" cellspacing=1?bgcolor="#CCCCCC" cellpading=2 style='word-break:break-all;'> 
<tr> 
<td bgcolor="#FFFFFF"><%=Content%></td> 
</tr> 
</table> 

<br> 
<table width="540" cellpadding="2" cellspacing="0" border="0"> 
<tr align="center"> 
<td height="25" align="right"> 
[<a href="update.asp?sid=<%=sid%>">수정하기</a>] 
[<a href="delete.asp?sid=<%=sid%>">삭제하기</a>]</td> 
</tr> 
</table> 
</body> 
</html> 
 
