<html>
<head>
<title>게시물 삭제</title>
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
alert("암호를 입력하세요.\n");
document.form.Pass.focus();
return false;
}
return true;
}
-->
</script>
<table Cellspacing = 0 cellpadding = 2 width = "540" border = "0">
<tr>
<td width="178"><b>삭제하기</b></td>
<td align="center">&nbsp;</td>
<td width="100" align="right">[
<a href = "javascript:history.go(-1)">돌아가기</a>
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
<td width="50" align="center">암호</td>
<td>
<input type="password" NAME="Pass" size="20" maxlength="10">이전에 입력한 암호가 필요합니다.
<input type="submit" value="삭제" name="submit"></td>
</tr>
</form>
</table>
</body>
</html>