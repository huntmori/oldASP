<html> 
<head> 
<title></title> 
<link href="basic.css" rel="stylesheet" type="text/css"> 
</head> 
<body bgcolor="black" text="white" link="white" alink="white" vlink="white" background="back2.jpg">
<!-- #include file="inc.asp" --> 
<% 
'페이지값을 전송받는다 
IPage = Request.QueryString("Page") '페이지 정보가 필요한 모든 파일에서 전송된 값 
If (IPage = "") Then 
 IPage = "1" 
End If 
 IPage = CInt(IPage) '정수로 바꾼다(전송후 String형으로 변하기 때문) 
 
'검색할 필드와 단어를 전송받는다 
Field = replace(Request("Field"),"'","''") 
Str = replace(Request("Str"),"'","''") 
 
Set RS = SERVER.CreateObject("ADODB.Recordset") 
RS.CursorType = 3  'adOpenStatic
SQL = "SELECT Sid,Subject,Visit,Stime FROM NEWS " 
 
'검색이냐 아니냐에 따라 
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
 Rs.pagesize=5 '한페이지에 5개씩 보여준다 
 TotPage = RS.PageCount 
End if 
%> 
 
<table cellspacing=0 cellpadding=2 border=0 width="540" bgcolor="#000000"> 
<tr> 
 <td width="185" align="left"><b><%if Str<>"" then%>검색결과<%else%>목록보기<%end if %></b></td> 
 <td width="173" align="center" class="f8">Total : <%=TotRecord%> &nbsp;<%=IPage%>/<%=TotPage%> Pages</td> 
 <td width="170" align="right"><a href="list.asp">전체리스트</a>&nbsp;<a href="write.asp">새글쓰기</a></td> 
</tr> 
</table> 
 
 
<table width="540" cellpadding="2" cellspacing=0 style='word-break:break-all;'> 
<tr> 
 <td colspan=4 height=1 bgcolor="#000000"></td> 
</tr> 
<tr bgcolor="#000000"> 
<td width="40" align="center">번 호</td> 
<td width="320" align="center">제 목</td> 
<td width="40" align="center">조 회</td> 
<td width="80" align="center">등록일</td> 
</tr> 
<tr> 
<td colspan=4 height=1 bgcolor="#000000"></td> 
</tr> 
 
<% 
IF (RS.BOF and RS.EOF) Then 
Response.Write "<tr> <td colspan=4 align=center>" 
Response.Write "게시물이 없습니다." 
Response.Write "</td></tr>" 
Else 
RS.AbsolutePage = IPage '해당 페이지의 첫번째 레코드로 이동한다 
RCount = RS.pageSize 
Do while (NOT RS.EOF) and (RCount > 0 ) 
'이 페이지에서 사용할 필드의 값을 전부 한꺼번에 가져와서 변수에 대입해 둔다. 
 Sid=RS("sid") 
 Subject=server.htmlencode(RS("subject")) '태그없이 문자 처리 
 Visit=RS("visit") 
 STime=RS("stime") 
 
'한줄씩 반복하면서 화면에 출력한다 
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
 
<!-- 페이지 관리시작--> 
<table width="540" cellpadding="2" cellspacing="0" border="0"> 
<tr> 
<td height="30" align="center"> 
 
<% 
Gsize = 10 '현재그룹의 페이지 수를 정한다 
PreGNum = (IPage - 1) \ GSize '이전그룹의 그룹번호를 구한다 
EndPNum = PreGNum * GSize '이전그룹의 마지막 페이지번호를 구한다 
Tar = "Page=" & EndPNum 
Tar = Tar & "&Field=" & Field 
Tar = Tar & "&Str=" & Str 
 
'이전그룹시작--------------- 
'이전그룹이 있다면 출력한다 
IF ( EndPNum > 0 ) Then 
%> 
[<a href="list.asp?<%=Tar%>">이 전</a>] 
<% End IF 
'이전그룹 끝--------------- 
 
'현재그룹시작--------------- 
'현재그룹을 출력한다 (Gsize만큼) 
LCount = GSize 
intI = EndPNum + 1 '현재그룹의 시작페이지를 정한다 
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
'현재그룹 끝--------------- 
 
'다음그룹시작--------------- 
intI = EndPNum + (GSize + 1) '다음그룹의 시작페이지를 정한다 
TAr = "Page=" & intI 
TAr = TAr & "&Field=" & Field 
TAr = TAr & "&Str=" & Str 
 
'다음그룹이 있다면 출력한다 
If (intI <= TotPage ) Then 
%> 
[<a href="list.asp?<%=TAr%>">다음</a>] 
<% 
'다음그룹 끝--------------- 
End if 
%> 
</td> 
</tr> 
</table> 
 
<!--검색 부분--> 
<table width="540" cellpadding="2" cellspacing="0" border="0"> 
<form method="Get" Action="list.asp"> 
<tr align="center"> 
<td height="50"> 
<select name="Field"> 
<option value="Subject">제목 
<option value="Content">내용 
</select> 
<input type="text" name="Str"> 
<input type=submit value="검색"> 
</td> 
</tr> 
</form> 
</table> 
</body> 
</html> 
