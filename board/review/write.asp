<html> 
<head> 
<title>�Խ��� �۾���</title> 
<link href="basic.css" rel="stylesheet" type="text/css"> 
</head> 
<body bgcolor="black" text="white" link="white" alink="white" vlink="white" background="back2.jpg">
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
}
return true; 
} 
--> 
</script>
<table cellspacing=0 cellpadding=2 border="0" width="540"> 
<tr> 
 <td width=182 align="left"><b><h1>���۾���</h1><br></b></td> 
 <td width=258 align="center">&nbsp;</td> 
 <td width=100 align="right">
 <a href="javascript:history.go(-1)">[���ư���]</a> 
 </td> 
</tr> 
</table> 
<table width="540" border=0 cellpadding=2 cellspacing=0 bgcolor="#ededed"> 
<form method=post action="Write_ok.asp" name="form" onSubmit="return Send()"> 
<tr> 
 <td colspan=2 height=1 bgcolor="#cccccc"></td> 
</tr> 
<tr> 
<td width="60" align="center">�� ��</td> 
<td><input type="text" name="Subject" size="60"></td> 
</tr> 
<tr> 
<td width="60" align="center">�� ��</td> 
<td><textarea rows="10" cols="60" name="Content"></textarea> 
</td> 
</tr> 
<tr> 
<td colspan=2 height=1 bgcolor="#cccccc"></td> 
</tr> 
<tr> 
<td align="center">��ȣ</td> 
<td> 
<input name="Pass" type="password" id="Pass" size="20" maxlength="10"> 
</td> 
</tr> 
<tr> 
<td height="40" colspan="2" align="center" bgcolor="#FFFFFF"> 
 <input type="submit" value="�Է¿Ϸ�" name="submit"> 
 <input type="reset" value="�����Է�" name="reset"> 
</td> 
</tr> 
<tr> 
 <td colspan=2 height=1 bgcolor="#cccccc"></td> 
</tr> 
</form> 
</table> 
</body> 
</html> 