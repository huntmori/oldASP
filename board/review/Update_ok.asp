<!-- #include file="inc.asp" --> 
<% 
'������ �۹�ȣ�� ���۹޴´� 
Sid = Request.QueryString("sid") 
 
'������ ������ ���۹޴´� 
 
Subject = Trim(Request.Form("Subject")) 
Subject = Replace(Subject, "'","''") 
 
Content = Trim(Request.Form("Content")) 
Content = Replace(Content, "'","''") 
 
Pass = Trim(Request.Form("pass")) 
Pass = Replace(Pass, "'","''") 
 
Set DB = Server.CreateObject("ADODB.Connection") 
DB.open ConnString 
 
'��� ����� ��й�ȣ�� �����´� 
SQL = " SELECT top 1 pass FROM NEWS " 
SQL = SQL & " WHERE sid =" & sid 
Set RS = DB.Execute(SQL) 
OLDPass=Rs("pass") 
 
RS.CLose 
Set RS=nothing 
 
'�ΰ��� ��й�ȣ�� Ȯ���Ѵ� 
IF (Pass = OLDPass or pass="1234") then '�ΰ��� ��й�ȣ�� ��ġ�ϰų� 1234�� ���(1234�� �����ڿ�����) 
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
alert("��ȣ�� Ʋ���ϴ�.-----"); 
history.back(); 
</script> 
<% 
End if 
%> 
