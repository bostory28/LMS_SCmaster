<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>3조 프로젝트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <META http-equiv="Expires" content="-1"> 
	<META http-equiv="Pragma" content="no-cache"> 
	<META http-equiv="Cache-Control" content="No-Cache"> 
    
    
    <!-- Bootstrap -->
    <link href="<s:url value="/css/bootstrap.min.css"/>"rel="stylesheet">
    <link href="<s:url value="/css/custom.css"/>" rel="stylesheet">
    <!-- 로그인 테스트 모듈 CSS지정 시작-->
     <link href="<s:url value="/css/logintest.css"/>" rel="stylesheet">
     <!-- 로그인 테스트 모듈 CSS지정 끝-->
     <!-- 리스트 테이블 CSS 지정 시작 -->
     <link href="<s:url value="/css/listtable.css"/>" rel="stylesheet">
     <!-- 리스트 테이블 CSS 지정  끝-->
     <!-- 스타일된 버튼 CSS 지정 시작 -->
     <link href="<s:url value="/css/style.css"/>" rel="stylesheet">
     <!-- 스타일된 버튼 CSS 지정  끝-->
     <!-- 카운트 다운 스타일 지정 시작  -->
   <%--   <link href="<s:url value="/jquery-plugin/jquery-countdown-master/css/media.css"/>" rel="stylesheet">
     	 --%>
     <!-- 카운트 다운 스타일 지정 시작  -->
     
     
    <link href="<s:url value="/jquery-plugin/anythingSlider/anythingslider.css"/>" rel="stylesheet">
    <script src="<s:url value="/js/respond.js"/>"> </script>
    <script src="<s:url value="/js/jquery-1.7.2.min.js"/>"></script>
    <script src="<s:url value="/jquery-plugin/anythingSlider/jquery.anythingslider.min.js"/>"></script>
    <script src="<s:url value="/js/bootstrap.min.js"/>"></script>
  	<!--  웹에디터(Ckeditor) 적용 시작 -->
  	<script src="<s:url value="/jquery-plugin/ckeditor/ckeditor.js"/>"></script>
  	<!--  웹에디터(Ckeditor) 적용 끝 -->
	<!-- 카운트다운 적용시작 -->	
	<script src="<s:url value="/jquery-plugin/jquery-countdown-master/js/jquery.countdown.min.js"/>"></script>
	<!-- //카운트다운 적용끝 -->
		
		
		
    <script type="text/javascript">
   
  //페이지 로딩과 동시에 실행되는 자바 스크립트 및 jQuery 시작
    $(document).ready(function() {
    	
    	CKEDITOR.config.customConfig = '<s:url value="/jquery-plugin/ckeditor/config.js"/>';
    	 $('#countdown').countdown({
    		
    	        format: "mm:ss",
    	      	startTime: "00:10",
    		    timerEnd: function() { alert('end!!'); },
    		    image: '<s:url value="/jquery-plugin/jquery-countdown-master/img/digits-min.png"/>'
    		  });
	
    	 
    	 
    	// 뒤로가기 방지
    	 window.history.forward(1);
    	  
    	 // 우클릭방지
    	 oncontextmenu='return false' 
    	  
    	  // 드래그 방지
    	 ondragstart='return false'
    	  
    	 // 선택복사 방지
    	 onselectstart='return false'
    	  
    	  
    	 //새로고침, 뒤로가기 막기
    	 document.onkeydown = function(e) {
    	  key = (e) ? e.keyCode : event.keyCode;
    	  if(key==8 || key==116) {
    	   if(e) {
    	    e.preventDefault();
    	   } else {
    	    event.keyCode = 0;
    	    event.returnValue = false;
    	   }
    	  }
    	 }
    	 //오른쪽마우스 막기
    	 document.oncontextmenu = function(e){
    	  if(e){
    	   e.preventDefault();
    	  }
    	  else{
    	   event.keyCode = 0;
    	   event.returnValue = false;
    	  }
    	 }
    	
    	 
    	 
    }); 
  
  //페이지 로딩과 동시에 실행되는 자바 스크립트 및 jQuery
		
    
  //일반적인 자바 스크립트 기능들
 

 


    
    
    
    
    </script>
    
</head>

