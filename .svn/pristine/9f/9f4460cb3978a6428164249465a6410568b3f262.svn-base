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
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".btnDel").click(deleteGo);
		$(".btnUp").click(updateGo);
	});
	function insertOk(kk){
		
		 
		 window.open("goSubjectForm.action?deleteKey="+kk,"newsubWindow", "top=200,left=300,width=400,height=400","resizable=no");
		
		
	}
	
	function deleteGo(){
		var deleteKey = $(this).attr('data-num');
		alert(deleteKey);
		$.ajax({
			url: 'detailDelete.action',
			type: 'POST',
			dataType: 'json',
			data: {
				deleteKey:deleteKey
			},
			success: reOutput
		});
	}
	function updateGo(){
		var key = $(this).attr('data-num1');
		var abc = $(this).val();
		
		if(abc=="수정"){
			$("#"+key).attr("readonly",false);
			$(this).attr("value","저장");
		}else{
			alert(abc);
			
			
			/* $(".btnUp").click(updateGo1); */
			var key1=$(this).val();
			alert(key1);
			if(key1=='저장'){
				var deleteKey = $(this).attr('data-num');
				var deleteKey1 = $("#"+key).val();
				
				
				$.ajax({
					url: 'detailUpdate.action',
					type: 'POST',
					dataType: 'json',
					data: {
						deleteKey:deleteKey,
						deleteKey1:deleteKey1
					},
					success: reOutput
				}); 
			}
		}	
	}
	

	function reOutput(){
		alert('삭제완료');
		location.reload();
	}
	
	function testsubmit(){
		
		alert('문제내기');
		if(confirm('본 과목에 대한 온라인 시험을 출제하시겠습니까?')){
			$('#testsubmit').submit();
			
		}
		
		
	}
	
	
	function testsolving(subject_seq){
		alert('문제풀기');	
		
		if(confirm('본 과목에 대한 온라인 시험에 응시하시겠습니까?')){
			//바로 이문제에 대한 
			alert(subject_seq);
			location.href='<s:url value="/prob/ProbSolving.action?subject_seq="/>'+subject_seq;
			
			
		}
		
	}
	
	
</script>

</head>

<body>
<div class="container">
<!--==============문제 내기============  -->
	<!-- 필요한 것은  플래그, 서브젝트 시퀀스, 서브젝트 네임, -->
	<form  action="<s:url value="/prob/ProbMakingForm.action"/>" method="POST" id="testsubmit">
		<input type="hidden" name="flag" value="<s:property value="subj.flag"/>" />
		<input type="hidden" name="subject_seq" value="<s:property value="subj.subject_seq"/>"/>
		<input type="hidden" name="subjectname" value="<s:property value="subj.subjectname"/>"/>
	
	</form>
	

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
				<s:form theme="simple">
				<s:hidden name="subj.subject_seq"/>
				<center>
				<table border="1" width="600" height="300" style="text-align: center;">
				
				<tr>
				<td rowspan="2" width="150">사진</td><td>강사이름</td><td><s:property value="subj.id"/></td><td>강의제목</td><td><s:property value="subj.subjectname"/></td>
				</tr>
				<tr>
				<td>강의일정</td><td colspan="4"><s:property value="subj.start_date"/>~<s:property value="subj.end_date"/></td>
				</tr>
				<tr>
				<td colspan="5" height="100"><s:property value="subj.content"/></td>
				</tr>
				<s:if test="%{#session.userSign.type==0||#session.userSign.type==0}">
				<tr>
				<td colspan="2" width="150"><a href="javascript:testsubmit()" class="btn btn-default">문제내기</a></td>
				<td width="150"><a href="javascript:testsolving(<s:property value="subj.subject_seq"/>)" class="btn btn-default">문제풀기</a></td>
				<td width="150"><input type="button" value="강의게시판" class="btn btn-default"></td>
				<td width="150"><input type="button" id="btn_insert" value="강의추가" class="btn btn-default" onclick="javascript:insertOk(<s:property value='subj.subject_seq'/>)"></td>
				</tr>
				</s:if>
				
				
				
				</table>
				</center>
				</s:form>
			</div>
			<br>
			<br>
			<div id="output">	
			<center>
			<table border="1">
		
			<s:iterator value="detailLists" status="stat">
			<tr>
			
			<td width="400"><s:property value="#stat.index+1"/>&nbsp;
			<input type="text" id="<s:property value="#stat.index+1"/>" readonly="readonly" style="border: none;" value="<s:property value="detailTitle"/>"></td>
			<s:if test="%{#session.userSign.type==0||#session.userSign.type==0}">
			<td width="100"><input type="button" value="수정" class="btnUp" data-num='<s:property value="detail_seq"/>' data-num1='<s:property value="#stat.index+1"/>'  >

			</td>
			<td width="100"><input type="button" value="삭제" class="btnDel" data-num='<s:property value="detail_seq"/>'></td>
			</tr>
			</s:if>
			</s:iterator>
			
			</table>
			</center>
			</div>
			<br>
			
			
			
			
			</article>

			<aside class="col-lg-3 col-sm-4 col-lg-pull-9 col-sm-pull-8 ">
			<div class="thumbnail">
				<h3>학사관리</h3>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="../subject/subjectManager.action">강의관리</a></li>
					<li class="active"><a href="#">강의상세보기</a></li>
					
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

	


</body>
</html>
