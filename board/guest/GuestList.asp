<html>
<head>
<title>Guest List</title>
<!-- #include file="adovbs.inc" -->
<style type="text/css">
a
{
	font-size:14px;
	color:#444;
	text-decoration:none;
}
a:hover
{
	color:skyblue;
	font-weight:bold;
}
table
{
	border-collapse:collapse;
	border:2px solid skyblue ;
}

table td 
{
	border:1px; solid #666666;
}

table th
{
	border:0 solid #666666;
	background-color:skyblue;
}

table tr.line
{
	background-color:#dddddd;
}
</style>
</head>
<%
Set DBConn = Server.CreateObject("ADODB.Connection")
DBConn.Open = "DSN=ej;UID=sa;Password=123"
Set DBCmd = Server.CreateObject("ADODB.Command")
DBCmd.CommandText = "Select * from Guest"
DBCmd.CommandType = adCmdText
Set DBCmd.ActiveConnection = DBConn
Set RS_ptr = Server.CreateObject("ADODB.RecordSet")
RS_ptr.Open DBCmd, , adOpenStatic, adLockPessimistic
%>
<body bgcolor="black" text="white" link="white" alink="white" vlink="white" background="back2.jpg">
<br><br><center><h1> <font color="Red">방 명 록</font> </h1></center>
<p>
<center>
	<a href = "GuestInsert.html"> 방명록 쓰기 </a><br><br><br>
	<table border="5" cellspacing="0" cellpadding="10" rules="rows" frame="hsides" align ="center" width = "600">
		<tr>
			<td align=center bgcolor="#aaaaaa"> 제 목 </td>
			<td align=center bgcolor="#aaaaaa"> 이 름 </td>
			<td align=center bgcolor="#aaaaaa"> E-Mail</td>
		</tr>
<%
Dim line
line = 0
Do while Not RS_ptr.EOF
View RS_ptr("title"), RS_ptr("name"), RS_ptr("email"), line
RS_ptr.MoveNext
line = line + 1
Loop
Sub View(title, name, email, line)

response.write title
%>
<% if line mod 2 = 1 then %>
<tr class="line">
<% end if %>
<td align=center>
<a href="GuestRead.asp?name=<%=RS_ptr("name")%>">
<%=title%></td>
<td align=center><%=name%></td>
<td align=center><%=email%></td>
</tr>
<%end sub%>
</table>
</body>
</html>