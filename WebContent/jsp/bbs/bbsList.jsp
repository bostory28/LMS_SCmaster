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
    <link href="<s:url value="/css/bootstrap.min.css"/>"rel="stylesheet">
     <!-- 리스트 테이블 CSS 지정 시작 -->
     <link href="<s:url value="/css/bootstrap-table.css"/>" rel="stylesheet">
     <!-- 리스트 테이블 CSS 지정  끝-->
    <link href="<s:url value="/css/custom.css"/>" rel="stylesheet">
     <!-- 로그인 테스트 모듈 CSS지정 시작-->
     <link href="<s:url value="/css/logintest.css"/>" rel="stylesheet">
     <!-- 로그인 테스트 모듈 CSS지정 끝-->
     <link href="<s:url value="/css/ribbon.css"/>" rel="stylesheet">
     
    <script src="<s:url value="/js/respond.js"/>"> </script>
    <script src="<s:url value="/js/jquery-1.7.2.min.js"/>"></script>
    <script src="<s:url value="/js/bootstrap.min.js"/>"></script>
    <script src="<s:url value="/js/bootstrap-table.js"/>"></script>
   
    
		
    <script type="text/javascript">
   
  //페이지 로딩과 동시에 실행되는 자바 스크립트 및 jQuery 시작
    $(document).ready(function() {
    	
    	
    	
    	 $('#get-selections').click(function () {
    		 if(confirm('선택한 글들을 모두 삭제하시겠습니까?')){
    			 
    			 
    			 JSON.stringify($('#table').bootstrapTable('getSelections'));
                 $.each($('#table').bootstrapTable('getSelections'),function(index,item){
                	var boardnum =item.boardnum;
                	$.ajax({
             			url:'bbsDelete.action',
            			type:'POST',
            			dataType:'json',
            			data:{boardnum:boardnum},
            			success:function(){}
             		});
                	
                //거의다 해놓음.
                	   location.reload(true);
                }); 
                 

               
                		 
    		 }

          
    	   });
    		
    	}); 
		
  //페이지 로딩과 동시에 실행되는 자바 스크립트 및 jQuery
		
    
  //일반적인 자바 스크립트 기능들
 
  	//페이징 관련 자바 스크립트
  function pagingFormSubmit(currentPage) {
	document.pagingForm.currentPage.value = currentPage;
	document.pagingForm.submit();
	}    
    
    

    
    
    
    
    </script>
    
</head>

<body>
<div class="container">
		
	<!------------- 로그인, 회원가입, 마이페이지, 로그아웃관련 부분  시작------------------------- -->
		<s:if test="%{#session.userSign.id!=null}">
				<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
					
		    		<span style="position:relative; left:70%; padding:5px;">
		    		<b>반갑습니다&nbsp;${sessionScope.userSign.id}님&nbsp;</b><!--updated-->
		    		<a href='<s:url value ="/member/mypage_details.action"/>' class="btn btn-info btn-sm">마이페이지</a>
		    		&nbsp;
		    		&nbsp;
		    		<a href='<s:url value ="/member/logout.action"/>' class="btn btn-danger btn-sm ">로그아웃</a>
		    		</span>
	    		 </div>
		</s:if>
		<s:else>
				<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
			    	<span style="position:relative; left:80%; padding:5px;">
			    		<a href='<s:url value ="/member/memberJoinForm.action"/>' class="btn btn-success btn-sm">회원가입</a>
			    		&nbsp;
			    		&nbsp;
			    		<a href='<s:url value ="/member/loginForm.action"/>' class="btn btn-primary btn-sm ">로그인</a>
			    	</span>
	    		 </div>
		</s:else>
		 <!------------- /로그인, 회원가입, 마이페이지, 로그아웃관련 부분 끝------------------------- -->



