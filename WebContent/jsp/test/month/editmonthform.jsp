<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일본어월말시험수정</title>
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
		$('#startdatapicker').change(function() {
			var startdatapicker = $('#startdatapicker').val();
			$('#enddatapicker').val(startdatapicker);
		});
		$('#startdatapicker').change(function() {
			var startdatapicker = $('#startdatapicker').val();
			if(startdatapicker.substring(5, 6) == 0) {
				$('#testname').val(startdatapicker.substring(6, 7)+'월월말평가');
			} else {
				$('#testname').val(startdatapicker.substring(5, 7)+'월월말평가');
			}
		});
		$('#editbtn').click(function() {
			var limittime = $('#limittime').val();
			var startdatapicker = $('#startdatapicker').val();
			var enddatapicker = $('#enddatapicker').val();
			
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
				url:'editMonthTest.action',
				type:'post',
				dataType:'json',
				data:$('#subjectform').serialize(),
				contentType:'application/x-www-form-urlencoded; charset=UTF-8',	
				success:function(json) {
					var check = json.check;
					if(check == false) {
						alert('이미 등록된 년도와 달입니다. 다시입력하세요.');
						$('#startdatapicker').val('');
						$('#enddatapicker').val('');
						$('#startdatapicker').focus();
						return;
					}
					var flag = $('#flag').val();
					opener.location.href="japMonth.action?flag=" + flag;
					window.close();
				}
			});
		});
	});
</script>
</head>
<body>
<form name="subjectform" id="subjectform">
	<input type="hidden" name="flag" value="<s:property value="teasubteavo.flag"/>">
	<%-- <input type="hidden" name="subjectname" value="<s:property value="teasubteavo.subjectname"/>"> --%>
	<input type="hidden" name="testname" value="<s:property value="testname"/>">

	<table class="table table-bordered" style="font-family:fantasy;">
		<tr>
			<td colspan="4" align="center"  class="success">
				<b style="text-align: center;  font-size: 25px; font-family:serif;">&lt;일괄시험수정&gt;</b>
			</td>
		</tr>
		<tr>
			<td class="warning">기수</td>
			<td>
				<input class="form-control" type="text" id="flag" name="teasubteavo.flag" readonly="readonly" value="<s:property value="flag"/>">
			</td>
			<td class="warning">인원수</td>
			<td>
				<input class="form-control" type="text" id="num" readonly="readonly" value="<s:property value="num"/>명">
			</td>
		</tr>
		<tr>
			<td class="warning">시험이름</td>
			<td>
				<input class="form-control" type="text" id="testname" name="teasubteavo.testname" readonly="readonly" value="<s:property value="teasubteavo.testname"/>">
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