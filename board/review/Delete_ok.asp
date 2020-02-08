<!-- #include file="Inc.asp" -->
<%
Sid=Request.QueryString("sid")
Pass=Request.Form("pass")
Set DB=Server.CreateObject("ADODB.Connection")
DB.open CpmmStromg
SQL = " SELECT top 1 pass FROM NEWS "
SQL = SQL & "WHERE sid = " & sid
Set RS = DB.Execute(SQL)
OLDPass=RS("pass")
RS.Close
Set RS=nothing
IF(Pass = OLDPass) or pass="1234" then
Set DB = Server.Createobject("ADODB.Connection")
DB.open ConnString

SQL = "DELETE from NEWS "
SQL = SQL & "WHERE sid =" & sid
DB.Execute(SQL)
DB.Close
Set DB=nothing
URL="list.asp"
Response.Redirect URL
Else
%>
<script language="javascript">
alert("암호가 틀립니다.-------");
history.back();
</script>
<%
End if
%>