<!-- 네비게이션의 액션을 정리하는곳 -->
	 <!-- 홈 --> 	
	 	 <s:url value="/index.action" var="goIndex"></s:url>
	 	
	 
	 <!-- 커뮤니티 -->
  		 <!-- 통합게시판으로 이동함 -->
  	 	 <s:url value="/bbs/bbsList.action" var="goBbsList"></s:url>
		 <!-- 글상세 보기(boardnum을 query에 넣기 위해 ~번째 줄에 정의 해둠) -->
		 
		 <!-- 새로운 글쓰기 -->
		 <s:url value="/bbs/writeNewForm.action" var="goWriteNewForm"></s:url>
		 
		 
    <!-- row 1: header -->
    <header class="row">
    	<div class="col-lg-4 col-sm-5">
        	<a href="../index.action"><img src="/LMS_SCmaster/images/KUpEzwG.gif" alt="Wisdom Pets. click for home." class="img-responsive" style="height:200px;"></a>
        </div>
    	<div class="col-lg-8 col-sm-7">
        	<img src="/LMS_SCmaster/images/logo.gif" alt="" class="hidden-xs img-responsive">
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
                    <li><a href='<s:property value="#goIndex"/>'>홈</a></li>
                    <li><a href="#">공지사항</a></li>
                   <li class="dropdown"><a href="#" data-toggle="dropdown">학사관리<span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                        	<s:if test="#session.userSign.type == 0">
                        		<li><a href="../member/memberManagement.action">회원관리</a></li>
                        	</s:if>
                            <li><a href="../attendance/goAttendanceList.action">출석관리</a></li>
                            <s:if test="#session.userSign.type == 0 || #session.userSign.type == 1">
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
                    <li><a href="<s:property value="#goBbsList"/>">커뮤니티</a></li>
                    <li><a href="#">사이트 정보</a></li>
                </ul> 
            </div>
         </nav> 
    </div>
  
<!-------------------------------------------컨텐츠 부분-------------------------------------------------------------- --> 
    
    <!-- row 3: article/aside -->
    <div class="row">
    	<article class="thumbnail col-lg-12 col-sm-12"> 
        
            <ol class="breadcrumb">
              <li><a href="#">홈</a> <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li class="active">커뮤니티 <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li><a href='<s:property value="#goBbsList"/>'>통합 게시판</a></li>
            </ol>
            <!--  -->
   <!--    		
            <table id="table-pagination" data-url="data2.json" data-height="400" data-pagination="true" data-search="true">
    <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="id" data-align="right" data-sortable="true">Item ID</th>
            <th data-field="name" data-align="center" data-sortable="true">Item Name</th>
            <th data-field="price" data-sortable="true" data-sorter="priceSorter">Item Price</th>
        </tr>
    </thead>
</table> -->


<!-- 
<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="299">
    <thead>
        <tr>
            <th data-field="id">Item ID</th>
            <th data-field="name">Item Name</th>
            <th data-field="price">Item Price</th>
        </tr>
    </thead>
</table>

<table data-toggle="table" data-url="data2.json" data-height="400" data-pagination="true" data-search="true">
    <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="id" data-align="right" data-sortable="true">Item ID</th>
            <th data-field="name" data-align="center" data-sortable="true">Item Name</th>
            <th data-field="price" data-sortable="true" data-sorter="priceSorter">Item Price</th>
        </tr>
    </thead>
