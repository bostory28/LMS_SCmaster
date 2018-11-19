<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일괄시험수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/custom.css" rel="stylesheet">
<link href="../jquery-plugin/anythingSlider/anythingslider.css" rel="stylesheet">
<script src="../js/respond.js"></script>
<script src="../js/jquery-1.7.2.min.js"></script>
<script src="../jquery-plugin/anythingSlider/jquery.anythingslider.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
 	<!-- 달력 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#flag').change(function() {
			var flag = $('#flag').val();
			location.href="editSubjectForm.action?flag=" + flag + "&field=IT";
		});
		$('#limittime').focusout(function() {
			var limittime = $('#limittime').val();
			if(isNaN(limittime) == true) {
				alert('숫자를 입력해주세요.');
				$('#limittime').val('');
				$('#limittime').focus();
			}
		});
		$('#startdatapicker').change(function() {
			var startdatapicker = $('#startdatapicker').val();
			$('#enddatapicker').val(startdatapicker);
		});
		$('#editbtn').click(function() {
			var limittime = $('#limittime').val();
			var startdatapicker = $('#startdatapicker').val();
			var enddatapicker = $('#enddatapicker').val();
			var testname = $('#testname').val();
			
			if(testname.length > 15) {
				alert('시험명이 15자를 넘을 수 없습니다.');
				$('#testname').val('');
				$('#testname').focus();
				return;
			}
			if(testname.length == 0) {
				alert('시험명을 입력하시오.');
				$('#testname').val('');
				$('#testname').focus();
				return;
			}
			if(limittime.length == 0) {
				alert('시험시간(분)을 입력하시오.');
				$('#limittime').val('');
				$('#limittime').focus();
				return;
			}
			if(startdatapicker.length == 0) {
				alert('시작날짜를 입력하시오.');
				$('#startdatapicker').val('');
				$('#startdatapicker').focus();
				return;
			}
			if(enddatapicker.length == 0) {
				alert('종료날짜를 입력하시오.');
				$('#enddatapicker').val('');
				$('#enddatapicker').focus();
				return;
			}
			if(startdatapicker.length != 0 && startdatapicker > enddatapicker) {
				alert('시작날짜가 종료날짜를 잘못 입력했습니다.');
				$('#enddatapicker').val('');
				$('#enddatapicker').focus();
				return;
			}
			$.ajax({
				url:'editTest.action',
				type:'post',
				dataType:'json',
				data:$('#subjectform').serialize(),
				contentType:'application/x-www-form-urlencoded; charset=UTF-8',	
				success:function() {
					var flag = $('#flag').val();
					opener.location.href="testItUi.action?flag=" + flag;
					window.close();
				}
			});
		});
		$('#startdatapicker').datepicker({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',
		    nextText: '다음 달',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			showMonthAfterYear: true,
			yearSuffix: '년'
		});
		$('#enddatapicker').datepicker({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',
		    nextText: '다음 달',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			showMonthAfterYear: true,
			yearSuffix: '년'
		});
	});
</script>
</head>
<body>
<form name="subjectform" id="subjectform">
<input type="hidden" name="flag" value="<s:property value="teasubteavo.flag"/>">
<input type="hidden" name="subjectname" value="<s:property value="teasubteavo.subjectname"/>">
<input type="hidden" name="testname" value="<s:property value="teasubteavo.testname"/>">
<input type="hidden" value="NO" name="teasubteavo.type">

<table class="table table-bordered" style="font-family:fantasy;">
		<tr>
			<td colspan="4" align="center"  class="success">
				<b style="text-align: center;  font-size: 25px; font-family:serif;">&lt;IT과목별시험수정&gt;</b>
			</td>
		</tr>
		<tr>
			<td class="warning">기수</td>
			<td>
				<input class="form-control" type="text" id="flag" readonly="readonly" name="teasubteavo.flag" value="<s:property value="teasubteavo.flag"/>">
			</td>
			<td class="warning">과목명</td>
			<td>
				<select id="subject" name="teasubteavo.subjectname" class="form-control">
					<s:if test="teasubteavo != null">
						<option selected="selected"><s:property value="teasubteavo.subjectname"/></option>
						<s:iterator value="list_subject" status="stat">
							<s:if test="list_subject[#stat.index] != subjectname ">
								<option><s:property value="list_subject[#stat.index]"/></option>
							</s:if>
						</s:iterator>
					</s:if>
					<s:else>
						<s:iterator value="list_subject" status="stat">
							<option><s:property value="list_subject[#stat.index]"/></option>
						</s:iterator>
					</s:else>
				</select>
			</td>
		</tr>
		<tr>
			<td class="warning">시험명</td>
			<td>
				<input class="form-control" type="text" id="testname" name="teasubteavo.testname" value="<s:property value="teasubteavo.testname"/>">
			</td>
			<td class="warning">시험시간(분)</td>
			<td>
				<input class="form-control" type="text" id="limittime" name="teasubteavo.limittime" value="<s:property value="teasubteavo.limittime"/>">
			</td>
		</tr>
		<tr>
			<td class="warning">시작날짜</td>
			<td>
				<input class="form-control" type="text" id="startdatapicker" name="teasubteavo.startdate" value="<s:property value="teasubteavo.startdate"/>">
			</td>
			<td class="warning">종료날짜</td>
			<td>
				<input class="form-control" type="text" id="enddatapicker" name="teasubteavo.enddate" value="<s:property value="teasubteavo.enddate"/>">
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right" >
				<input type="button" id="editbtn" value="시험수정" style="height: 35px; width: 130px" class="btn btn-primary">
			</td>
		</tr>
	</table>
</form>
</body>
</html>