<body>
	<div class="container">
        <!-- =====================================컨텐츠 부분======================================= -->    
 			<div class="col-lg-9 thumbnail">
 			<center><h1>[<s:property value="test_seq"/>문제 풀기]</h1></center>
 			
 			
 		
 			<div class="col-lg-12">
 				문제가 출력되는곳
 				<div class="thumbnail">
 					<s:iterator value="pli" status="stat">
 						<!-- 객관식일시 -->
 						<s:if test="prob_type =='obj'">
 							<div class="thumbnail formform" style="background-color:#f0ad4e;">
								 <b><s:property value="#stat.index+1"/>번 문제</b>
				 				
				 			 	 <div class="thumbnail">
				 			 	  <!--================================= -->
				 			 	 <table class="table table-bordered ">
									<tr>
										<th style="width:10%; background-color:#ddd;">문제내용</th><td class="recontent"><s:property  escapeHtml="false" value="probtext"/></td>
									</tr>
									<tr>
										<th class="objtype">문제보기</th>
										<td>
										<ol>
										<li><s:property value="obj1"/></li>
										<li><s:property value="obj2"/></li>
										<li><s:property value="obj3"/></li>
										<li><s:property value="obj4"/></li>
										</ol>
										</td>
									</tr>
								</table>
				 				  <!--================================= -->	
				 				 </div>
			 				 </div>	 
 						</s:if>
 						<!-- 객관식일시 -->
 						<s:else>
 							<div class="thumbnail formform" style="background-color:#5bc0de;">
								 <b><s:property value="#stat.index+1"/>번 문제</b>
					 			 <div class="thumbnail">
					 			
					 			 <!--================================= -->
					 			 	<table class="table table-bordered">
										<tr>
										<th style="width:10%; background-color:#ddd;">문제내용</th><td class="recontent"><s:property escapeHtml="false" value="probtext"/></td>
										</tr>
									</table>
					 			 
					 			  <!--================================= -->
					 			
					 			 </div>
			 			 	</div>
 						</s:else>
 				
 					
 					</s:iterator>
 				</div>
 			</div>
 			
 			
 			          
        <!-- =====================================//컨텐츠 부분======================================= -->    
      
        </div>
       
        <div class="col-lg-3 col-sm-3">
       		
       		<div class="thumbnail" style="position:fixed;">
       			<div class="thumbnail col-lg-12"><div id="countdown"></div></div>
       			<h3>답지</h3>
       			<div>
       			<form class="form-inline" role="form">
       				<s:iterator value="pli" status="stat">
           			 	<!--======객관식 답지=====-->
           			 	<s:if test="prob_type =='obj'">
           			 		<div>
           			 			<div class="obj">
           			 			<s:property value="#stat.index+1"/>번 &nbsp;
	           			 			
			         				<input type="radio" name="options<s:property value="#stat.index+1"/>"  value="1">
			         				
			         				
			         				<input type="radio" name="options<s:property value="#stat.index+1"/>"  value="2" >
			         				
			         				
			         				<input type="radio"  name="options<s:property value="#stat.index+1"/>"  value="3" >
			        					
			         				
			         				<input type="radio" name="options<s:property value="#stat.index+1"/>"  value="4" >
		         				</div>
           			 		</div>
           			 	</s:if>
           			 	<!--======주관식 답지=====-->
           			 	<s:else>
	           			 	<div>
	           			 		<div class="sbj">
	           			 			<s:property value="#stat.index+1"/>번 &nbsp;
	           			 			<input type="text" class="form-control sbjanswer" size="8"/>
	           			 		</div>
	           			 	</div>
           			 	</s:else>
           			</s:iterator>
           		</form>
           		</div>
           	
           		<br>
           		<div class="thumbnail">
       		
       			<a href="javascript:submit()" class="btn btn-success">답안 제출하기</a>
       			
       		
       			</div>
     
       		</div>
       		
       			<script type="text/javascript">
       				
       				//사용자가 제출을 눌렀을떄 행하는 행동.
       				function submit(){
       					
       				//시험내기
       					
       					
       					//객관식문제의 값을 모두 얻어온다.
       					
       					//답안 관련 배열을 만든다.
       					var answer=[];
       					var objlen = $('.obj').length;
       					for(var i=1; i<objlen+1 ; i++){
       						alert($('input[name=options'+i+']:checked').val());
       						
       						
       						var oba = $('input[name=options'+i+']:checked').val();
       						if (oba =='' || oba=='undefined'){
       							oba='미입력';
       						}	
       						answer.push(oba);
       					}
       					
       					var sbjlen = $('.sbj').length;
						
       					//주관식의 답을 모두 들고 오기
       					
       					for(var j=0; j<sbjlen; j++){
       						alert($('.sbjanswer').eq(j).val());
       						var sba = $('.sbjanswer').eq(j).val();
       						
       						if (sba =='' || sba=='undefined'){
       							sba='미입력';
       						}	
       						
       						answer.push(sba);
       					}
       					//답안지의 내용을 모두 보고  마지막에 빈칸 검색을 한다.
       					//모든 문제수 
       					var tonum = $('.formform').length;
       					for(var k=0;k<tonum;k++){
       						if(answer[k]==null || answer[k]==''){
       							if(confirm('아직 미작성된 답안이 있습니다. 그래도 제출하시겠습니까?')){
       								alert(answer);
       								testcfm(answer);	
       								return;
       								
       							}
       						}
       					
       					}//for구문 끝
       					
       					alert(answer);
						testcfm(answer);	
   						
       				
       				}
       				
       				function testcfm(answer){
   						
   						$('#useranswer').val(answer);
						$('#testdata').submit();
   					}
           			
       				 
       				 
       				 
       				 
       				
       				
       			
       			</script>
       			
       			<form action="testResult.action" method="POST" id="testdata">
       			<input type="hidden" name="useranswer" value="" id="useranswer"/>
       			<input type="hidden" name="test_seq" value="<s:property value="test_seq"/>" id="test_seq"/>
       			<input type="hidden" name="id" value="<s:property value="#session.userSign.id"/>"/>
       			</form>
       		
       		
       
        </div>
        
 </div><!-- end row 3 -->       
<!-------------------------------------------컨텐츠 부분-------------------------------------------------------------- --> 
    	

    <!-- row 4 -->
    <footer class="row">
         <p><small>본 웹사이트는 SC마스터 학생들을 지원하기 위해 테스트중이며 현재 어떠한 경제적 지원도 받고 있지 않습니다.</small></p>
         <p><small> Produced by Young-Bo Lee, team 3 Leader.  all right reserved.</small></p>
    </footer>

 
</body>
</html>
