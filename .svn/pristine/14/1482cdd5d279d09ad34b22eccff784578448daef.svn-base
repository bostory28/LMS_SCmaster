<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>idCheck.jsp</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/custom.css" rel="stylesheet">
    <link href="../jquery-plugin/anythingSlider/anythingslider.css" rel="stylesheet">
    <script src="../js/respond.js"></script>
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../jquery-plugin/anythingSlider/jquery.anythingslider.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
<script language="javascript">
//검색어 입력 여부 확인
function formCheck() {
	var searchText = document.getElementById('searchText');
	if (searchText.value == '') {
		alert('검색할 ID를 입력하세요.');
		searchText.focus();
		return false;
	}
	return true;
}

//ID 사용
function selectId() {
	opener.joinform.id.value = idform.searchText.value;
	this.close();
}
</script>

</head>
<body>

<h2>[ ID 중복 확인 ]</h2>

<form id="idCheck" name="idform" action="idCheck.action" method="post" onSubmit="return formCheck();">

ID : <input type="text" name="searchText" class="form-control" value="${searchText}" id="searchText"/>
	<input type="submit" id="idCheck_0" class="form-control" value="검색"/>

</form>




<br><br>

<!-- ID 검색 후에만 실행 -->
<s:if test="%{idCheck}">
	<s:if test="%{searchText!=null}">
	사용할 수 없는 ID입니다.
	</s:if>
</s:if>
<s:if test="%{!idCheck}">
	<s:if test="%{searchText!=null}">
	사용할 수 있는 ID입니다.&nbsp;&nbsp; 
	<input type="button" onclick ="javascript:selectId()" value="사용하기"/>
	</s:if>
</s:if>
</body>
</html>