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
alert("제목을 입력하세요.\n"); 
document.form.Subject.focus(); 
return false; 
} 

if (vC == "") { 
alert("내용을 입력하세요.\n"); 
document.form.Content.focus(); 
return false; 
} 

if (vP == "") { 
alert("암호를 입력하세요.\n"); 
document.form.Pass.focus(); 
return false; 
}? 

return true; 
} 
--> 
</script> 

<!-- #include file="inc.asp" --> 
<% 
'수정할 글번호를 전송받는다 
Sid = Request.Querystring("sid") 

'수정할 글번호의 각 필드값을 가져온다.기존 값들을 입력양식에 뿌려주기 위해 
Set DB = Server.CreateObject("ADODB.Connection") 
DB.open ConnString 
SQL = "SELECT top 1 Subject,Content FROM NEWS " 
Sql = SQL & " WHERE sid =" & Sid 
Set RS = DB.Execute(SQL) 

'필요한 값을 변수에 대입해 둔다 
Subject = RS("subject") 
Subject = Replace(Subject,"""","&quot;")'쌍따옴표속의 쌍따옴표 처리 
Content = RS("content") 

RS.CLose 
Set RS=nothing 
DB.CLose 
Set DB=nothing 
%> 

<table cellspacing=0 cellpadding=2 border="0" width="540"> 
<tr> 
<td width=167 align="left"><b>수정하기</b></td> 
<td width=273 align="center">&nbsp;</td> 
<td width=100 align="right"> 
[<a href="javascript:history.go(-1)">돌아가기</a>]</td> 
</tr> 
</table> 

<table width="540" border=0 cellpadding=2 cellspacing=0 71:bgcolor="#ededed"> 
<form method=post action="update_ok.asp?sid=<%=sid%>" 73:name="form" onSubmit="return Send()"> 
<tr> 
<td colspan=2 height=1 bgcolor="#cccccc"></td> 
</tr> 
<tr> 
<td width="60" align="center">제 목</td> 
<td><input name="Subject" type="text" value="<%=subject%>"?size="60"></td> 
</tr> 
<tr> 
<td width="60" align="center">내 용</td> 
<td><textarea rows="10" cols="60"?name="Content"><%=content%></textarea> 
</td> 
</tr> 
<tr> 
<td colspan=2 height=1 bgcolor="#cccccc"></td> 
</tr> 
<tr> 
<td align="center">암호</td> 
<td><input type="password" name="Pass" size="20" 
maxlength="10"></td> 
</tr> 
<tr> 
<td height="40" colspan="2" align="center" bgcolor="#FFFFFF"> 
<input type="submit" value="입력완료" name="submit2"> 
<input type="reset" value="새로입력" name="reset2"></td> 
</tr> 
<tr> 
<td colspan=2 height=1 bgcolor="#cccccc"></td> 
</tr> 
</form> 
</table> 
</body> 
</html> 
