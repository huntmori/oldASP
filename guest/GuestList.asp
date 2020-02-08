<html>
	<head>
		<title>Guest List</title>
		<!-- #include file="adovbs.inc" -->
	</head>
	
<%
	Set DBConn=Server.CreatObject("ADODB.Connection")
	DBConn.Open="DSN=WebDB;UID=sa;Password=123"
	Set DBCmd=Server.CreateObject("ADODB.Command")
	DBCmd.CommandText="Select * from Guest"
	DBCmd.CommandType=adCmdText
	Set DBCmd.ActiveConnection=DBConn
	Set RS_ptr=Server.CreateObject("ADODB.RecordSet")
	RS_ptr.Open DBCmd, , adopenStatic, adLockPessimistic
%>
<body bgcolor="black" text="white">
<center><h1> 방 명 록</h1></center>
<p>
<CENTER>
	<a href="GuestInsert.html"> 방명록 쓰기 </a>
<p align="left">
	<table border=0 width=503>
		<tr>	<td width=100 align=center> 제 목 </td>
				<td><%
						Do while Not RS_ptr.EOF
							View RS_ptr("title")
							RS_ptr.Movenext
						Loop
						Sub View(title)
					%>
				</td>
				<td align=center><%=title%></td>
		</tr>
		
		<tr>
				<td width=100 align=center> 이 름 </td>
				<td><%
						Do while Not RS_ptr.EOF
							View RS_ptr("name")
							RS_ptr.Movenext
						Loop
						Sub View(name)
					%>
				</td>
				<td align=center>
				<a href="GuestRead.asp?name=<%RS_ptr("name")%>">
				</td>
		</tr>
		
		<tr>
				<td width=100 align=center> E-Mail</td>
				<td><%
						Do while Not RS_ptr.EOF
							View RS_ptr("title") ,RS_ptr("name"), RS_ptr("email")
							RS_ptr.Movenext
						Loop
						Sub View(title, name, email)
					%>
				</td>
				<td width=100 align=center><%=email%></td>
		<tr>
				<td align=center> 내용</td>
				<td><%
						Do while Not RS_ptr.EOF
							View RS_ptr("content")
							RS_ptr.Movenext
						Loop
						Sub View(content)
					%>
				</td>
				<td align=center><%=content%></td>
		</tr>

		<tr>
			
			
			
		</tr>
	<%end sub%>
	</table>
</body>
</html>