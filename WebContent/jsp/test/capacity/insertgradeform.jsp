<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IT역량평가성적입력</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/custom.css" rel="stylesheet">
<link href="../jquery-plugin/anythingSlider/anythingslider.css" rel="stylesheet">
<script src="../js/respond.js"></script>
<script src="../js/jquery-1.7.2.min.js"></script>
<script src="../jquery-plugin/anythingSlider/jquery.anythingslider.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.form-control').focusout(function() {
			var formcontrol = $(this).val();
			if(formcontrol >  100) {
				alert('100이하의 숫자를 입력하세요.');
				$(this).val('');
				$(this).focus();
			} 
			if(formcontrol <  0) {
				alert('0이상의 숫자를 입력하세요.');
				$(this).val('');
				$(this).focus();
			} 
			if(isNaN(formcontrol) == true) {
				alert('숫자를 입력해주세요.(0~100)');
				$(this).val('');
				$(this).focus();
			}
		});
		$('#insertbtn').click(function() {
			$.ajax({
				url:'insertCapacityGrade.action',
				type:'post',
				dataType:'json',
				data:$('#gradeform').serialize(),
				contentType:'application/x-www-form-urlencoded; charset=UTF-8',	
				success:function() {
					var flag = $('#flag').val();
					opener.location.href='itCapacity.action?flag='+flag;
					window.close();
				}
			});
		});
	});
</script>
</head>
<body>
<form id="gradeform">
<!-- 역량평가 아이디를 가져오기위해서 testname을 가져왔다. -->
<input type="hidden" value="<s:property value="testname"/>" name="testname">
<input type="hidden" value="<s:property value="flag"/>" id="flag" name="flag">
<table class="table table-bordered" style="font-family:fantasy; ">
		<tr>
			<td colspan="7" class="success" align="center">
				<b style="text-align: center;  font-size: 25px; font-family:serif;">&lt;IT역량평가성적입력&gt;</b>
			</td>
		</tr>
		<tr style="text-align: center;">
			<td class="warning" width="50px">
				기수
			</td>
			<!-- <td class="warning">
				반
			</td> -->
			<td class="warning">
				시험명
			</td>
			<td class="warning">
				이름
			</td>
			<td class='warning'>
				성적
			</td>
		</tr>
		<s:iterator value="list_test" status="stat">
			<tr>
				<s:if test="#stat.index == 0">
					<td style="vertical-align: middle; text-align: center;"  rowspan="<s:property value="list_test.size"/>"><s:property value="list_test[#stat.index].flag"/>기</td>
					<%-- <td style="vertical-align: middle; text-align: center;"  rowspan="<s:property value="list_test.size"/>"><s:property value="list_test[#stat.index].class_num"/></td> --%>
					<td style="vertical-align: middle; text-align: center;"  rowspan="<s:property value="list_test.size"/>"><s:property value="list_test[#stat.index].testname"/></td>
				</s:if>
				<td style="text-align: center; width: 150px;">
					<s:property value="list_test[#stat.index].name"/>
					<input type="hidden" name="id" value="<s:property value="list_test[#stat.index].id"/>"/>
					<input type="hidden" name="testid" value="<s:property value="list_test[#stat.index].testid"/>"/>
				</td>
				<td>
					<input type="text" name="score" style="text-align: center;" class="form-control">
				</td>
			</tr>
		</s:iterator>
		<tr>
			<td colspan="7" align="right">
				<input type="button" id="insertbtn" value="성적입력" style="height: 35px; width: 130px" class="btn btn-primary">
			</td>
		</tr>
	</table>
</form>
</body>
</html>