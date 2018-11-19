<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function updateSubject() {
		alert('수정');
		form.submit();
		opener.location.reload();
		window.close();

	}
</script>
<body>
	<s:form id="form" action="updateSubject" onsubmit="return formCheck()"
		theme="simple">
		<s:hidden name="subj.subject_seq" />
		<s:hidden name="subj1.subject_seq" />

		<table border="1">
			<tr>
				<th>기수</th>
				<th>반</th>
				<th>강의명</th>
				<th>강사</th>
				<th>기간</th>
				<th>강의상세설명</th>
				<th></th>
			</tr>
			<tr>
				<td rowspan="2"><select id="flag" name="flag">

						<s:iterator value="flagLists" status="stat">
							<s:if test="subj.flag==flagLists[#stat.index].flag_num">
								<option selected="selected"><s:property
										value="flag_num" /></option>
							</s:if>
							<s:else>
								<option><s:property value="flag_num" /></option>
							</s:else>
						</s:iterator>


				</select></td>
				<td><select name="class_num1" id="class_num1">



						<s:iterator value="selLists" status="stat">

							<s:if test="subj.class_num==selLists[#stat.index]">
								<option selected="selected"><s:property /></option>
							</s:if>
							<s:else>
								<option><s:property /></option>
							</s:else>

						</s:iterator>

				</select></td>

				<td rowspan="2"><input type="text" name="subjectname"
					id="subjectname" value="<s:property value="subj.subjectname"/>"></td>

				<td><select name="teacher1" id="teacher1">
						<s:iterator value="teacherLists" status="stat">
							<s:if test="key==teacherLists[#stat.index].name">
								<option selected="selected" value='<s:property value="id"/>'><s:property
										value="name" /></option>
							</s:if>
							<s:else>
								<option value='<s:property value="id"/>'><s:property
										value="name" /></option>
							</s:else>
						</s:iterator>

				</select></td>


				<td rowspan="2">시작<select id="startyear" name="startyear">
						<s:iterator var="i" begin="2014" end="2000" step="-1">
							<s:if test="#i==startyear">
								<option selected="selected"><s:property value="#i" />
							</s:if>
							<s:else>
								<option><s:property value="#i" />
							</s:else>
						</s:iterator>
				</select>년<select id="startmonth" name="startmonth">
						<s:iterator var="i" begin="1" end="12">
							<s:if test="#i==startmonth">
								<option selected="selected"><s:property value="#i" />
							</s:if>
							<s:else>
								<option><s:property value="#i" />
							</s:else>
						</s:iterator>

				</select>월 <select id="startday" name="startday">
						<s:iterator var="i" begin="1" end="31">
							<s:if test="#i==startday">
								<option selected="selected"><s:property value="#i" />
							</s:if>
							<s:else>
								<option><s:property value="#i" />
							</s:else>
						</s:iterator>


				</select>일 종료<select id="endyear" name="endyear">
						<s:iterator var="i" begin="2014" end="2000" step="-1">
							<s:if test="#i==endyear">
								<option selected="selected"><s:property value="#i" />
							</s:if>
							<s:else>
								<option><s:property value="#i" />
							</s:else>
						</s:iterator>
				</select>년 <select id="endmonth" name="endmonth">
						<s:iterator var="i" begin="1" end="12">
							<s:if test="#i==endmonth">
								<option selected="selected"><s:property value="#i" />
							</s:if>
							<s:else>
								<option><s:property value="#i" />
							</s:else>
						</s:iterator>

				</select>월 <select id="endday" name="endday">
						<s:iterator var="i" begin="1" end="31">
							<s:if test="#i==endday">
								<option selected="selected"><s:property value="#i" />
							</s:if>
							<s:else>
								<option><s:property value="#i" />
							</s:else>
						</s:iterator>


				</select>일
				</td>
				<td><textarea rows="" cols="" name="content"><s:property
							value="subj.content" /></textarea></td>
				<td align="center"><input type="button" value="수정완료"
					onclick="javascript:updateSubject()"></a></td>

			</tr>

		</table>
	</s:form>

</body>
</html>