<!-- #include file="inc.asp" --> 
<% 
'������� �Է°��� ���۹޴´� 
 
'���� 
Subject = Trim(Request.Form("subject")) 
Subject = Replace(Subject,"'","''") 
 
'���� 
Content = Trim(Request.Form("content")) 
Content = Replace(Content, "'","''") 
 
'��й�ȣ 
Pass = Trim(Request.Form("pass")) 
Pass = Replace(Pass, "'","''") 
 
'�� �ۼ� �ð� 
STime = date() '�� �� �ð��� ���Ѵ� 
 
'������ �۹�ȣ�� ��� ���� ���� ū �۹�ȣ�� ã�´� 
Set DB =Server.CreateObject("ADODB.Connection") 
DB.open ConnString 
SQL = "SELECT MAX(sid) FROM NEWS" 
Set RS = DB.Execute(SQL) 
IF IsNull(RS(0)) Then 
 Nsid = 1 
Else 
 Nsid = RS(0) +1 '������ �۹�ȣ�� �Ѵ� 
End IF 
RS.CLose 
Set RS=nothing 
 
'�����ͺ��̽��� �����Ѵ� 
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
