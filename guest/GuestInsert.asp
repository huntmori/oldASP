<html>
	<!-- #include file="adovbs.inc" -->
	
<%
	Set DBConn=Server.CreateObject("ADODB.Connection")
	DBConn."DNS=WebDB;UID=sa;Password=123"
	
	Set DBCmd=Server.CreateObject("ADODB.Command")
	DBCmd.CommandText="Select * from Guest Where name'" & request("name") & "'"
	DBCmd.CommandType=adCmdText
	
	Set DBCmd.ActiveConnection = DBConn
	Set RS_ptr=Server.CreateObject("ADODB.RecordSet")
	
	RS_ptr.Open DBCmd, adOpenStatic, adLockPessimistic
	
	if RS_ptr.RecordCount=0 then
		if RS_ptr.Supports(AddNew) then
			RS_ptr.Addnew
			RS_ptr("name")=request("name")
			RS_ptr("email")=request("email")
			RS_ptr("title")=request("title")
			RS_ptr("content")=request("content")
			
			RS_ptr.Update
			RS_ptr.Close
			
			DBConn.Close
		End If
%>
		<center><h1>���������� �ۼ��Ǿ����ϴ�.</h1><a href="GuestList.asp">��Ϻ���</a></center>
<%
	else
		RS_ptr.Close
		DBConn.Close
%>
		<center><h1>�Է��� ������ �����ϴ�.</h1></center>
<%
	End If
%>
</body>
</html>