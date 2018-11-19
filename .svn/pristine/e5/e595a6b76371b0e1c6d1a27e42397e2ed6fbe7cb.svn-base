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
    <link href="../jquery-plugin/mctabs/generic-notForMcTabs.css" rel="stylesheet" type="text/css" />
    <link href="../jquery-plugin/mctabs/template2/mctabs.css" rel="stylesheet" type="text/css" />
    
    <script src="../js/respond.js"></script>
    <script src="../js/jquery-1.7.2.min.js"></script>
     
     <script src="../jquery-plugin/mctabs/javascript-tabs.js" type="text/javascript"></script>
     
    <script src="../jquery-plugin/anythingSlider/jquery.anythingslider.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  
	<link rel='stylesheet' type="text/css" href='../jquery-plugin/fullcalendar-2.1.1/fullcalendar.css' />
	<!--<script src='../jquery-plugin/fullcalendar-2.1.1/lib/jquery.min.js'></script>-->
	<script src='../jquery-plugin/fullcalendar-2.1.1/lib/moment.min.js'></script>
	<script src='../jquery-plugin/fullcalendar-2.1.1/fullcalendar.js'></script>
	<script src='../jquery-plugin/fullcalendar-2.1.1/lang/ko.js'></script>
	
	<link rel='stylesheet' type="text/css" href='../jquery-plugin/jquery.qtip.custom/jquery.qtip.min.css' />
	<script src="../jquery-plugin/jquery.qtip.custom/jquery.qtip.min.js"></script>
	<script src="../jquery-plugin/jquery.qtip.custom/jquery.qtip.min.map"></script>
	
	<script type="text/javascript">
	
	var nowStats = 'defult';
	$(document).ready(function() {
		//	처음 페이지에 들어왔을때 인자값을 27기로 받아  ajax를 이용하여 스케쥴 테이블에서 
		//	27기에 해당하는 모든 레코드의 과목명(현재 content 컬럼으로 되어있음.), 시작날짜, 종료날짜를 가져온다.

		//삭제버튼은 스케쥴 선택시에만 디스플레이 한다. 처음에 숨겨준다.
		$("#btn-danger").css('display','none');
		
		
		$('#calendar').fullCalendar({
			lang: 'ko',
			header: {
				left: 'prev,next',
				center: 'title',
				right: 'today'
			},
			eventMouseover: function(calEvent, jsEvent, view) {
                savBg = $(this).css("background-color");
                savClr = $(this).css("color");
                $(this).css( { color:'#ffff00', backgroundColor:"#006" } );
                $("#test").css( { color:'#ffff00', backgroundColor:"#006" } );
	                $(this).fadeTo('slow',.5);//.css(text-align,'right');
	        },
	  		eventMouseout: function(calEvent, jsEvent, view) {
	                $(this).css( { color:savClr, backgroundColor:savBg } );
	                $("#test").css( { color:savClr, backgroundColor:savBg } );
	                $(this).fadeTo('slow',1);
	        },
			
			// 튤팁 기능으로 세부사항을 볼수 있다.
			eventRender: function(event, element) {
				if(event.content==null){
					return;
				}
                element.qtip({
                 	content : event.content,
                  	position:{
                	   my:'bottom left',
                	   at:'top center'
                  	},
               		show: {
                    	effect: function() {
                        $(this).fadeTo(500, 1);
                   		}
               		},
					hide: {
                    	effect: function() {
                        $(this).slideUp();
                   		}
					},
             		 style: { 
             			classes: 'qtip-blue',
             			width:150,
             			height:80,
					} 
                });
			},
			
			eventClick: function(calEvent, jsEvent, view) {
				
				var startdate = (new Date(calEvent.start)).toISOString().slice(0, 10);
				var enddate = (new Date(calEvent.end)).toISOString().slice(0, 10);
				var title = calEvent.title;
				var content = calEvent.content;
				var schedule_seq = calEvent.sequence;
				
				$("#startdate").val(startdate);
				$("#enddate").val(enddate);
		        $("#title").val(title);
		        $("#content").val(content);
		        if(content!=null){
		        	
		        	
		        	$("#btn-danger").attr("onclick","javascript:deleteSchedule("+schedule_seq+")");
		        	
		        	$(".btn-success").attr("onclick","javascript:updateSchedule("+schedule_seq+")");
		        	$('#btn-success').text('수정');
		        	
		        	$('#btn-success').attr('disabled', false);
		        	$("#btn-danger").css('display', 'inline');
		        	
		        	// 내용이 있다면 수정할수 있는것이므로 다시 리드온리 풀어줘야함..
		        	$("#startdate").attr('readonly', false);
					$("#enddate").attr('readonly', false);
					$("#title").attr('readonly',false);
					$("#content").attr('readonly',false);
		        	
		        	
		        }else{
		        	$('#btn-success').text('등록');
		        	$(".btn-success").attr("onclick","javascript:insertSchedule()");
		        	$('#btn-success').attr('disabled', 'disabled');
		        	$("#btn-danger").css('display', 'none');
		        	
		        	// 수정할수 없도록 해준다.
		        	$("#startdate").attr('readonly','readonly');
					$("#enddate").attr('readonly','readonly');
					$("#title").attr('readonly','readonly');
					$("#content").attr('readonly','readonly');
		        	
		        }
		        
		        // change the border color just for fun
		        $(this).css('border-color', 'red');

		    },
			//eventLimit: true, // allow "more" link when too many events
	        events : getSubjectAndTestList 
	        
	        ,dayClick: function(date, jsEvent, view) {
	        	if(nowStats=='start'){
	        		$("#startdate").val(date.format());	
	        	}else if(nowStats=='end'){
	        		$("#enddate").val(date.format());	
	        	}else{
	        		$("#startdate").val('');
					$("#enddate").val('');
			        $("#title").val('');
			        $("#content").val('');
			        
			        $("#startdate").attr('readonly', false);
					$("#enddate").attr('readonly', false);
					$("#title").attr('readonly',false);
					$("#content").attr('readonly',false);
					
					$('#btn-success').text('등록');
		        	$(".btn-success").attr("onclick","javascript:insertSchedule()");
					$('#btn-success').attr('disabled', false);
		        	$("#btn-danger").css('display', 'none');
	        	}
	        }
	    }); // end $('#calendar').fullCalendar
	});
	// 업데이트를 위한 펑션으로 파라미터를 받아서 실행한다.
	function updateSchedule(schedule_seq){
		var flag = 28;
		var startdate = $("#startdate").val();
		var enddate = $("#enddate").val();
		var title = $("#title").val();
		var content = $("#content").val();
		if(startdate==""||enddate==""||title==""||content==""){
			alert('모든 항목을 입력하세요');
			return false;
		}else if(startdate>enddate){
			alert('시작&종료 날짜를 확인해주세요.');
			return false;
		}
		//alert(schedule_seq);
		$.ajax({
			url : "updateSchedule.action",
			type : "post",
			dataType : "json",
			data : {flag : flag,
					schedule_seq : schedule_seq,
					startdate : startdate,
					enddate : enddate,
					title : title,
					content : content},
			success : function(){
				$('#calendar').fullCalendar('refetchEvents');
				$("#startdate").val("");
				$("#enddate").val("");
				$("#title").val("");
				$("#content").val("");
			}	
		});
	}
	
	
	
	// ready 펑션을 실행하면서 켈린더에 넣어줄 목록을 불러온다.  ready에서 실행됨
	function getSubjectAndTestList(start, end, timezone, callback){
		
    	$.ajax({
			url : 'getSubjectAndTestAndScheduleList.action',
			type : 'post',
			dataType : 'json',
			data : { flag : 28 }, // 달력을 27기 28기 따로 만들기 때문에 flag 변수는 고정.
			success : function(json){
				var events = [];
				// 기수별 과목 리스트를 가져온다.
				$.each(json.subjectList, function(index, subject){
					events.push({
    					title : subject.subjectname,
    					start : subject.start_date,
    					end   : subject.end_date,
    					color: '#00FFCC',
    					textColor: 'black'
    				});
				});// end each
				// 기수별 시험 리스트를 가져온다.
				$.each(json.testList, function(index, test){
					events.push({
						//지금 여기서 날짜가 널이들어가고 있음..!!! 엑션에서 널이넘어옴
						//엑션 검사할것!@
    					title : test.testname,
    					start : test.startdate,
    					end   : test.enddate,
    					color: 'green'
    				});
				});// end each
				$.each(json.scheduleList, function(index, schedule){
					 events.push({
						//지금 여기서 날짜가 널이들어가고 있음..!!! 엑션에서 널이넘어옴
						//엑션 검사할것!@
						
    					title : schedule.title,
    					start : schedule.start_date,
    					end   : schedule.end_date,
    					content : schedule.content,
    					sequence : schedule.schedule_seq,
    					color: 'blue'
    				});
				});// end each
				
				callback(events);
				
			} // end success : function(json)
		});	// end ajax
	}

	// 현재 선택된 텍스트 필드가 시작날짜인지 종료날짜인지 확인
	function changeStats(stats){
		if(stats=='start'){
			//alert('시작날짜를 선택하세요');
			nowStats = stats;
		}else if(stats=='end'){
			//alert('종료날짜를 선택하세요');
			nowStats = stats;
		}
	}
	// 선택이 끝났을때 다시 디폴트 값으로 준다.
	function defaultStats(stats){
		nowStats = stats;
	}
	function startdateCheck(){
		alert('달력을 클릭하여 입력하세요');
		$("#startdate").val("");
	}
	function enddateCheck(){
		alert('달력을 클릭하여 입력하세요');
		$("#enddate").val("");
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
                    		<s:if test="%{#session.userSign.type==0}">
                        		<li><a href="../subject/subjectManager.action">강의관리</a></li>
                        	</s:if>
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
    	<article class="thumbnail col-lg-9 col-sm-8 col-lg-push-3 col-sm-push-4">
        
            <ol class="breadcrumb">
              <li>홈 <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>학습관리 <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>일정관리 <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
               <li class="active"><a href="../schedule/goScheduleForm28.action">28기</a></li>
            </ol>
         <div class="clearfix visible-xs visible-lg"></div>
         <div>
         <!-- 달력를 뿌리자 -->
       		<!-- 여기가 달력 아이디를 가진 디브  -->
	       		<div id = "calendar"></div>
       </div>
        </article>
        
        <aside class="col-lg-3 col-sm-4 col-lg-pull-9 col-sm-pull-8 ">
       		<div class="thumbnail">
       			<h3>학습관리</h3>
	            <ul class="nav nav-pills nav-stacked">
	            
	            <!-- 관리자 -->
	         
	         	<s:if test="%{#session.userSign.type==0}">
	                <li><a href="../subject/subjectManager.action">강의관리</a></li>
	            </s:if>
	            <li><a href="../subject/subjectView.action">강의목록</a></li>
	            <li class="active" ><a href="../schedule/goScheduleForm.action">일정관리</a></li>
	            <s:if test="%{#session.userSign.type==0||#session.userSign.type==1}">
		            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../schedule/goScheduleForm27.action">- 27기</a><br>
		            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">- 28기</a><br>
	            </s:if>

	            </ul> 
       		</div><br>
       		<!-- 스케쥴 일정 등록 폼 -->
       		<s:if test="%{#session.userSign.type==0}">
       		
	       		<center>[일정등록하기]</center>
	       		<form id = "insertScheduleForm">
		       		<table border="0" cellspacing="3" cellpadding="3" align="center" width="700" class="table table-bordered ">
						<tr>
							<th class="info">시작날짜</th>
							<td><input type ="text" id = "startdate" onfocus="javascript:changeStats('start')" onblur="javascript:defaultStats('defult')" onkeydown='javascript:startdateCheck()'/></td>
						</tr>
						<tr>
							<th class="info">종료날짜 </th>
							<td><input type ="text" id = "enddate" onfocus="javascript:changeStats('end')" onblur="javascript:defaultStats('defult')" onkeydown='javascript:enddateCheck()'/></td>
						</tr>
						<tr>
							<th class="info" width="50px">제목</th>
							<td><input type = "text" id = "title" width="50px"/></td>
						</tr>
						<tr>
							<th class="info">내용 </th>
							<td><textarea rows="5" cols="22" id="content" style='resize:none;'></textarea></td>
						</tr>
					</table>
				</form>
			
			
	
	       		<span style="position:relative; left:70%; padding:0px;">
	       				<button class="btn btn-success" id = "btn-success" onclick="javascript:insertSchedule()">등록</button>
	    		</span>
	    		<span style="position:relative; right:20%; padding:0px;">
	       				<button class="btn btn-danger" id = "btn-danger">삭제</button>
	    		</span>
    		</s:if>

       		<script type="text/javascript">
       		
       			function deleteSchedule(schedule_seq){
       				
       				// 나중에 변수처리하여 27기인지 28기 인지 확인해야함
       				var flag = 28;
       			//	alert('delete');
       				alert(schedule_seq);
       				
       				$.ajax({
       					url : "deleteSchedule.action",
       					type : "post",
       					dataType : "json",
       					data : {flag : flag, 
       							schedule_seq : schedule_seq},
       					success : function(){
       						$('#calendar').fullCalendar('refetchEvents');
       						$("#startdate").val("");
       						$("#enddate").val("");
       						$("#title").val("");
       						$("#content").val("");
       					}
       				});
       				
       			}
       			function insertSchedule() {
       				
       				var flag = 28;
       				var startdate = $("#startdate").val();
       				var enddate = $("#enddate").val();
       				var title = $("#title").val();
       				var content = $("#content").val();
       				if(startdate==""||enddate==""||title==""||content==""){
       					alert('모든 항목을 입력하세요');
       					return false;
       				}else if(startdate>enddate){
       					alert('시작&종료 날짜를 확인해주세요.');
       					return false;
       				}
       				$.ajax({
       					url : "insertSchedule.action",
       					type : "post",
       					dataType : "json",
       					data : {flag : flag,
       							startdate : startdate,
       							enddate : enddate,
       							title : title,
       							content : content},
       					// 객체로 보내고싶은데.. 객체로 보냅시다!!
       					/* data : 	$("#insertScheduleForm").serialize(),
       					contentType : "application/x-www-form-urlencoded; charset=utf-8", */
       					success : function(){
       						$('#calendar').fullCalendar('refetchEvents');
       						$("#startdate").val("");
       						$("#enddate").val("");
       						$("#title").val("");
       						$("#content").val("");
       					}
       				});
       			}	
       		</script>
      			
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
