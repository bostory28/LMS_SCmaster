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
  		$("#id").click(idCheckOpen);
    	$('a.btn-info').tooltip();
		$('#slider').anythingSlider({
			buildArrows : false,
			autoPlay : true,
			buildStartStop : true
		
			
		});
		$("#profile").change(function(){
	        readURL(this);
	    });
    }); // end ready
		
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();            
            reader.onload = function (e) {
                $('#target').attr('src', e.target.result);
            };
            
            reader.readAsDataURL(input.files[0]);
        }
    }//profile사진 미리보기
    function infoCheck(){
    	var id = $("#id").val();
    	var idChk = /^[가-힣ㄱ-ㅎㅏ-ㅣ]+$/;
    	var idChk2 = /[A-Z]/;
    	
    	var pass = $("#inputPassword1").val();
    	var passchk = $("#inputPassword2").val();
    	var passchk2 = /[A-Z]|[1-9]/;
    	var birth = $("#birth").val();
    	var birthChk = /\d{8}/; //연속되는 8개의숫자
    	var name = $("#name").val();
    	var phone = $("#phone").val();
    	var email = $("#email").val();
    	if(pass!=passchk){
    		alert("비밀번호를 확인하세요");
    		return false;
    	}else if(!passchk2.test(pass)){
    		alert("비밀번호는 영문과 숫자의 조합입니다");
    		return false;
    	/* }else if(id.length<6 || pass.length<6){
    		alert("아이디,비밀번호의 길이는 6자 이상입니다");
    		return false; */
    	}else if(!passchk2.test(pass)){
    		alert("비밀번호는 숫자와문자로 입력하세요");
    		return false;
    	}
    	if(!birthChk.test(birth)){
    		alert("올바른 형식으로 입력해주세요.(생년월일)");
    		return false;
    	}
    	if(idChk.test(id)){
    		alert("아이디는 영문으로 입력해주세요");
    		return false;
    	}
    	if(id==""||pass==""||birth==""||name==""||phone==""||email==""){
    		alert("공백없이 입력하세요");
    		return false;
    	}
    	return true;
    }
    function idCheckOpen() {
    	window.open("goIdCheckForm.action","newwin","top=200,left=400,width=400,height=200,resizable=no");
    }
    </script>
    
</head>