</table> -->
            
            <!-- - -->
            
        <!-- 통합게시물 리스트 시작  -->   
        <center>
        <div class="large blue ribbon">통합 게시판</div>
      
 		<div class="row col-lg-12 col-md-12 col-sm-12 ">
 		
		   <table data-toggle="table" id="table" data-width="400" data-click-to-select="true"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true">
			<thead>
			<tr>
				<s:if test="#session.userSign.type == 0"><th data-checkbox="true" ></th></s:if>
				<th style="width:10px"   data-align="center" data-field="boardnum" >번호</th>
				<th style="width:100px"  data-align="center" >제목</th>
				<th style="width:100px"  data-align="center" >작성자</th>
				<th style="width:100px"  data-align="center" >등록일</th>
				<th style="width:60px"  data-align="center" >조회수</th>
				
			</tr>
			</thead>
			<tbody>
			<!-- 반복 시작 -->
			<s:iterator value="boardlist">
			<tr>
				<s:if test="#session.userSign.type == 0"><td></td></s:if>
				<td class="boardnum"><s:property value="boardnum"/></td>
				<td><s:if test="boardtype =='jpn'"><span class="btn btn-danger btn-xs">일본어 작문</span></s:if>
					<s:else><span class="btn btn-primary btn-xs">it&통합</span></s:else>		
					<a href="<s:url value="/bbs/bbsDetail.action"/>?boardnum=<s:property value="boardnum"/>"><s:property value="title"/></a>
				
 					<s:if test = "newornot !=null"><img src="<s:url value="/images/new.gif"/>"/></s:if>
 					<s:if test = "replycount !=0"><span style="color:red;">( <s:property value="replycount"/> )</span></s:if>
 					<s:if test = "pfdreplycount !=0"><span style="color:red;">( <s:property value="pfdreplycount"/> )</span></s:if>
					<%-- <span boardnum ="<s:property value="boardnum"/>" ></span> --%>
					<!-- 댓글의 개수가 붙도록! -->
					<!-- 새로운 글일경우 new가 붙도록! -->
					<!-- 영상파일이 참고 되어있을경우는 >표시를!! -->
				</td>
				<td><s:property value="id"/></td>
			<%-- 	<td><span class="inputdate" data="<s:property value="inputdate"/>"></span></td> --%>
				<td><s:property value="rfInputdate"/></td>
				<td><s:property value="viewcount"/></td>
			</tr>
			</s:iterator>
			</tbody>       
			<!-- 반복 끝 -->
			
			</table>
			<br/>
			<s:if test="#session.userSign.type == 0">
				<button class="btn btn-danger" id="get-selections">선택한 글 삭제</button>
    		</s:if>
    		<a  class="btn btn-primary" href='<s:property value="#goWriteNewForm"/>' >글쓰기</a>&nbsp;
    		<a  class="btn btn-success" href='<s:property value="#goBbsList"/>' >전체글보기</a>
    		
			
			<br/><br/>
			
			<!-- 페이지 이동 부분 -->                      
				<a class="btn btn-default" href="javascript:pagingFormSubmit(-4)">◁◁ </a> &nbsp;&nbsp;
				<a class="btn btn-default"  href="javascript:pagingFormSubmit(0)">◀</a> &nbsp;&nbsp;
			
				
				<s:iterator begin="pagenavi.startPageGroup" end="pagenavi.endPageGroup" var="count" >
				
				
					<s:if test="pagenavi.currentPage !=#count">
						<a class="btn btn-default" href="javascript:pagingFormSubmit(<s:property value="#count"/>)"><s:property value="#count"/></a>&nbsp;
						&nbsp;
					 </s:if>
					 
					 <s:if test="pagenavi.currentPage == #count">
						<b>
						<a class="btn btn-default" href="javascript:pagingFormSubmit(<s:property value="#count"/>)"><s:property value="#count"/></a>&nbsp;
						</b>
					&nbsp;
				 </s:if>
				 
				</s:iterator> 
				 
				
				&nbsp;&nbsp;
				<a class="btn btn-default" href="javascript:pagingFormSubmit(2)">▶</a> &nbsp;&nbsp;
				<a class="btn btn-default" href="javascript:pagingFormSubmit(6)">▷▷</a>
			
			<!-- /페이지 이동 끝 -->                      
			 			
			 
			<br>
			<br>
			
			<!-- 검색폼 -->
			
			
			<form id="boardList_action" name="pagingForm" action="<s:url value="/bbs/bbsList.action" var="goBbsList"></s:url>
			" method="post">
				<input type="hidden" name="currentPage" value="1" id="boardList_action_currentPage"/>
				제목 : <input type="text" name="searchText" value="" id="boardList_action_searchText"/>
				<a href="javascript:pagingFormSubmit(1)">검색</a>
			</form>		
						 		
			 		
			 		
			 		
			 		
 		
 		
 		   
        	
         </div>          
          </center>	  
        </article>
        
       
        
 </div><!-- end row 3 -->       
<!-------------------------------------------컨텐츠 부분-------------------------------------------------------------- --> 
    	

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
