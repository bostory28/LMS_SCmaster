<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>3조 프로젝트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/custom.css" rel="stylesheet">
<link href="../jquery-plugin/anythingSlider/anythingslider.css"
	rel="stylesheet">
<script src="../js/respond.js"></script>
<script src="../js/jquery-1.7.2.min.js"></script>
<script
	src="../jquery-plugin/anythingSlider/jquery.anythingslider.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-1.11.1.js"></script>
<link href="../jquery-plugin/mctabs/generic-notForMcTabs.css" rel="stylesheet" type="text/css" />
<link href="../jquery-plugin/mctabs/template2/mctabs.css" rel="stylesheet" type="text/css" />
<script src="../jquery-plugin/mctabs/javascript-tabs.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		hh();	
		xx();
		oo();
		
		$("#insert_btn").click(zz);
		$("#subject").change(uu);
		
	});//레디
	function oo(){
		$.ajax({
			url : "selectNihon.action",
			type : "post",
			dataType : "json",
			
			success : function(json){
				
				 var outhtml = "";
		
		    	outhtml += "<table  width='700'>";
		    	outhtml += "<center>"
		    	outhtml += "<th>기수</th><th>반</th><th>강의명</th><th>강사</th><th>기간</th>"
		     	 $.each(json.subjectLists, function(index, subject){
		     		
		     		outhtml += "<tr>";
		     		outhtml += 		"<td width='100px'>"+subject.flag+"</div></td>";
		     		outhtml += 		"<td width='100px'>"+subject.class_num+"</div></td>";
			     	
		     		outhtml += 		"<td width='100px'><a href='subjectDetail.action?deleteKey="+subject.subject_seq+"'>"+subject.subjectname+"<a></div></td>";
			     	
		     		outhtml += 		"<td width='100px'>"+subject.id+"</div></td>";
		    
		     		outhtml += 		"<td width='300px'>"+subject.start_date+"~"+subject.end_date+"</div></td>";
			     	
		     		outhtml += "<td><input type='button' class='btn btn-success' data-num4='"+subject.flag+"' data-num1='"+subject.subjectname+"' data-num2='"+subject.field+"' data-num='"+subject.subject_seq+"' value='수정'></td><td><input type='button' data-num1='"+subject.subjectname+"' data-num2='"+subject.field+"' data-num='"+subject.subject_seq+"' data-num4='"+subject.flag+"' class='btn btn btn-danger' value='삭제'></td>"
		     		outhtml += "</tr>";
		  		
		    	}); 
		    	outhtml += "</center>";
		     	outhtml += "</table>";
		     	$("#output2").html(outhtml); 	
		     	 $('input:button.btn btn-danger').click(deleteOk2);	
		     	 $('input:button.btn btn-success').click(updateOk);	
		     	}
		});
	}
	function xx(){
		$.ajax({
			url : "selectSubject.action",
			type : "post",
			dataType : "json",
			
			success : function(json){
			
				 var outhtml = "";
		
		    	outhtml += "<table  width='700'>";
		    	outhtml += "<center>"
		    	outhtml += "<th>기수</th><th>반</th><th>강의명</th><th>강사</th><th>기간</th>"
		     	 $.each(json.subjectLists, function(index, subject){
		     		
		     		outhtml += "<tr>";
		     		outhtml += 		"<td width='100px'>"+subject.flag+"</div></td>";
		     		outhtml += 		"<td width='100px'>"+subject.class_num+"</div></td>";
			     	
		     		outhtml += 		"<td width='100px'><a href='subjectDetail.action?deleteKey="+subject.subject_seq+"'>"+subject.subjectname+"<a></div></td>";
			     	
		     		outhtml += 		"<td width='100px'>"+subject.id+"</div></td>";
		    
		     		outhtml += 		"<td width='300px'>"+subject.start_date+"~"+subject.end_date+"</div></td>";
			     	
		     		outhtml += "<td><input type='button' class='btn btn-success' data-num4='"+subject.flag+"' data-num1='"+subject.subjectname+"' data-num2='"+subject.field+"' data-num='"+subject.subject_seq+"' value='수정'></td><td><input type='button' data-num1='"+subject.subjectname+"' data-num2='"+subject.field+"' data-num='"+subject.subject_seq+"' data-num4='"+subject.flag+"' class='btn btn-danger' value='삭제'></td>"
		     		outhtml += "</tr>";
		  		
		    	}); 
		    	outhtml += "</center>"
		     	outhtml += "</table>";
		     	$("#output").html(outhtml); 	
		     	 $('input:button.btn btn-danger').click(deleteOk);	
		     	 $('input:button.btn btn-success').click(updateOk);	
		     	}
		});
		
		
		
	}
	
	function zz(){
		
		var flag = $("#flag").val();
		var subject = $("#subject").val();
		var class_num = $("#class_num").val();
		
		var subjectname = $("#subjectname").val();
		var teacher1 = $("#teacher1").val();
		var class_num1='A반';
		var class_num2='B반';
		var teacher2 = $("#teacher2").val();
		var teacher3 = $("#teacher3").val();
		
		var startyear = $("#startyear").val();
		var content = $("#content").val();
		var startyear=$("#startyear").val();
		var startmonth = $("#startmonth").val();
		var startday = $("#startday").val();
		var endyear = $("#endyear").val();
		var endmonth = $("#endmonth").val();
		var endday = $("#endday").val();
		
			$.ajax({
				url : "insertSubject.action",
				type : "post",
				dataType : "json",
				data : {
					
					flag : flag,
					subject : subject,
					class_num : class_num,
					class_num1 : class_num1,
					class_num2 : class_num2,
					subjectname : subjectname,
					teacher1:teacher1,
					teacher2:teacher2,
					teacher3:teacher3,
					content:content,
					startyear : startyear,
					startmonth : startmonth,
					startday : startday,
					endyear : endyear,
					endmonth : endmonth,
					endday : endday

				},
				success : function(json){
				
					 var outhtml = "";
			    
			    	outhtml += "<table  width='700px'>";
			    	outhtml += "<center>"
			    	outhtml += "<th>기수</th><th>반</th><th>강의명</th><th>강사</th><th>기간</th>"
			     	 $.each(json.subjectLists, function(index, subject){
			     		
			     		outhtml += "<tr>";
			     		outhtml += 		"<td width='100px'>"+subject.flag+"</div></td>";
			     		outhtml += 		"<td width='100px'>"+subject.class_num+"</div></td>";
				     	
			     		outhtml += 		"<td width='100px'><a href='subjectDetail.action?deleteKey="+subject.subject_seq+"'>"+subject.subjectname+"</a></div></td>";
				     	
			     		outhtml += 		"<td width='100px'>"+subject.id+"</div></td>";
			     		outhtml += 		"<td width='300px'>"+subject.start_date+"~"+subject.end_date+"</div></td>";
				     	
			     		outhtml += "<td><input type='button' class='btn btn-success' data-num1='"+subject.subjectname+"' data-num2='"+subject.field+"' data-num4='"+subject.flag+"' data-num='"+subject.subject_seq+"' value='수정'></td><td><input type='button' data-num1='"+subject.subjectname+"' data-num2='"+subject.field+"' data-num4='"+subject.flag+"' data-num='"+subject.subject_seq+"' class='btn btn-danger' value='삭제'></td>"
			     		outhtml += "</tr>";
			     		
			     	 }); 
			    	outhtml += "</center>"
			     	outhtml += "</table>";
			     	$("#output").html(outhtml); 
			     	 $('input:button.btn btn-danger').click(deleteOk);	
			     	 $('input:button.btn btn-success').click(updateOk);	
			     	 hh();
			     	 oo();
			     
			     	
			     	
			     	}
			});
		
		
	}
	
	function uu(){
		var flag = $("#flag").val();
		
		var subject=$("#subject").val();
		if(subject=='강의선택'){
			
		}else if(subject=='IT'){
		 	$("#subject").change(ii);
		 	$("#king").show();
		 		$.ajax({
				url: 'teacherLists.action',
				type: 'POST',
				dataType: 'json',
				data:{
					subject:subject,
					flag:flag
				},
				success: cc
			});
		}else if(subject=='일본어'){
			$("#subject").change(pp);
			$("#teacher3").show();
 			$("#show").show();
			
			$.ajax({
				url: 'selectSubject1.action',
				type: 'POST',
				dataType: 'json',
				data:{
					subject:subject
				},
				success: aa
			});
		}
		}

	$("#subject").change(uu)
		
	function dd(){
		
	}
	
	function aa(json){
		
		 var outhtml = "";
		 outhtml+="<div id='show'>&nbsp;&nbsp;반&nbsp;&nbsp;<select id='class_num' name='class_num' class='form-control'>";
			$.each(json.selLists, function(index, str){
			
				outhtml += "<option value="+str+">"+str+"</option>";
			
			});
		outhtml+="</select>";
		 outhtml+="&nbsp;&nbsp;강사명&nbsp;&nbsp;<select id='teacher3' name='teacher3' class='form-control' style='width:120px'>";
			$.each(json.teacherLists, function(index, teacher){
			
				outhtml += "<option value="+teacher.id+">"+teacher.name+"</option>";
			
			});
		outhtml+="</select></div>";
		
		$("#fuck").html(outhtml);	
		
		
	}
	
	function cc(json){
		 var outhtml = "";
		 outhtml+="A반&nbsp;&nbsp;<select id='teacher1' name='teacher1' class='form-control' style='width:120px'>";
		 outhtml+="<option>강사선택</option>";
			$.each(json.teacherLists, function(index, teacher){
			
				outhtml += "<option value="+teacher.id+">"+teacher.name+"</option>";
			
			});
		outhtml+="</select>";
		
	
		
		$("#king").html(outhtml);	
		$("#teacher1").change(dd);
		
	}
	function deleteOk1(){

		f
		var deleteKey = $(this).attr('data-num');
		var deleteKey1 = $(this).attr('data-num1');
		var deleteKey2 = $(this).attr('data-num2');
		var deleteKey3 = $(this).attr('data-num4');
		$.ajax({
			url: 'subjectDelete.action',
			type: 'POST',
			dataType: 'json',
			data: {
				deleteKey : deleteKey,
				deleteKey1:deleteKey1,
				deleteKey2:deleteKey2,
				deleteKey3:deleteKey3
			},
			success: hh
		});
	}
	function deleteOk2(){

		
		var deleteKey = $(this).attr('data-num');
		var deleteKey1 = $(this).attr('data-num1');
		var deleteKey2 = $(this).attr('data-num2');
		var deleteKey3 = $(this).attr('data-num4');
		$.ajax({
			url: 'subjectDelete.action',
			type: 'POST',
			dataType: 'json',
			data: {
				deleteKey : deleteKey,
				deleteKey1:deleteKey1,
				deleteKey2:deleteKey2,
				deleteKey3:deleteKey3
			},
			success: oo
		});
	}
	function updateOk(){
		var deleteKey = $(this).attr('data-num');
		
		var deleteKey1 = $(this).attr('data-num2');

		var deleteKey2 = $(this).attr('data-num1');

		var deleteKey3 = $(this).attr('data-num4');

		if(deleteKey1=='일본어'){
			window.open("updateForm.action?deleteKey="+deleteKey," updateWindow", "top=80,left=800,width=950,height=100","resizable=no");
		}else{
			window.open("updateForm1.action?deleteKey="+deleteKey+"&deleteKey2="+deleteKey2+"&deleteKey3="+deleteKey3,"updateWindow1", "top=80,left=800,width=950,height=100","resizable=no");
		}
		
		
		
	}
	function dd(){
		var teacher1=$("#teacher1").val();
		
		$.ajax({
			url: 'selectTeacherLists2.action',
			type: 'POST',
			dataType: 'json',
			data: {
				teacher1:teacher1
				
			},
			success: ee
		});
	}
	function ee(json){
		
		
		 var outhtml = "";
		 
		outhtml+="B반&nbsp;&nbsp;<select id='teacher2' name='teacher2' class='form-control' style='width:120px'>";
		outhtml+="<option>강사선택</option>";
		$.each(json.teacherLists, function(index, teacher){
			
			outhtml += "<option value="+teacher.id+">"+teacher.name+"</option>";
		
		});
	outhtml+="</select>";
		
		$("#kong").html(outhtml);	
		$("#teacher1").change(dd);
		
		
	}
	

	
	
	
	function hh(){
		$.ajax({
			url : "selectIt.action",
			type : "post",
			dataType : "json",
			
			success : function(json){
				
				 var outhtml = "";
		
		    	outhtml += "<table  width='700'>";
		    	outhtml += "<center>"
		    	outhtml += "<th>기수</th><th>반</th><th>강의명</th><th>강사</th><th>기간</th>"
		     	 $.each(json.subjectLists, function(index, subject){
		     		
		     		outhtml += "<tr>";
		     		outhtml += 		"<td width='100px'>"+subject.flag+"</div></td>";
		     		outhtml += 		"<td width='100px'>"+subject.class_num+"</div></td>";
			     	
		     		outhtml += 		"<td width='100px'><a href='subjectDetail.action?deleteKey="+subject.subject_seq+"'>"+subject.subjectname+"<a></div></td>";
			     	
		     		outhtml += 		"<td width='100px'>"+subject.id+"</div></td>";
		    
		     		outhtml += 		"<td width='300px'>"+subject.start_date+"~"+subject.end_date+"</div></td>";
			     	
		     		outhtml += "<td><input type='button' class='btn btn-success' data-num4='"+subject.flag+"' data-num1='"+subject.subjectname+"' data-num2='"+subject.field+"' data-num='"+subject.subject_seq+"' value='수정'></td><td><input type='button' data-num1='"+subject.subjectname+"' data-num2='"+subject.field+"' data-num='"+subject.subject_seq+"' data-num4='"+subject.flag+"' class='btn btn-danger' value='삭제'></td>"
		     		outhtml += "</tr>";
		  		
		    	}); 
		    	outhtml += "</center>"
		     	outhtml += "</table>";
		     	$("#view2").html(outhtml); 	
		     	 $('input:button.btn btn-danger').click(deleteOk1);	
		     	 $('input:button.btn btn-success').click(updateOk);	
		     	}
		});
		
	}
	function deleteOk(){

		
		var deleteKey = $(this).attr('data-num');
		var deleteKey1 = $(this).attr('data-num1');
		var deleteKey2 = $(this).attr('data-num2');
		var deleteKey3 = $(this).attr('data-num4');
		
		$.ajax({
			url: 'subjectDelete.action',
			type: 'POST',
			dataType: 'json',
			data: {
				deleteKey : deleteKey,
				deleteKey1:deleteKey1,
				deleteKey2:deleteKey2,
				deleteKey3:deleteKey3
			},
			success: reOutput
		});
	}
	function reOutput(json){
		
		var outhtml = "";
	    
    	outhtml += "<table  width='700px'>";
    	outhtml += "<center>"
    	outhtml += "<th>기수</th><th>반</th><th>강의명</th><th>강사</th><th>기간</th>"
     	 $.each(json.subjectLists, function(index, subject){
     		
     		outhtml += "<tr>";
     		outhtml += 		"<td width='100px'>"+subject.flag+"</div></td>";
     		outhtml += 		"<td width='100px'>"+subject.class_num+"</div></td>";
	     	
     		outhtml += 		"<td width='100px'><a href='subjectDetail.action?deleteKey="+subject.subject_seq+"'>"+subject.subjectname+"<a></div></td>";
	     	
     		outhtml += 		"<td width='100px'>"+subject.id+"</div></td>";
     		outhtml += 		"<td width='300px'>"+subject.start_date+"~"+subject.end_date+"</div></td>";
	     	
     		outhtml += "<td><input type='button' class='btn btn-success' data-num4='"+subject.flag+"' data-num1='"+subject.subjectname+"'  data-num2='"+subject.field+"' data-num='"+subject.subject_seq+"' value='수정'></td><td><input type='button' data-num1='"+subject.subjectname+"' data-num4='"+subject.flag+"' data-num2='"+subject.field+"' data-num='"+subject.subject_seq+"' class='btn btn-danger' value='삭제'></td>"
     		outhtml += "</tr>";
     		
     	 }); 
    	outhtml += "</center>"
     	outhtml += "</table>";
     	$("#output").html(outhtml); 
     	 $('input:button.btn btn-danger').click(deleteOk);	
     	 $('input:button.btn btn-success').click(updateOk);	
     
     	
     	
     }
	function ii(){
		var subject=$("#subject").val();
 		if(subject=='일본어'){
 			
 			$("#king").hide();
 			$("#teacher3").show();
 			$("#show").show();
 			$("#subject").change(uu);
 			
 		}
	}
	function pp(){
		
	 		var subject=$("#subject").val();
	 		if(subject=='IT'){
	 			
	 			$("#teacher3").hide();
	 			$("#show").hide();
	 			$("#king").show();
	 			$("#subject").change(uu);
	 		}
	 		
	 	
	}
	
	
