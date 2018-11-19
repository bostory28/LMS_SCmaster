<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="s"  uri="/struts-tags"%>
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
		
		var date=new Date();
		var a=date.getFullYear();
		var b=date.getMonth()+2;
		var c=date.getDate();
		
		
		
		document.getElementById("today").value=a+"-"+b+"-"+c;
		
	});
	function formCheck() {
		var title = document.getElementById("title").value;
		var content = document.getElementById("content").value;

		if (title.length == 0 || content.length == 0) {
			alert('제목과 내용을 입력하세요');
			return false;
		}
	}
</script>
<!-- <script type="text/javascript">
    $(document).ready(function() {
    	$('a.btn-info').tooltip();
		$('#slider').anythingSlider({
			buildArrows : false,
			autoPlay : true,
			buildStartStop : true
		
			
		});
    }); // end ready
		
    </script> -->

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
				<li><a href="#">커뮤니티</a> <span
					class="glyphicon glyphicon-circle-arrow-right"></span></li>
				<li><a href="#">상담게시판</a> <span
					class="glyphicon glyphicon-circle-arrow-right"></span></li>
				<li class="active">상담게시판</li>
			</ol>
			<div class="clearfix visible-xs visible-lg"></div>
			<!-- 상담을써보자 -->
			<div>
				<center>
				<h2>상담작성</h2>
				<s:form theme="simple">
				
				<table border="1" width="600">
				<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>답변상태</th>
				</tr>
				
				<s:iterator value="troubleLists">
				<tr>
				<td><s:property value="counsel_seq"/></td>
				<td><a href="answerStudent.action?readKey=<s:property value='counsel_seq'/>">
				<s:property value="title"/></a></td>
				<td><s:property value="studentid"/></td>
				<td><s:property value="inputdate"/></td>
				<td><s:if test="response_check==0">X</s:if>
				<!-- 2번이면 쪽지함 소식안오게 -->
				<s:else>O</s:else>
				</td>
				</tr>
				</s:iterator>
				</table>
					
					
				</s:form>
				</center>
			</div>
			</article>


			<aside class="col-lg-3 col-sm-4 col-lg-pull-9 col-sm-pull-8 ">
			<div class="thumbnail">
				<h3>커뮤니티</h3>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="#">통합게시판</a></li>
					<li><a href="#">외국어게시판</a></li>
					<li class="active"><a href="#">상담게시판</a></li>

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
