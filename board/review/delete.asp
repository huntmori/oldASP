<html>
<head>
<title>�Խù� ����</title>
</head>
<body>
<%
sid = Request.QueryString("sid")
%>
<script language="Javascript">
<!--
function Send()
{
var vP = document.form.Pass.value;

if(vP == ""){
alert("��ȣ�� �Է��ϼ���.\n");
document.form.Pass.focus();
return false;
}
return true;
}
-->
</script>
<table Cellspacing = 0 cellpadding = 2 width = "540" border = "0">
<tr>
<td width="178"><b>�����ϱ�</b></td>
<td align="center">&nbsp;</td>
<td width="100" align="right">[
<a href = "javascript:history.go(-1)">���ư���</a>
]</td>
</tr>
</table>
<br>
<table width="540" border="0" cellpadding="2" cellspacing="1" bgcolor="#ededed" cellspacing="0">
<form method="post" name="form" action="Delete_ok.asp?sid<%=sid> "onsubmin="return Send()">
<tr>
<td colspan="2" height="1" bgcolor="#cccccc"></td>
</tr>
<tr>
<td width="50" align="center">��ȣ</td>
<td>
<input type="password" NAME="Pass" size="20" maxlength="10">������ �Է��� ��ȣ�� �ʿ��մϴ�.
<input type="submit" value="����" name="submit"></td>
</tr>
</form>
</table>
</body>
</html>