</script>

</head>

<body>
	<div class="container">

	<!------------- 로그인, 회원가입, 마이페이지, 로그아웃관련 부분  시작------------------------ -->
		<s:if test="%{#session.userSign.id!=null}">
				<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
					
		    		<span style="position:relative; left:70%; padding:5px;">
		    		<b>반갑습니다&nbsp;${sessionScope.userSign.id}님&nbsp;</b><!--updated-->
		    		<a href='<s:url value="/member/mypage_details.action"></s:url>' class="btn btn-info btn-sm">마이페이지</a>
		    		&nbsp;
		    		&nbsp;
		    		<a href="<s:url value="/member/logout.action"></s:url>" class="btn btn btn-danger btn-sm ">로그아웃</a>
		    		</span>
	    		 </div>
		</s:if>
		<s:else>
				<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
			    	<span style="position:relative; left:80%; padding:5px;">
			    		<a href="<s:url value='/member/memberJoinForm.action'></s:url>" class="btn btn-success btn-sm">회원가입</a>
			    		&nbsp;
			    		&nbsp;
			    		<a href="<s:url value='/member/loginForm.action'></s:url>" class="btn btn-primary btn-sm ">로그인</a>
			    	</span>
	    		 </div>
		</s:else>
		 <!------------- /로그인, 회원가입, 마이페이지, 로그아웃관련 부분 끝------------------------- -->

    <!-- row 1: header -->
    <header class="row">
    	<div class="col-lg-4 col-sm-5">
        	<a href="../index.action"><img src="../images/KUpEzwG.gif" alt="Wisdom Pets. click for home." class="img-responsive" style="height:200px;"></a>
        </div>
    	<div class="col-lg-8 col-sm-7">
        	<img src="../images/logo.gif" alt="" class="hidden-xs img-responsive">
        </div>
    </header>




	<!-- row 1: navigation -->
    <div class="row">
    	<nav class="navbar navbar-default navbar-inverse nav-justified">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#collapse">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
    				<span class="icon-bar"></span>
    				<span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="collapse">
                <ul class="nav navbar-nav">
                    <li><a href="../index.action">홈</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li class="dropdown"><a href="#" data-toggle="dropdown">학사관리<span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                    		<s:if test="%{#session.userSign.type==0}">
                        		<li><a href="../member/memberManagement.action">회원관리</a></li>
                        	</s:if>
                            <li><a href="../attendance/goAttendanceList.action">출석관리</a></li>
                            <s:if test="%{#session.userSign.type==0 || #session.userSign.type== 1}">
                            	<li><a href="../test/testItUi.action">시험관리</a></li>
                            </s:if>
                            <li><a href="../member/myScoreViewForm.action">성적조회</a></li>
                            <li><a href="../trouble/troubleList.action">상담관리</a></li>
                        </ul>                    
                    </li>
                    
                    <li class="dropdown"><a href="#" data-toggle="dropdown">학습관리 <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                        	<li><a href="../subject/subjectManager.action">강의관리</a></li>
                            <li><a href="../subject/subjectView.action">강의목록</a></li>
                            <li><a href="../schedule/goScheduleForm.action">일정관리</a></li>
                        </ul>                    
                    </li>
                    
                     
                    <li><a href="../bbs/bbsList.action">커뮤니티</a></li>
                    <li><a href="#">사이트 정보</a></li>
                </ul> 
            </div>
         </nav> 
    </div>
    
   




		<!-- row 3: article/aside -->
		<div class="row">
			<article
				class="thumbnail col-lg-9 col-sm-8 col-lg-push-3 col-sm-push-4">

			<ol class="breadcrumb">
				<li><a href="#">학습관리</a> <span
					class="glyphicon glyphicon-circle-arrow-right"></span></li>
				<li><a href="#">강의관리</a> <span
					class="glyphicon glyphicon-circle-arrow-right"></span></li>
				<li class="active">강의관리</li>
			</ol>
			<div class="clearfix visible-xs visible-lg"></div>
			<div>
				<!-- 강의를 등록하자 -->
				<form class="form-inline" role="form">
				<div style="float:left;">
						<div class='form-group'>
					<select id="flag" name="flag" class='form-control'  style="width:120px">
						<option>기수선택</option>
						<s:iterator value="flagLists">
						<option><s:property value="flag_num"/></option>
						</s:iterator>
						
					</select>&nbsp;기&nbsp;
					</div>
						<div class='form-group'>
			과목&nbsp;&nbsp;<select id="subject" name="subject" class='form-control'  style="width:120px">
						<option>강의선택</option>
						<option>IT</option>
						<option>일본어</option>
						
					</select>
					</div>
				
					</div>
					
					<div id="fuck" style="float: left;">
					
					
					</div>
					
					</form>
					<br>
					<br>



		강의명&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="subjectname" name="subjectname" class="form-control" style="width: 200px">&nbsp;&nbsp;&nbsp;&nbsp;
			
			<div id="king" style="float: center;">
			</div>
			<div id="kong" style="float: center;">
			</div>
			
		
		&nbsp;&nbsp;&nbsp;&nbsp;
		
					
					<form class="form-inline" role="form">
							<div class='form-group'>
							시작 기간
								<select id="startyear" name="startyear" class='form-control'  style="width:90px">
										<s:iterator var="i" begin="2014" end="2000" step="-1">
											<option><s:property value="#i" />
										</s:iterator>
								</select>년 
							</div>
							<div class='form-group'>
								<select id="startmonth" name="startmonth" class='form-control'  style="width:70px">
										<s:iterator var="i" begin="1" end="12">
											<option><s:property value="#i" />
										</s:iterator>
								</select>월 
							</div>
							<div class='form-group'>
								<select id="startday" name="startday" class='form-control' style="width:70px">
										<s:iterator var="i" begin="1" end="31">
											<option><s:property value="#i" />
										</s:iterator>
								</select>일
							</div>
						</form>
						<form class="form-inline" role="form">
							종료 기간
							<div class='form-group'>
							<select id="endyear" name="endyear" class='form-control' style="width:90px">
									<s:iterator var="c" begin="2014" end="2000" step="-1">
										<option><s:property value="#c" />
									</s:iterator>
							</select>년
							</div> 
							<div class='form-group'>
							<select id="endmonth" name="endmonth" class='form-control' style="width:70px">
									<s:iterator var="c" begin="1" end="12">
										<option><s:property value="#c" />
									</s:iterator>
							</select>월 
							</div>
							<div class='form-group'>
							<select id="endday" name="endday" class='form-control' style="width:70px">
									<s:iterator var="c" begin="1" end="31">
										<option><s:property value="#c" />
									</s:iterator>
							</select>일
							</div>
							</form>
							
						
						강의설명
						<s:textarea name="content" id="content" cols="30"/>
						<input type="button" class="btn btn-prmimary" id="insert_btn" value="강의등록">
						


				
				
			</div>
			<br>
		
        
       
        <ul id="tabs1" class="mctabs">
        
            <li><a href="#view1">전체강의</a></li>
            <li><a href="#view2">IT</a></li>
            <li><a href="#view3">일본어</a></li>
           
        </ul>
        <div class="panel-container">
            <div id="view1">               
                <div id="output">
                </div>
                    
                    
                
            </div>
            <div id="view2">
             	<div id="output1">
             	</div>
            </div>
            <div id="view3">
            	<div id="output2">
             	</div>
            
            </div>
        
    </div>
        
			</article>

			<aside class="col-lg-3 col-sm-4 col-lg-pull-9 col-sm-pull-8 ">
			<div class="thumbnail">
				<h3>학습관리</h3>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="../subject/subjectManager.action">강의관리</a></li>
					<li><a href="../subject/subjectView.action">강의목록</a></li>
					<li><a href="../member/memberManagement.action">일정관리</a></li>
				</ul>
			</div>
			</aside>
		</div>
		<!-- row 4 -->
		<footer class="row">
		<p>
			<small>본 웹사이트는 SC마스터 학생들을 지원하기 위해 테스트중이며 현재 어떠한 경제적 지원도 받고 있지
				않습니다.</small>
		</p>
		<p>
			<small> Produced by Young-Bo Lee, team 3 Leader. all right
				reserved.</small>
		</p>
		</footer>

	</div>
	<!-- end container -->

	<!-- javascript -->
	<!-- 	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
		$('a.btn-info').tooltip()
			$('#slider').anythingSlider();
	</script> -->

	<!-- <form id="aaa" action="aaa" method="post">
		<input type="text" name="a"> <input type="text" name="a">
		<input type="submit" value="넘겨">
	</form>
 -->

</body>
</html>
