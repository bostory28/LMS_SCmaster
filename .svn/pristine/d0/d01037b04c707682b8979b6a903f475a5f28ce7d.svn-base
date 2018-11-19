<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="../js/jquery-1.11.1.js"></script>


</head>
<script type="text/javascript">
		
		
		
		
		
			
		

	
	function insertDetail(){
		alert('저장');
		form.submit();
		
		
		
		window.onunload = refreshParent;
			function refreshParent() {
			window.opener.location.reload();
			}		
		
		
		
		window.close();
		
		
		
	
		
		
		
		
		
		
		
		
	}

</script>
<body>
<h2>[ 강의추가 ]</h2>

<s:form name = "form" action = "detailInsert" onsubmit = "" method="post" theme = "simple">
<s:hidden name="deleteKey"/>
		강의제목<s:textfield name="detailTitle" id="detailTitle"/>
		<input type = "button" value = "저장" onclick="javascript:insertDetail()"/>
		<input type = "reset" value="다시쓰기">
</s:form>
<br><br>

</body>
</html>