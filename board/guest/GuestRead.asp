<html>
<!-- #include file="adovbs.inc" -->
<body>
<center><h1>���� �б� </h1></center>
<p>
<%
Set DBConn = Server.CreateObject("ADODB.Connection")
DBConn.Open = "DSN=ej;UID=sa;Password=123"
Set DBCmd = Server.CreateObject("ADODB.Command")
DBCmd.CommandText = "Select * from Guest Where name = '" & Trim(Request("name")) & "' "
DBCmd.CommandType = adCmdText
Set DBCmd.ActiveConnection = DBConn
Set RS_ptr = Server.CreateObject("ADODB.RecordSet")
RS_ptr.Open DBCmd, , adopenStatic, adLockPessimistic
if RS_ptr.RecordCount = 1 then
%>
<center>
<table border=0>
<tr>
 <td align=left> �� �� : </td>
 <td><%=RS_ptr("name")%></td>
</tr>
<tr>
 <td align=left> E-Mail : </td>
 <td><%=RS_ptr("email")%></td>
</tr>
<tr>
 <td align=left> �� �� : </td>
 <td><%=RS_ptr("title")%></td>
</tr>
<tr>
 <td align=left> �� �� : </td>
 <td><%=RS_ptr("content")%></td>
</tr>
</table>
<p> <a href = "GuestList.asp">��Ϻ���</a>
</center>
<% 
RS_ptr.Close
DBConn.Close
end if
%>