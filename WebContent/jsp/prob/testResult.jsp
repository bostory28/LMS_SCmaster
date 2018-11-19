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
    <link href="<s:url value="/css/custom.css"/>" rel="stylesheet">
    <!-- 로그인 테스트 모듈 CSS지정 시작-->
     <link href="<s:url value="/css/logintest.css"/>" rel="stylesheet">
     <!-- 로그인 테스트 모듈 CSS지정 끝-->
     <!-- 리스트 테이블 CSS 지정 시작 -->
     <link href="<s:url value="/css/listtable.css"/>" rel="stylesheet">
     <!-- 리스트 테이블 CSS 지정  끝-->
    <link href="<s:url value="/jquery-plugin/anythingSlider/anythingslider.css"/>" rel="stylesheet">
    <script src="<s:url value="/js/respond.js"/>"> </script>
    <script src="<s:url value="/js/jquery-1.7.2.min.js"/>"></script>
    <script src="<s:url value="/js/jquery.autosize.min.js"/>"> </script>
    <script src="<s:url value="/jquery-plugin/anythingSlider/jquery.anythingslider.min.js"/>"></script>
    <script src="<s:url value="/js/bootstrap.min.js"/>"></script>
  	<!-- 리스트 테이블 스타일 지정 -->
	<!--  웹에디터(Ckeditor) 적용 시작 -->
  	<script src="<s:url value="/jquery-plugin/ckeditor/ckeditor.js"/>"></script>
  	<!--  웹에디터(Ckeditor) 적용 끝 -->
		
		
    <script type="text/javascript">
   
  //페이지 로딩과 동시에 실행되는 자바 스크립트 및 jQuery 시작
    $(document).ready(function() {
    	/* CKEDITOR.config.customConfig = '<s:url value="/jquery-plugin/ckeditor/config.js"/>'; */

    	//글이 IT&통합게시판인지, 일본어 첨삭게시판인지 먼저 판별한다.
    	var boardtype ='<s:property value="board.boardtype"/>';
    	//글이 IT&통합게시판의 것이라면 일반 댓글 버튼을 숨기고 '첨삭하기'버튼을 화면에 띄운다. 
    	$('#pfdtoggle').hide();
    	
    	if(boardtype =='jpn'){
    		$('#replytoggle').hide();
    		$('#pfdtoggle').show();
    	}
    		
    	//일반리플 입력폼을 숨긴다.
    	$('#reform').hide();
		//첨삭리플 입력폼을 숨긴다.    
    	$('#pfdform').hide();
		//로딩되자마자 리플의 목록을 띄우로록!
		$('textarea').autosize(); 
		callReplyList();
		callPfdList(); 
		
    }); 
  
  //페이지 로딩과 동시에 실행되는 자바 스크립트 및 jQuery
		
    
  //일반적인 자바 스크립트 기능들
 
  	//페이징 관련 자바 스크립트
  function pagingFormSubmit(currentPage) {
	document.pagingForm.currentPage.value = currentPage;
	document.pagingForm.submit();
	}    
    
    //글수정 관련 자바 스크립트
    function editCheck(boardnum){
		if(confirm('정말 수정하시겠습니까?')){
    		
    		alert('수정선택');
    		location.href='<s:url value="/bbs/bbsEditForm.action?boardnum="/>'+boardnum;
    	}
    }
 
    //글삭제 관련 자바 스크립트
     function deleteCheck(boardnum){
    	
    	if(confirm('정말 삭제하시겠습니까?')){
    		
    		alert('삭제 선택');
    		location.href='<s:url value="/bbs/bbsDelete.action?boardnum="/>'+boardnum;
    	}
    
    }
    
 	 //댓글 관련 자바스크립트
 		
 	 //댓글 목록 불러오기(ajax를 이용해 json을 불러오는것이 목적인 함수)
 	 function callReplyList(){
 		 //게시물 번호
 		var boardnum = ${board.boardnum};
 		$.ajax({
 			url:'replyList.action',
			type:'POST',
			dataType:'json',
			data:{boardnum:boardnum},
			success:replyListCoding
 		});
 	 }
 	 
 	 
     //댓글 목록 화면상에 코딩하기 
     function replyListCoding(json){
 		 //댓글 영역 초기화
    	 $('#replyArea').html('');
 		 //로그인 아이디 확인 ->본인일떄만 이용가능한 서비스의 구분을 위해 
    	 var loginId = '<s:property value="#session.userSign.id" />';
    	 //관리자 권한의 확인 -- 0이면 관리자, 1이면 선생 , 2이면 학생
    	 var authority =Number('<s:property value="#session.userSign.type" />');
    	 
		 //각각의 replyList의 Div 형성하기
		 
		 var str='';
		 $.each(json.replylist, function(index, item){
			 str +='<div class="thumbnail"><div class="row">';
			 str +='<div class="col-lg-12" >';
			 str +='<div class="thumbnail col-lg-1 col-md-1 col-sm-1 col-xs-1" >';
    	 	 //프로필 이미지 관련 
    	 	 str +='<img src="<s:url value="/images/icon.jpg"/>"/>'; 
    	 	 str +='</div>';
    	 	 str +='<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">';
    	 	 str +='<table class="table table-bordered">';
    	 	 str +='<tr>';
    	 	 //댓글 아이디 및 간단한 소속 정리(추가함)
    	 	 str +='<td><span style="font-size: 150%; color:#f0ad4e;">'+item.id+'</span> &nbsp; &nbsp;<b>'+item.inputdate+'</b>';
    	 	 //댓글 수정 및 삭제는 운영자, 혹은 글을 쓴 본인만 보이도록한다.
    	 	 if((item.id == loginId) || (authority == 0) ){
    	 	 	str +='<span sel="'+item.replynum+'" style="float:right;"><a href ="javascript:updateReply('+item.replynum+')" class="btn btn-default"><span class="glyphicon glyphicon-wrench"></span></a>&nbsp;<a href ="javascript:deleteReply('+item.replynum+')" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span></a></span></td>';
    	 	 }	
    	 	 str +='</tr>';//
    	 	 str +='<tr>';
    	 	 //댓글 내용표시(========================사용자의 상태에 따라 다르게 나타나는 부분=================================)
    	 	 
    	 	 str +='<td><textarea sel="'+item.replynum+'" class="rep" style="width:100%; border:none;" readonly>'+item.retext+'</textarea></td>';
 			
    	 	 str +='</tr>';
    	 	 str +='</table>';
    	 	 str +='</div>';
    	 	 str +='</div>';
    	 	 str +='</div>';
    	 	 str +='</div>';
    	 	 str +='</div>';
    	 	 str +='<br>';
			 
		 });
		 $('#replyArea').html(str);  
		//각각의 컨턴츠에 맞는 
		 /*  alert($(".rep")[0].scrollHeight); */
		  var si =($(".rep").length);
		  for(var i=0;i<si; i++){
			  $(".rep").eq(i).height( $(".rep")[i].scrollHeight);
		  } 
		
     }
     //댓글 폼 나타나게 하기
     function showReplyForm() {
     	$('#reform').show();
     	
     	$('#replytoggle').hide("fast");
  		//댓글 입력란에 커서 이동시키기 
  		$('#recontent').focus();
     	
     }
     
     
 	 //댓글 폼 취소하기
    function replyCancel(){
    	
    	 //댓글 양식 숨기기 
    	 $('#reform').hide("fast");
    	//댓글 양식 초기화 
    	$('#recontent').val('');
    	
    	 //숨겨왔던 버튼 활성화
    	$('#replytoggle').show("fast");
    }
 	 
   
   
    //댓글 쓰기
    function replyWrite(boardnum) {
    	if($('#recontent').val().length<5){
    		alert('댓글 내용은 5자이상 적어주셔야 합니다.');
    		return false;
    	}
    	else{
    		var id = '<s:property value="#session.userSign.id"/>';
    		var retext=$('#recontent').val();  	
			/* location.href='<s:url value="/bbs/writeReply.action?boardnum="/>'+boardnum; */
			alert(retext);
			$.ajax({
				url:'writeReply.action',
				type:'POST',
				dataType:'json',
				data:{boardnum:boardnum, retext:retext, id:id},
				success:checkit
			});
    	} 
    	replyCancel();    	
    	
    }
 	
    function checkit(){
    	callReplyList();
    }
    
    function updateReply(replynum){
    	if(confirm('댓글을 수정합니다. 계속하시겠습니까?')){
    		//우선 해당되는 리플의 텍스트 구역을 활성화시키고 커서를 이동시킴
    		 $('textarea[sel='+replynum+']').attr("readonly",false);
    		 $('textarea[sel='+replynum+']').focus();
    		 //기존의 버튼을 2개 없애고 승인 버튼을 만든다.
    		 $('span[sel='+replynum+']').html('');
    		 $('span[sel='+replynum+']').html('<a title="수정을 완료합니다." href ="javascript:updateReplyCMT('+replynum+')" class="btn btn-default"><span class="glyphicon glyphicon-ok"></span></a>');
    		 
    		/*  var retext = 
			 $.ajax({
				url:'updateReply.action',
				type:'POST',
				dataType:'json',
				data:{replynum:replynum},
				success:checkit
			});  */
		}
    }
    
	function deleteReply(replynum){
		if(confirm('정말로 이댓글을 삭제하시겠습니까?')){
			$.ajax({
				url:'deleteReply.action',
				type:'POST',
				dataType:'json',
				data:{replynum:replynum},
				success:checkit
			});
		}
    	
    }
	
	function updateReplyCMT(replynum){
	    var retext =$('textarea[sel='+replynum+']').val();
		$.ajax({
				url:'updateReply.action',
				type:'POST',
				dataType:'json',
				data:{replynum:replynum, retext:retext},
				success:checkit
			});
		alert('수정되었습니다.');
	}
   //일본어 첨삭 양식 보이기
	function showPfdForm(){
	
		//컨텐츠 내용 가져오기 
		var content = $('#contentArea').html();
		alert(content);
		//ajax로 액션을 보냄
		$.ajax({
			url:'splitContent.action',
			type:'POST',
			dataType:'json',
			data:{content:content},
			success:test
		});
		
		
	}
   
   //동적으로 붙이기
	function test(json){
		var size =0;
		var str='';
		$.each(json.array,function(index,item){
			str +='<div  align="left" class="thumbnail">';
			str +='<div style="background-color:#5bc0de;">'+item+'</div>';
			str +='<div><a class="btn btn-success btn-xs" href="javascript:showPdf('+index+')" ><span class="glyphicon glyphicon-pencil">첨삭하기</span></a></div>';
			str +='<div to="'+index+'" class="pfdInput" >';
				
			str +='<textarea id="content'+index+'"name="ck" class="pfdtext" to="'+index+'" style="width:100%; background-color:lightyellow; resize:none;">'+item+'</textarea>';
			str +='</div>';
			str +='</div>';
			size=index;
		});
	/* 	CKEDITOR.config.customConfig = '<s:url value="/jquery-plugin/ckeditor/config.js"/>'; */
		//지정된 폼에 본문에 대한 동적 첨삭 양식 붙이기
		$('#splitedContent').html(str);
		//각각의 폼에 웹에디터 붙이기
		alert(size);
		for(var i=0;i<=size;i++){
			 /* editor=CKEDITOR.replace('content'+i); */
			 CKEDITOR.replace('content'+i ,
					 {
				 	height: '70px',
					toolbarGroups: [
				 		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
				 		 { name: 'colors' },
									]
				
						}
					    );
			
		}
		
		//각각의 첨삭폼을 모두 숨기기
		$('.pfdInput').hide();
		//완성된 품을 보여주기
		$('#pfdform').show("fast");
		//첨삭폼 열기 버튼 숨기기
		$('#pfdtoggle').hide("fast");
		
	}
	//각각의 첨삭 폼 열고 닫기
	function showPdf(index){
		$('.pfdInput[to='+index+']').slideToggle(300);
		
	}
	
	
	//첨삭하기 취소
	function cancelPfd(){
		
		//첨삭하기 폼 숨기기 
		$('#pfdform').hide("fast");
		
		//첨삭하기 버튼 보이기
		$('#pfdtoggle').show("fast");
		//첨삭 총평 지우기
		$('#comment').val('');
		
		
	}
	
	//첨삭하기 제출
	function submitPfd(boardnum){
		//첨삭된 모든 textarea의 내용을 가져온다.<p>형식인가?
		 var pfdstr='';
    	 for (var i in CKEDITOR.instances) {
             console.log(i);
             CKEDITOR.instances[i].updateElement();
             var editorText = CKEDITOR.instances[i].getData();
    		 pfdstr += editorText; 	 
    	 }
	
		 alert(pfdstr);
		var userid ='<s:property value="#session.userSign.id"/>';
		var pfdcomment = $('#comment').val(); 
	  /*   $.ajaxSettings.traditional = true;  */
	 	$.ajax({
			url:'pfdWrite.action',
			type:'POST',
			dataType:'json',
			data:{pfdstr:pfdstr , boardnum:boardnum, userid:userid, pfdcomment:pfdcomment},
			success:checkit2
		});  
		//모든 데이터를 보낸후 첨삭하기 버튼을 닫는다.
	 	/* cancelPfd(); */
		
	}
	//첨삭 리플 띄우기 경유지 
	function checkit2(){
		//첨삭 리플 리스트 불러오기;
		alert('check!')
		
		callPfdList(); 
		
	}
	
	function callPfdList(){
		alert('!');
		 //게시물 번호
 		var boardnum = ${board.boardnum};
 			 $.ajax({
 			url:'pfdReplyList.action',
			type:'POST',
			dataType:'json',
			data:{boardnum:boardnum},
			success:pfdReplyListCoding
 		});  
		
	}
	//우선 댓글을 코딩하고
	function pfdReplyListCoding(json){
		
		alert('성공!');
		var str='';
		//첨삭 댓글 뿌리기
		$.each(json.pfdreplylist,function(index,item){
			str +='<div class="thumbnail">';
			str +='=======================<br>';
			str +='첨삭글 번호'+'<span class="pfdnum">'+item.pfdnum+'</span>'+'<br>';
			str +='원글 번호'+item.boardnum+'<br>';
			str +='<span></span>';
			str +='첨삭글'+item.pfdstr+'<br>';
			str +='입력날짜'+item.inputdate+'<br>';
			str +='사용자'+item.userid+'<br>';
			str +='코멘트'+item.pfdcomment+'';
			str +='</div>';
			str +='<br>';
		});
	
		$('#pfdReplyArea').html(str);
	}
	
	
	
	
	//yup
	function yup(json){
		alert('!!!!')
		
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



    <!-- row 1: header -->
    <header class="row">
    	<div class="col-lg-4 col-sm-5">
        	<a href="index.jsp"><img src="/LMS/images/KUpEzwG.gif" alt="Wisdom Pets. click for home." class="img-responsive" style="height:200px;"></a>
        </div>
    	<div class="col-lg-8 col-sm-7">
        	<img src="/LMS/images/logo.gif" alt="" class="hidden-xs img-responsive">
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
                            </s:if>                        </ul>                    
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
    	<article class="thumbnail col-lg-10 col-sm-10 col-lg-push-2 col-sm-push-2 "> 
        
            <ol class="breadcrumb">
              <li><a href='<s:property value="#goIndex"/>'>홈</a> <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>커뮤니티 <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li class="active"><a href='<s:property value="#goBbsList"/>'>통합 게시판</a><span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>게시글 읽기</li>
            </ol>
            
            <!--  ====================컨텐츠 부분======================= --> 
            
            
            
            
            
     		 <!--  ====================//컨텐츠 부분======================= --> 
	    </article>	
	        
	
      
      
       	
        <aside class="col-lg-2 col-sm-2 col-lg-pull-10 col-sm-pull-10 ">
       		
       		<div class="thumbnail">
       			<h3>스택 네비게이션</h3>
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#">선택사항1</a></li>
                <li><a href="#">선택사항2</a></li>
                <li><a href="#">선택사항3</a></li>
                <li><a href="#">선택사항4</a></li>
            </ul> 
       		
       		
       		</div>
       
        </aside>
         
        
        
       
       	
         
         
 </div>

 
 
 
 
 
 
 <!-- end row 3 -->       
    	

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
