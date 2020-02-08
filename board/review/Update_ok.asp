<!-- #include file="inc.asp" --> 
<% 
'수정할 글번호를 전송받는다 
Sid = Request.QueryString("sid") 
 
'수정한 값들을 전송받는다 
 
Subject = Trim(Request.Form("Subject")) 
Subject = Replace(Subject, "'","''") 
 
Content = Trim(Request.Form("Content")) 
Content = Replace(Content, "'","''") 
 
Pass = Trim(Request.Form("pass")) 
Pass = Replace(Pass, "'","''") 
 
Set DB = Server.CreateObject("ADODB.Connection") 
DB.open ConnString 
 
'디비에 저장된 비밀번호를 가져온다 
SQL = " SELECT top 1 pass FROM NEWS " 
SQL = SQL & " WHERE sid =" & sid 
Set RS = DB.Execute(SQL) 
OLDPass=Rs("pass") 
 
RS.CLose 
Set RS=nothing 
 
'두개의 비밀번호를 확인한다 
IF (Pass = OLDPass or pass="1234") then '두개의 비밀번호가 일치하거나 1234일 경우(1234는 관리자용으로) 
SQL = " UPDATE NEWS " 
SQL = SQL & " SET Subject='" & Subject & "'," 
SQL = SQL & " Content='" & Content & "'" 
SQL = SQL & " WHERE sid = " & Sid 
 
DB.Execute(SQL) 
DB.CLose 
Set DB=nothing 
 
URL = "list.asp" 
Response.Redirect URL 
Else 
%> 
<script language="javascript"> 
alert("암호가 틀립니다.-----"); 
history.back(); 
</script> 
<% 
End if 
%> 
