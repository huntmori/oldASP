<html> 
<head> 
<title>�� ���� ����</title> 
<link href="basic.css" rel="stylesheet" type="text/css"> 
</head> 
<body bgcolor="black" text="red" link="red" alink="red" vlink="red" background="back2.jpg">
 
<table cellspacing=0 cellpadding=2 border="0" width="800" align=> 
<tr> 
<td align="left" width="100"><b>���뺸��</b></td> 
<td width="100" align="right">&nbsp;</td> 
<td align="right" width="300">&nbsp;[<a href="list.asp">��ü����Ʈ</a>] [<a href="javascript:history.go(-1)">���ư���</a>]</td> 
</tr> 
</table> 
<!-- #include file="inc.asp" --> 
<% 
'������ �� �۹�ȣ�� ���۹޴´� 
Sid= Request.QueryString("sid") 
 
'��ȸ���� 1������Ų�� 
Set DB = Server.Createobject("ADODB.connection") 
DB.open Connstring 
SQL = "UPDATE NEWS " 
SQL = SQL & " SET VISIT=VISIT + 1 " 
SQL = SQL & " WHERE SID = " & Sid 
DB.Execute(SQL) 
 
'������ �� ���ڵ��� �� �ʵ尪�� �����´� 
SQL = "SELECT TOP 1 Subject,Content,Visit,Stime FROM NEWS " 
SQL = SQL & " WHERE SID =" & Sid 
Set RS = DB.Execute(SQL) 
 
'�Ѳ����� ��� �����ͼ� ������ ���� 
Subject = server.htmlencode(rs("subject")) '�±׾��� ���� ó�� 
Content = server.htmlencode(rs("content")) '�±׾��� ���� ó�� 

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
<td colspan="2">���� : <%=Subject%></td> 
</tr> 
<tr bgcolor="#ededed"> 
<td width="267">��ȸ�� : <%=Visit%></td> 
<td width="250" align="right">�ۼ��ð� : <%=STime%></td> 
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
[<a href="update.asp?sid=<%=sid%>">�����ϱ�</a>] 
[<a href="delete.asp?sid=<%=sid%>">�����ϱ�</a>]</td> 
</tr> 
</table> 
</body> 
</html> 
 
