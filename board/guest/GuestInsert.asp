<html>
<!--#include file = "adovbs.inc"-->
<%
if request("name") = "" then
Response.Write "aa"
	Response.Write "<script>"
	Response.Write "alert('aa');"
	Response.Write "</script>"

else	
	Set DBConn = Server.CreateObject("ADODB.Connection")
	DBConn.Open = "DSN=ej;User ID=sa;Password=123"
	
	Set DBCmd = Server.CreateObject("ADODB.Command")
	DBCmd.CommandText = "Select * from Guest Where name='" & request("name") & "'"
	DBCmd.CommandType = adCmdText
	
	Set DBCmd.ActiveConnection = DBConn
	Set RS_ptr = Server.CreateObject("ADODB.RecordSet")
	
	RS_ptr.Open DBCmd, , adOpenStatic, adLockPessimistic

if RS_ptr.RecordCount = 0 then
	if RS_ptr.Supports(AddNew) then
		RS_ptr.AddNew
		RS_ptr("name") = request("name")
		RS_ptr("email") = request("email")
		RS_ptr("title") = request("title")
		RS_ptr("content") = request("content")
		
		RS_ptr.Update
		RS_ptr.Close
			
		DBConn.Close
	end if
%>
<center><h1> 방명록이 작성되었습니다.</h1><a href = "GuestList.asp">목록보기</a></center>
<%
else
	RS_ptr.Close
	DBConn.Close
%>
<center><h1>입력한 내용이 같습니다.</h1></center>
<%
	end if
end if
%>
</body>
</html>