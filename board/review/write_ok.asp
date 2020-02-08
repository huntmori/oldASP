<!-- #include file="inc.asp" --> 
<% 
'사용자의 입력값을 전송받는다 
 
'제목 
Subject = Trim(Request.Form("subject")) 
Subject = Replace(Subject,"'","''") 
 
'내용 
Content = Trim(Request.Form("content")) 
Content = Replace(Content, "'","''") 
 
'비밀번호 
Pass = Trim(Request.Form("pass")) 
Pass = Replace(Pass, "'","''") 
 
'글 작성 시간 
STime = date() '글 쓴 시각을 구한다 
 
'새글의 글번호를 얻기 위해 가장 큰 글번호를 찾는다 
Set DB =Server.CreateObject("ADODB.Connection") 
DB.open ConnString 
SQL = "SELECT MAX(sid) FROM NEWS" 
Set RS = DB.Execute(SQL) 
IF IsNull(RS(0)) Then 
 Nsid = 1 
Else 
 Nsid = RS(0) +1 '새글의 글번호로 한다 
End IF 
RS.CLose 
Set RS=nothing 
 
'데이터베이스에 저장한다 
SQL = "INSERT INTO NEWS VALUES (" 
SQL = SQL & Nsid 
SQL = SQL & ",'" & Subject & "'" 
SQL = SQL & ",'" & Content & "'" 
SQL = SQL & ",'" & Pass & "'" 
SQL = SQL & ",1" 
SQL = SQL & ",'" & STime & "')" 
DB.Execute SQL 
 
DB.CLose 
Set DB=nothing 
 
URL = "list.asp" 
Response.Redirect URL 
%> 
