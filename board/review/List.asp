<html> 
<head> 
<title></title> 
<link href="basic.css" rel="stylesheet" type="text/css"> 
</head> 
<body bgcolor="black" text="white" link="white" alink="white" vlink="white" background="back2.jpg">
<!-- #include file="inc.asp" --> 
<% 
'���������� ���۹޴´� 
IPage = Request.QueryString("Page") '������ ������ �ʿ��� ��� ���Ͽ��� ���۵� �� 
If (IPage = "") Then 
 IPage = "1" 
End If 
 IPage = CInt(IPage) '������ �ٲ۴�(������ String������ ���ϱ� ����) 
 
'�˻��� �ʵ�� �ܾ ���۹޴´� 
Field = replace(Request("Field"),"'","''") 
Str = replace(Request("Str"),"'","''") 
 
Set RS = SERVER.CreateObject("ADODB.Recordset") 
RS.CursorType = 3  'adOpenStatic
SQL = "SELECT Sid,Subject,Visit,Stime FROM NEWS " 
 
'�˻��̳� �ƴϳĿ� ���� 
if Str<>"" then 
SQL = SQL & " WHERE " & Field 
SQL = SQL & " LIKE '%" & Str & "%'" 
end if 
 
SQL = SQL & " ORDER BY sid DESC" 
 
RS.Open SQL, ConnString 
 
IF (RS.BOF and RS.EOF) Then 
 TotRecord = 0 
 TotPage = 0 
Else 
 TotRecord = RS.RecordCount 
 Rs.pagesize=5 '���������� 5���� �����ش� 
 TotPage = RS.PageCount 
End if 
%> 
 
<table cellspacing=0 cellpadding=2 border=0 width="540" bgcolor="#000000"> 
<tr> 
 <td width="185" align="left"><b><%if Str<>"" then%>�˻����<%else%>��Ϻ���<%end if %></b></td> 
 <td width="173" align="center" class="f8">Total : <%=TotRecord%> &nbsp;<%=IPage%>/<%=TotPage%> Pages</td> 
 <td width="170" align="right"><a href="list.asp">��ü����Ʈ</a>&nbsp;<a href="write.asp">���۾���</a></td> 
</tr> 
</table> 
 
 
<table width="540" cellpadding="2" cellspacing=0 style='word-break:break-all;'> 
<tr> 
 <td colspan=4 height=1 bgcolor="#000000"></td> 
</tr> 
<tr bgcolor="#000000"> 
<td width="40" align="center">�� ȣ</td> 
<td width="320" align="center">�� ��</td> 
<td width="40" align="center">�� ȸ</td> 
<td width="80" align="center">�����</td> 
</tr> 
<tr> 
<td colspan=4 height=1 bgcolor="#000000"></td> 
</tr> 
 
<% 
IF (RS.BOF and RS.EOF) Then 
Response.Write "<tr> <td colspan=4 align=center>" 
Response.Write "�Խù��� �����ϴ�." 
Response.Write "</td></tr>" 
Else 
RS.AbsolutePage = IPage '�ش� �������� ù��° ���ڵ�� �̵��Ѵ� 
RCount = RS.pageSize 
Do while (NOT RS.EOF) and (RCount > 0 ) 
'�� ���������� ����� �ʵ��� ���� ���� �Ѳ����� �����ͼ� ������ ������ �д�. 
 Sid=RS("sid") 
 Subject=server.htmlencode(RS("subject")) '�±׾��� ���� ó�� 
 Visit=RS("visit") 
 STime=RS("stime") 
 
'���پ� �ݺ��ϸ鼭 ȭ�鿡 ����Ѵ� 
%> 
 
<tr bgcolor="black" text="white"> 
<td align="center"><%=Sid%></td> 
<td><a href="view.asp?sid=<%=sid%>"><%=Subject%></a></td> 
<td align="center"><%=Visit%></td> 
<td align="center"><%=STime%></td> 
</tr> 
<tr> 
<td colspan=4 height=1 bgcolor="#000000"></td> 
</tr> 
 
<% 
 RS.MoveNext 
 RCount = RCount -1 
 Loop 
End if 
RS.CLose 
Set RS=nothing 
%> 
 
<tr> 
<td colspan=4 height=1 bgcolor="#cccccc"></td> 
</tr> 
</table> 
 
<!-- ������ ��������--> 
<table width="540" cellpadding="2" cellspacing="0" border="0"> 
<tr> 
<td height="30" align="center"> 
 
<% 
Gsize = 10 '����׷��� ������ ���� ���Ѵ� 
PreGNum = (IPage - 1) \ GSize '�����׷��� �׷��ȣ�� ���Ѵ� 
EndPNum = PreGNum * GSize '�����׷��� ������ ��������ȣ�� ���Ѵ� 
Tar = "Page=" & EndPNum 
Tar = Tar & "&Field=" & Field 
Tar = Tar & "&Str=" & Str 
 
'�����׷����--------------- 
'�����׷��� �ִٸ� ����Ѵ� 
IF ( EndPNum > 0 ) Then 
%> 
[<a href="list.asp?<%=Tar%>">�� ��</a>] 
<% End IF 
'�����׷� ��--------------- 
 
'����׷����--------------- 
'����׷��� ����Ѵ� (Gsize��ŭ) 
LCount = GSize 
intI = EndPNum + 1 '����׷��� ������������ ���Ѵ� 
Do While (LCount > 0) and (intI <= TotPage) 
Tar = "Page=" & intI 
TAr = TAr & "&Field=" & Field 
TAr = TAr & "&Str=" & Str 
%> 
[<a href="list.asp?<%=TAr%>"><%=intI%></a>] 
<% 
intI = intI + 1 
LCount = LCount - 1 
Loop 
'����׷� ��--------------- 
 
'�����׷����--------------- 
intI = EndPNum + (GSize + 1) '�����׷��� ������������ ���Ѵ� 
TAr = "Page=" & intI 
TAr = TAr & "&Field=" & Field 
TAr = TAr & "&Str=" & Str 
 
'�����׷��� �ִٸ� ����Ѵ� 
If (intI <= TotPage ) Then 
%> 
[<a href="list.asp?<%=TAr%>">����</a>] 
<% 
'�����׷� ��--------------- 
End if 
%> 
</td> 
</tr> 
</table> 
 
<!--�˻� �κ�--> 
<table width="540" cellpadding="2" cellspacing="0" border="0"> 
<form method="Get" Action="list.asp"> 
<tr align="center"> 
<td height="50"> 
<select name="Field"> 
<option value="Subject">���� 
<option value="Content">���� 
</select> 
<input type="text" name="Str"> 
<input type=submit value="�˻�"> 
</td> 
</tr> 
</form> 
</table> 
</body> 
</html> 