<body>
<div class="container">

	<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
    	<span style="position:relative; left:80%; padding:5px;">
    		<a href="#" class="btn btn-success btn-sm">회원가입</a>
    		&nbsp;
    		&nbsp;
    		<a href="loginForm.action" class="btn btn-primary btn-sm ">로그인</a>
    	</span>
    
    </div>
    
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





	<!-- 네비게이션의 액션을 정리하는곳 -->
	 <!-- 홈 --> 	
	 	 <s:url value="/index.action" var="goIndex"></s:url>
	 	
	 
	 <!-- 커뮤니티 -->
  		 <!-- 통합게시판으로 이동함 -->
  	 	 <s:url value="/bbs/bbsList.action" var="goBbsList"></s:url>
   
	

	

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
                        	<li><a href="memberManagement.action">회원관리</a></li>
                            <li><a href="#">출석관리</a></li>
                            <li><a href="#">성적관리</a></li>
                            <li><a href="#">상담관리</a></li>
                        </ul>                    
                    </li>
                    
                    <li class="dropdown"><a href="#" data-toggle="dropdown">학습관리 <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                        	<li><a href="#">강의관리</a></li>
                            <li><a href="#">강의목록</a></li>
                            <li><a href="#">일정관리</a></li>
                        </ul>                    
                    </li>
                    
                     
                    <li class="dropdown"><a href="#" data-toggle="dropdown">커뮤니티 <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                        	<li><a href='<s:property value="#goBbsList"/>'>통합 게시판</a></li>
                            <li><a href="#">외국어 게시판</a></li>
                        </ul>                    
                    </li>
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
              <li>회원가입</li>
            </ol>
        	
        </article>
        <div class="col-lg-offset-1">
        	<form action="memberJoin.action" method="post" onsubmit="return infoCheck();" class="form-horizontal" role="form" id="joinform" enctype="multipart/form-data">
        		<div class="col-lg-1"></div>
        		<div class="col-lg-2" style="width:100px">
        			<div id="targetBox" style="height:120px;width:100px;border:1px solid black;">
        			 <img id="target" src="#" alt="your image" height="120px" width="100px"/>
        			</div>
        			 <input type="file" id="profile" name="upload"/>
        		</div>
        		<div class="col-lg-9">
					  <div class="form-group">
					    <label for="inputEmail1" class="col-lg-offset-1 col-lg-2 control-label">아이디</label>
					    <div class="col-lg-5">
					      <input type="text" class="form-control" id="id" name="student.id" placeholder="아이디">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword1" class="col-lg-offset-1 col-lg-2 control-label">비밀번호</label>
					    <div class="col-lg-5">
					      <input type="password" class="form-control" id="inputPassword1" name="student.password" placeholder="비밀번호">
					    </div>
					  </div>
					  <div class="form-group">
					  	<label for="inputPassword2" class="col-lg-offset-1 col-lg-2 control-label">비밀번호 확인</label>
					  	<div class="col-lg-5">
					      <input type="password" class="form-control" id="inputPassword2" placeholder="비밀번호 확인">
					      <input type="hidden" name="student.type" value="2">			    
					  	</div>
					  </div>
				</div><!-- 업로드이미지자리를위한 form의 div묶음 -->
					  <div class="form-group">
					  	<label for="name" class="col-lg-offset-1 col-lg-2 control-label">이름</label>
					  	<div class="col-lg-5">
					  		<input type="text" class="form-control" id="name" name="student.name" placeholder="이름">
					  	</div>
					  </div>
					  <div class="form-group">
					  	<label for="phone" class="col-lg-offset-1 col-lg-2 control-label">전화번호</label>
					  	<div class="col-lg-5">
					  		<input type="text" class="form-control" id="phone" name="student.phone" placeholder="전화번호">
					  	</div>
					  </div>
					  
					  <div class="form-group">
					  	<label for="email" class="col-lg-offset-1 col-lg-2 control-label">이메일</label>
					  	<div class="col-lg-5">
					  		<input type="email" class="form-control" id="email" name="student.email" placeholder="ex)abcde@naver.com">
					  	</div> <!-- <div class="pull-left">@</div>
					  	<div class="col-lg-3">
					  		<select class="form-control" id="email2">
							  <option>naver.com</option>
							  <option>hanmail.net</option>
							  <option>nate.com</option>
							  <option>gmail.com</option>
							  <option>etc..</option>
							</select>
		
					  	</div> -->
					  	
					  </div>	
					  <div class="form-group">
					  	<label for="birth" class="col-lg-offset-1 col-lg-2 control-label">생년월일</label>
					  	<div class="col-lg-5">
					  		<input type="text" class="form-control" id="birth" name="student.birth" placeholder="ex)19860919">
					  	</div>
					  </div>	
					  <div class="form-group">
					  	<div class="col-lg-offset-1" style="font-weight:bold; font-size:140%;">자격유무</div>
					  	<div class="col-lg-offset-2 col-lg-9"><hr size=1></div>
					  </div>
					  
					  <div class="form-group">
					  	<label for="license" class="col-lg-offset-2 col-lg-2 control-label">정보처리(산업)기사</label>
					  	<div class="col-lg-1" style="font-weight:bold;font-size:140%">유</div>
					  	<div class="col-lg-1"><input type="radio" class="form-control" name="student.eip" value=1 checked/></div>
					  	<div class="col-lg-1" style="font-weight:bold;font-size:140%">무</div>
						<div class="col-lg-1"><input type="radio" class="form-control" name="student.eip" value=0 /></div>
					  </div>
					  <div class="form-group">
					  	<label for="license" class="col-lg-offset-2 col-lg-2 control-label">JLPT</label>
					  	<div class="col-lg-3">
					  		<select class="form-control" name="student.jlpt">
							  <option>N1</option>
							  <option>N2</option>
							  <option>N3</option>
							  <option>N4</option>
							  <option>N5</option>
							  <option>없음</option>
							</select>
		
					  	</div>
					  </div>
					  <div class="form-group">
					    <div class="col-lg-offset-7 ">
					      <button type="submit" class="btn btn-default">Sign up</button>
					    </div>
					  </div>
			</form>
        </div><!-- form -->
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
