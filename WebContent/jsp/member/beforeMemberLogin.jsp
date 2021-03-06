<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	$("#Slogin").click(function(){
    		location.href="loginForm2.action?type=2";
    	});
    	$("#Tlogin").click(function(){
    		location.href="loginForm2.action?type=1";
    	});
    }); // end ready
		
   
    </script>
    
</head>

<body>
<div class="container">

	<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
    	<span style="position:relative; left:80%; padding:5px;">
    		<a href="memberJoinForm.action" class="btn btn-success btn-sm">회원가입</a>
    		&nbsp;
    		&nbsp;
    		<a href="#" class="btn btn-primary btn-sm ">로그인</a>
    	</span>
    
    </div>
    
    <!-- 네비게이션의 액션을 정리하는곳 -->
	 <!-- 홈 --> 	
	 	 <s:url value="/index.action" var="goIndex"></s:url>
	 	
	 
	 <!-- 커뮤니티 -->
  		 <!-- 통합게시판으로 이동함 -->
  	 	 <s:url value="/bbs/bbsList.action" var="goBbsList"></s:url>
 
    
    
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
                    <li><a href='../index.action'>홈</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li class="dropdown"><a href="#" data-toggle="dropdown">학사관리<span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                    	 <s:if test="%{#session.userSign.type!=2}">
                        	<li><a href="../member/memberManagement.action">회원관리</a></li>
                         </s:if>
                            <li><a href="../attendance/goAttendanceList.action">출석관리</a></li>
                         <s:if test="%{#session.userSign.type!=2}">   
                            <li><a href="../test/testItUi.action">시험관리</a></li>
                         </s:if>
                            <li><a href="../member/myScoreViewForm.action">성적조회</a></li>
                            <s:if test="#session.userSign.type == 1">
                          	  <li><a href="../trouble/troubleList.action">상담보기선생님</a></li>
                            </s:if>
                            <s:if test="#session.userSign.type == 0">
                            <li><a href="../trouble/troubleAdmin.action">상담보기관리자</a></li>
                            </s:if>
                            <s:if test="#session.userSign.type == 2">
                            <li><a href="../trouble/troubleWriteForm.action">상담쓰기</a></li>
                            </s:if>
                        </ul>                    
                    </li>
                    
                    <li class="dropdown"><a href="#" data-toggle="dropdown">학습관리 <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
	                    	<s:if test="#session.userSign.type == 0">
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
    	<article class="thumbnail"> <!-- col-lg-9 col-sm-8 col-lg-push-3 col-sm-push-4  -->
        
            <ol class="breadcrumb">
              <li><a href="../index.action">홈</a> <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>로그인</li>
            </ol>
        <div class="row">
	         <div class="col-lg-offset-4 col-lg-4 col-sm-offset-4 col-sm-4 col-md-offset-4 col-md-4 col-xs-offset-4 col-xs-4">
	        	<img id="Slogin" src="../images/studentLogin.png" style="cursor:pointer">
	        	<img id="Tlogin" src="../images/teacherLogin.png" style="cursor:pointer">
			 </div>	
        </div>
        </article>
        
    <!-- row 4 -->
    <footer class="row">
         <p><small>본 웹사이트는 SC마스터 학생들을 지원하기 위해 테스트중이며 현재 어떠한 경제적 지원도 받고 있지 않습니다.</small></p>
         <p><small> Produced by Young-Bo Lee, team 3 Leader.  all right reserved.</small>&nbsp;&nbsp;<small><a href="loginForm2.action?type=0">관리자</a></small></p>
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
