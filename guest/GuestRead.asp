<html>
	<!--#include file="adovbs.inc"-->
<body>
	<center><h1>���� �б�</h1></center>
	<p>
	<%
		Set DBConn=Server.CreateObject("ADODB.Connection")
		DBConn.Open="DSN=WebDB;UID=sa;Password=123"
		Set DBConn=Server.CreateObject("ADODB.Connection")
		DMCmd.CommandText="Select * from Guest Where name='"&Trim(Request("name"))&'"
			DBCmd.CommandType=adCmdText
			Set DBCmd.ActiveConnection=DBConn
			Set RS_ptr=Server.CreateObject("ADODB.RecordSet")
			RS_ptr.Open DBCmd, , adopenStatic, adLockPessimistic
			if RS_ptr.RecordCount=1 then
	%>
				<center>
				<table border=0>
					<tr>
						<td align=left> �̸� :</td>
						<td> <%=RS_ptr("name")%></td>
					</tr>
					<tr>
						<td align=left> E-mail :</td>
						<td> <%=RS_ptr("email")%></td>
					</tr>
					<tr>
						<td align=left> ���� : </td>
						<td> <%=RS_ptr("name")%></td>
					</tr>
					<tr>
						<td align=left> ���� :</td>
						<td> <%=RS_ptr("content")%></td>
					</tr>
				</table>
				<p><a href="GuestList.asp">��Ϻ���</a>
				</center>
			<%	RS_ptr.Close
				DBConn.Close
			End if
			%>
</body>
</html>
			