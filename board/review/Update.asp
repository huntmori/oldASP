<html> 
<head> 
<title></title> 
<link href="basic.css" rel="stylesheet" type="text/css"> 
</head> 
<body> 
<script language="Javascript"> 
<!-- 
function Send() { 

var vS = document.form.Subject.value; 
var vC = document.form.Content.value; 
var vP = document.form.Pass.value; 

if (vS == "") { 
alert("������ �Է��ϼ���.\n"); 
document.form.Subject.focus(); 
return false; 
} 

if (vC == "") { 
alert("������ �Է��ϼ���.\n"); 
document.form.Content.focus(); 
return false; 
} 

if (vP == "") { 
alert("��ȣ�� �Է��ϼ���.\n"); 
document.form.Pass.focus(); 
return false; 
}? 

return true; 
} 
--> 
</script> 

<!-- #include file="inc.asp" --> 
<% 
'������ �۹�ȣ�� ���۹޴´� 
Sid = Request.Querystring("sid") 

'������ �۹�ȣ�� �� �ʵ尪�� �����´�.���� ������ �Է¾�Ŀ� �ѷ��ֱ� ���� 
Set DB = Server.CreateObject("ADODB.Connection") 
DB.open ConnString 
SQL = "SELECT top 1 Subject,Content FROM NEWS " 
Sql = SQL & " WHERE sid =" & Sid 
Set RS = DB.Execute(SQL) 

'�ʿ��� ���� ������ ������ �д� 
Subject = RS("subject") 
Subject = Replace(Subject,"""","&quot;")'�ֵ���ǥ���� �ֵ���ǥ ó�� 
Content = RS("content") 

RS.CLose 
Set RS=nothing 
DB.CLose 
Set DB=nothing 
%> 

<table cellspacing=0 cellpadding=2 border="0" width="540"> 
<tr> 
<td width=167 align="left"><b>�����ϱ�</b></td> 
<td width=273 align="center">&nbsp;</td> 
<td width=100 align="right"> 
[<a href="javascript:history.go(-1)">���ư���</a>]</td> 
</tr> 
</table> 

<table width="540" border=0 cellpadding=2 cellspacing=0 71:bgcolor="#ededed"> 
<form method=post action="update_ok.asp?sid=<%=sid%>" 73:name="form" onSubmit="return Send()"> 
<tr> 
<td colspan=2 height=1 bgcolor="#cccccc"></td> 
</tr> 
<tr> 
<td width="60" align="center">�� ��</td> 
<td><input name="Subject" type="text" value="<%=subject%>"?size="60"></td> 
</tr> 
<tr> 
<td width="60" align="center">�� ��</td> 
<td><textarea rows="10" cols="60"?name="Content"><%=content%></textarea> 
</td> 
</tr> 
<tr> 
<td colspan=2 height=1 bgcolor="#cccccc"></td> 
</tr> 
<tr> 
<td align="center">��ȣ</td> 
<td><input type="password" name="Pass" size="20" 
maxlength="10"></td> 
</tr> 
<tr> 
<td height="40" colspan="2" align="center" bgcolor="#FFFFFF"> 
<input type="submit" value="�Է¿Ϸ�" name="submit2"> 
<input type="reset" value="�����Է�" name="reset2"></td> 
</tr> 
<tr> 
<td colspan=2 height=1 bgcolor="#cccccc"></td> 
</tr> 
</form> 
</table> 
</body> 
</html> 
