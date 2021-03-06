<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>3조 프로젝트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/custom.css" rel="stylesheet">
    <link href="../jquery-plugin/anythingSlider/anythingslider.css" rel="stylesheet">
    <script src="../js/respond.js"></script>
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../jquery-plugin/anythingSlider/jquery.anythingslider.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  
		
    <script type="text/javascript">
    $(document).ready(function() {
    	$('a.btn-info').tooltip();
		$('#slider').anythingSlider({
			buildArrows : false,
			autoPlay : true,
			buildStartStop : true
			
		});
		//처음에 페이지가 로딩되었을때 실행할 함수
		getDate();
		// 페이지가 로딩되면 바로 이름 목록 가져온다.
		changeCombo();
		
		$("#class_num").change(changeCombo);	
		$("#flag").change(changeCombo);
		$("#year").change(changeCombo);
		$("#month").change(changeCombo);
		$("#day").change(changeCombo);
		
    }); // end ready
  
    function changeCombo(){
		var flag = $("#flag").val();
		var class_num = $("#class_num").val();
		var year = $("#year").val();
		var month = $("#month").val();
		var day = $("#day").val();
		$.ajax({
			url : 'getNameList.action',
			type : 'post',
			dataType : 'json',
			data : { flag : flag 
					,class_num : class_num
					,year : year
					,month : month
					,day : day
					},
			success : output
		});
    }

    function output(json){
    	var outhtml = "";
    	outhtml += "<table  width='300px'>";
     	$.each(json.studentList, function(index, student){
     		outhtml += "<tr>";
     		outhtml += 		"<td width='100px'><div id = 'name"+index+"' value="+student.name+">"+student.name+"</div></td>";
     		outhtml += 		"<td><input type = 'radio' name="+index+" id="+student.name+"출석 value = '1' checked='checked'>출석 "; 
     		outhtml += 		    "<input type = 'radio' name="+index+" id="+student.name+"지각 value = '2' >지각 ";
     		outhtml += 			"<input type = 'radio' name="+index+" id="+student.name+"결석 value = '3' >결석</td>";
     		outhtml += "</tr>";
  		
    	});
     	outhtml += "</table>";
     	
     	if(json.attendanceList==""){
     		outhtml += "<input type = 'button' class='btn btn-success' value = '출석' id = 'btn_submit'>";	
     	}else{
     		outhtml += "<input type = 'button' class='btn btn-danger' value = '수정' id = 'btn_update'>";	
     	}
     	
    	$("#output").html(outhtml);
   		
    	$.each(json.attendanceList, function(index, attendance){
    		if(json.attendanceList!=null){
	    		var value = attendance.attendance_check;
	    		if(value==1){
	    			$("#"+attendance.name+"출석").attr("checked","checked");	
	    		}else if(value == 2){
	    			$("#"+attendance.name+"지각").attr("checked","checked");
	    		}else{
	    			$("#"+attendance.name+"결석").attr("checked","checked");
	    		}
    		}
    	});
    	// 출석 일괄처리를 위한 엑션
    	$("#btn_submit").click(function(){
    		var flag = $("#flag").val();
			var class_num = $("#class_num").val();
			var year = $("#year").val();
			var month = $("#month").val() < 10 ? "0"+$("#month").val()  : $("#month").val() ;
			var day = $("#day").val() < 10 ? "0"+ $("#day").val() :  $("#day").val();
			
			//alert(month);
			//alert(day);
    		var inputdate = $("#year").val()+month+day;
    		var attendanceinfo = "";
    		$.each(json.studentList, function(index, student){
    			
    			
    			var id = student.id;
    			//출석 여부 변수 check;
        		var check=0;
        		
        		var checkarr = document.getElementsByName(index);
        		for (var i=0; i<checkarr.length; i++) {
        	        if ( checkarr[i].checked ) { 
        	            check = checkarr[i].value; 
        	            break; 
        	        }
        	    }
        		attendanceinfo += id+"/"+$("#name"+index).attr('value')+"/"+inputdate+"/"+check+",";
    		});
    		
    		//alert(attendanceinfo);
    		
    		$.ajax({
				url : 'insertAttendance.action',
				type : 'post',
				dataType : 'json',
				data : {flag : flag , class_num : class_num , attendanceinfo : attendanceinfo},
				success : function(json){
			    	alert("일괄등록 완료!");		
			    	alert(flag);
			    	alert(class_num);
			    	location.href="goAttendanceList.action?flag="+flag+"&class_num="+class_num+"&year="+year+"&month="+month;
			    }
			});
    	});
    	
    	$("#btn_update").click(function(){
	    	var flag = $("#flag").val();
			var class_num = $("#class_num").val();
			var year = $("#year").val();
			var month = $("#month").val() < 10 ? "0"+$("#month").val()  : $("#month").val() ;
			var day = $("#day").val() < 10 ? "0"+ $("#day").val() :  $("#day").val();
			//alert(month);
			//alert(day);
			var inputdate = $("#year").val()+month+day;
			var attendanceinfo = "";
			$.each(json.studentList, function(index, student){
				var id = student.id;
				//출석 여부 변수 check;
	    		var check=0;
	    		
	    		var checkarr = document.getElementsByName(index);
	    		for (var i=0; i<checkarr.length; i++) {
	    	        if ( checkarr[i].checked ) { 
	    	            check = checkarr[i].value; 
	    	            break; 
	    	        }
	    	    }
	    		attendanceinfo += id+"/"+$("#name"+index).attr('value')+"/"+inputdate+"/"+check+",";
			});
			$.ajax({
				url : 'updateAttendance.action',
				type : 'post',
				dataType : 'json',
				data : {flag : flag , class_num : class_num , attendanceinfo : attendanceinfo},
				success : function(json){
					alert('일괄수정 완료!');
					location.href="goAttendanceList.action?flag="+flag+"&class_num="+class_num+"&year="+year+"&month="+month;
				}	
			});
    	});
    }
    
    function getDate(){
    	
    	var date = new Date();
    	var year = date.getFullYear();
    	var month = date.getMonth()+1;
    	var day =  date.getDate();
    	$("#year").val(year);
    	$("#month").val(month);
    	$("#day").val(day);
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
		    		<a href="<s:url value="/member/logout.action"></s:url>" class="btn btn-danger btn-sm ">로그아웃</a>
		    		</span>
	    		 </div>
		</s:if>
		<s:else>
				<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
			    	<span style="position:relative; left:80%; padding:5px;">
			    		<a href="member/memberJoinForm.action" class="btn btn-success btn-sm">회원가입</a>
			    		&nbsp;
			    		&nbsp;
			    		<a href="member/loginForm.action" class="btn btn-primary btn-sm ">로그인</a>
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
                            <li><a href="../test/testItUi.action">시험관리</a></li>
                            <li><a href="../member/myScoreViewForm.action">성적조회</a></li>
                            <li><a href="../trouble/troubleList.action">상담관리</a></li>
                        </ul>                    
                    </li>
                    
                    <li class="dropdown"><a href="#" data-toggle="dropdown">학습관리 <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                    	 	<s:if test="#session.userSign.type == 0">
                        	<li><a href="../subject/subjectManager.action">강의관리</a></li>
                        	</s:if>
                            <li><a href="#">강의목록</a></li>
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
    	<article class="thumbnail col-lg-9 col-sm-8 col-lg-push-3 col-sm-push-4">
        
            <ol class="breadcrumb">
              <li><a href="#">학사관리</a> <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li><a href="#">출석관리</a> <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li class="active">출석체크</li>
            </ol>
         <div class="clearfix visible-xs visible-lg"></div>
         <div><!-- 출석부를 뿌리자 -->
         <form class="form-inline" role="form">
         	<div class="form-group">
	       		<select id="flag" class="form-control" style="width:70px">
	       			<option>27
	       			<option>28
	       		</select>기&nbsp;&nbsp;
       		</div>
       		<div class="form-group">
	       		<select id="class_num" class="form-control" style="width:80px">
	       			<option>A반
	       			<option>B반
	       			<option>C반
	       		</select>&nbsp;&nbsp;
	       	</div>
	       	<div class="form-group">
	       		<select id = "year" class="form-control" style="width:90px">
	       			<s:iterator var="i" begin="2014" end="2000" step="-1">
	       				<option>${i}
	       			</s:iterator>
	       		</select>년&nbsp;&nbsp;
       		</div>
       		<div class="form-group">
	       		<select id = "month" class="form-control" style="width:70px">
	       			<s:iterator var="i" begin="1" end="12">
	       				<option>${i}
	       			</s:iterator>
	       		</select>월
       		</div>
       		<div class="form-group">
	       		<select id = "day" class="form-control" style="width:70px">
	       			<s:iterator var="i" begin="1" end="31">
	       				<option>${i}</option>
	       			</s:iterator>
	       		</select>일 &nbsp;&nbsp;
	       	</div>
	      </form>
       		<!-- <input type = "button" value = "확인" id = "button"> -->
       		<!-- 년 월 선택했을시 해당 월의 출석부를 표로 보여준다. ajax 를 사용한다.  -->
       		<br>
	       		<div id = "output">
	       			

	       		</div>
       		
       </div>
        </article>
        
        <aside class="col-lg-3 col-sm-4 col-lg-pull-9 col-sm-pull-8 ">
       		<div class="thumbnail">
       			<h3>학사관리</h3>
	            <ul class="nav nav-pills nav-stacked">
	             <s:if test="%{#session.userSign.type==0}">
	                <li><a href="../member/memberManagement.action">회원관리</a></li>
	                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view1">- 회원승인</a><br>
	                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view2">- 선생님</a><br>
	                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view3">- 학생</a><br>
	             </s:if>
	                <li class="active"><a href="../attendance/goAttendanceList.action">출석관리</a></li>
	                	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="goAttendanceCheck.action">- 출석체크</a>
	                <li><a href="../test/testItUi.action">시험관리</a></li>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/testItUi.action">- IT과목별시험</a><br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/itCapacity.action">- IT역량평가</a><br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/japDaily.action">- 일본어매일시험</a><br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/japMonth.action">- 일본어월말시험</a><br>
	                <li><a href="../member/myScoreViewForm.action">성적조회</a></li>
	                <li><a href="../trouble/troubleList.action">상담관리</a></li>
	            </ul> 
       		</div>
        </aside>
       </div>   
    <!-- row 4 -->
    <footer class="row">
         <p><small>본 웹사이트는 SC마스터 학생들을 지원하기 위해 테스트중이며 현재 어떠한 경제적 지원도 받고 있지 않습니다.</small></p>
         <p><small> Produced by Young-Bo Lee, team 3 Leader.  all right reserved.</small></p>
    </footer>

</div> <!-- end container -->

<!-- javascript -->
<!-- 	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
		$('a.btn-info').tooltip()
			$('#slider').anythingSlider();
	</script> -->
	
</body>
</html>
