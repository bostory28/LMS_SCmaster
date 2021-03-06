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
    <!-- 리스트 테이블 CSS 지정 시작 -->
     <link href="<s:url value="/css/bootstrap-table.css"/>" rel="stylesheet">
    <style>
    	.OneofInfo{border:1px solid black;}
    	th{background:SteelBlue;
    	   color:white;}
    	td{background:WhiteSmoke;}
    	.OneofInfoth{background:white;
    				 color:black;
    				 border:1px solid black;}
    </style>
    <script src="../jquery-plugin/mctabs/javascript-tabs.js" type="text/javascript"></script>
    
    <script src="../js/respond.js"></script>
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../jquery-plugin/anythingSlider/jquery.anythingslider.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="<s:url value="/js/bootstrap-tableForSeong.js"/>"></script>
		
    <script type="text/javascript">
    $(document).ready(function() {
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
    function updateForm(){
	     $('#eipDiv').html('<div class="col-lg-1" style="font-weight:bold;font-size:140%">유</div>'
				  		  +'<div class="col-lg-1"><input type="radio" class="form-control" name="student.eip" value=1 checked/></div>'
				  		  +'<div class="col-lg-1" style="font-weight:bold;font-size:140%">무</div>'
						  +'<div class="col-lg-1"><input type="radio" class="form-control" name="student.eip" value=0 /></div>');
	     $('#jlptDiv').html('<select class="form-control" name="student.japanese">'
				  			+'<option>N1</option>'
				  			+'<option>N2</option>'
				  			+'<option>N3</option>'
				  			+'<option>N4</option>'
				  			+'<option>N5</option>'
				  			+'<option>없음</option>'
							+'</select>');
	     $('#emailDiv').html('<input type="email" class="form-control" id="email" name="student.email" value="<s:property value="%{#session.userSign.email}"/>" placeholder="ex)abcde@naver.com">');
	     $('#phoneDiv').html('<input type="text" class="form-control" id="phone" name="student.phone" value="<s:property value="%{#session.userSign.phone}"/>" placeholder="연락처">');
	     $('#updateBtn').html('<button type="submit" class="btn btn-success">수정</button>');
			      
    }
    function loadInfoView(id,name,phone,email,type,birth,propic,confirm){
    	var outhtml="";
    	var confirmChk="";
    	var path='${path}'+propic;
    	if(confirm==1){
    		confirmChk='<a href="javascript:confirm('+"'"+id+"'"+','+type+',1)" class="btn btn-danger">승인취소</a>';
    	}else if(confirm==0){
    		confirmChk='<a href="javascript:confirm('+"'"+id+"'"+','+type+',0)" class="btn btn-success">승인</a>';
    	}
    	outhtml+="<table width=450px; height=250px; style='padding:3px;float:left;'>";
    	outhtml+="<tr><th class='OneofInfoth' colspan=2 style='font-size:40pt;text-align:center;'>Profile</th><th class='OneofInfoth' colspan=2 style='text-align:center;vertical-align:middle;' align='center'>";
    	outhtml+="<center><div style='height:200px; width:160px;'><img src='../upload/"+propic+"' id='infoImg' style='height:200px; width:160px;'/></div></center></th>";
    	outhtml+="<tr><th class='OneofInfoth'>ID</th><td class='OneofInfo'>"+id+"</td><th class='OneofInfoth'>Name</th><td class='OneofInfo'>"+name+"</td></tr>";
    	outhtml+="<tr ><th class='OneofInfoth'>Phone</th><td class='OneofInfo'>"+phone+"</td><th class='OneofInfoth'>E-mail</th><td class='OneofInfo'>"+email+"</td></tr>";
    	outhtml+="<tr ><th class='OneofInfoth'>생년월일</th><td class='OneofInfo'>"+birth.substring(0,10)+"</td><th class='OneofInfoth'>승인여부</th><td class='OneofInfo'>"+confirmChk+"</td></tr>";
    	outhtml+="</table>";
    	$("#loadInfoDiv").html(outhtml);
    	
    }
    function loadInfoViewTeacher(id,name,phone,email,type,birth,propic,confirm){
    	var outhtml="";
    	var confirmChk="";
    	var path='${path}'+propic;
    	if(confirm==1){
    		confirmChk="<a href='javascript:confirm("+'"'+id+'"'+","+type+",1)' class='btn btn-danger'>승인취소</a>";
    	}else if(confirm==0){
    		confirmChk='<a href="javascript:confirm('+"'"+id+"'"+','+type+',0)" class="btn btn-success">승인</a>';
    	}
    	outhtml+="<table width=450px; height=250px; style='padding:3px;float:left;'>";
    	outhtml+="<tr><th class='OneofInfoth' colspan=2 style='font-size:40pt;text-align:center;'>Profile</th><th class='OneofInfoth' colspan=2 style='text-align:center;vertical-align:middle;' align='center'>";
    	outhtml+="<center><div style='height:200px; width:160px;'><img src='../upload/"+propic+"' id='infoImg' style='height:200px; width:160px;'/></div></center></th>";
    	outhtml+="<tr><th class='OneofInfoth'>ID</th><td class='OneofInfo'>"+id+"</td><th class='OneofInfoth'>Name</th><td class='OneofInfo'>"+name+"</td></tr>";
    	outhtml+="<tr><th class='OneofInfoth'>Phone</th><td class='OneofInfo'>"+phone+"</td><th class='OneofInfoth'>E-mail</th><td class='OneofInfo'>"+email+"</td></tr>";
    	outhtml+="<tr><th class='OneofInfoth'>생년월일</th><td class='OneofInfo'>"+birth.substring(0,10)+"</td><th class='OneofInfoth'>승인여부</th><td class='OneofInfo'>"+confirmChk+"</td></tr>";
    	outhtml+="</table>";
    	$("#loadInfoDivTeacher").html(outhtml);
    }
    function confirm(id,type,confirmYN){
		    	if(type==2){
		    		if(confirmYN=='0'){
		    			alert("학생의 승인은 승인페이지를 이용해주세요"); return;
		    			/* location.href='member/studentConfirm.action?id='+id; */
		    		}else if(confirmYN=='1'){
		    			alert("승인취소");
		    			location.href='member/studentconfirmCancel.action?id='+id;
		    	}
		    }else if(type==1){
		    	alert("dd");
		    	if(confirmYN=='0'){
		    		alert("승인하기");
		    		location.href='member/teacherConfirm.action?id='+id;
		    	}else if(confirmYN=='1'){
		    		alert("승인취소");
		    		location.href='member/teacherconfirmCancel.action?id='+id;
		    }
		  }
    }
    function studentAccept(thisId){
    	var flagForAccept = document.getElementById(thisId+"_flag").value;
    	var classForAccept = document.getElementById(thisId+"_ban").value;
    	var japaneseForAccept = document.getElementById(thisId+"_japanese").value;
    	if(flagForAccept==""||classForAccept==""||japaneseForAccept==""){
    		alert("승인을 위해 공백없이 입력해주세요");
    		return false;
    	}
    	location.href='member/studentConfirmAndUpdate.action?flagnum='+flagForAccept+'&class_num='+classForAccept+'&japanese='+japaneseForAccept+'&id='+thisId;
    	alert("dd");
    	/* $.ajax({
				url: 'member/studentConfirmAndUpdate.action',
				type: 'POST',
				dataType: 'json',
				data:{id:thisId,
					  flagnum:flagForAccept,
					  class_num:classForAccept,
					  japanese:japaneseForAccept},
				success: output2
				}); */
    }
    function teacherAccept(thisId){
    	location.href='member/teacherConfirm.action?id='+thisId;
    }
    </script>
    
</head>

<body>
<div class="container">
	
	<s:if test="%{#session.userSign.id!=null}">
				<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
					
		    		<span style="position:relative; left:70%; padding:5px;">
		    		<b>반갑습니다&nbsp;${sessionScope.userSign.id}님&nbsp;</b>
		    		<a href="mypage_details.action" class="btn btn-info btn-sm">마이페이지</a>
		    		&nbsp;
		    		&nbsp;
		    		<a href="logout.action" class="btn btn-danger btn-sm ">로그아웃</a>
		    		</span>
	    		 </div>
		</s:if>
		<s:else>
				<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
			    	<span style="position:relative; left:80%; padding:5px;">
			    		<a href="memberJoinForm.action" class="btn btn-success btn-sm">회원가입</a>
			    		&nbsp;
			    		&nbsp;
			    		<a href="loginForm.action" class="btn btn-primary btn-sm ">로그인</a>
			    	</span>
	    		 </div>
		</s:else>
		
	 <!-- 홈 --> 	
	 	 <s:url value="/index.action" var="goIndex"></s:url>
	 	
	 
	 <!-- 커뮤니티 -->
  		 <!-- 통합게시판으로 이동함 -->
  	 	 <s:url value="/bbs/bbsList.action" var="goBbsList"></s:url>
		

    <!-- row 1: header -->
    <header class="row">
    	<div class="col-lg-4 col-sm-5">
        	<a href="index.action"><img src="../images/KUpEzwG.gif" alt="Wisdom Pets. click for home." class="img-responsive" style="height:200px;"></a>
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
    	<%-- <nav class="navbar navbar-default navbar-inverse nav-justified">
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
                    <li><a href="#">홈</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li class="dropdown"><a href="#" data-toggle="dropdown">학사관리<span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                        	<li><a href="../member/memberManagement.action">회원관리</a></li>
                            <li><a href="../attendance/goAttendanceList.action">출석관리</a></li>
                            <li><a href="../test/testItUi.action">시험관리</a></li>
                            <li><a href="../member/myScoreViewForm.action">성적조회</a></li>
                            <li><a href="../trouble/troubleList.action">상담관리</a></li>
                        </ul>                    
                    </li>
                    
                    <li class="dropdown"><a href="#" data-toggle="dropdown">학습관리 <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                        	<li><a href="../subject/subjectManager.action">강의관리</a></li>
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
         </nav>  --%>
    </div>
   
 
    
    <!-- row 3: article/aside -->
    <div class="row">
    
    	<article class="thumbnail col-lg-9 col-sm-8 col-lg-push-3 col-sm-push-4">
        
            <ol class="breadcrumb">
              <li><a href="index.action">홈</a> <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li class="active">회원관리</li>
            </ol>
            <!-- <div class="row" style="margin-top:0px;"> -->
          <!-- <div class="col-lg-9 col-sm-8 col-lg-push-3 col-sm-push-4" style="margin-top:0px;"> -->
	        <ul id="tabs1" class="mctabs">
	            <li><a href="#view1">승인</a></li>
	            <li><a href="#view2" >선생님</a></li>
	            <li><a href="#view3" >학생</a></li>
	        </ul>
	        <div class="panel-container">
	            <div id="view1">
	            	<div class="col-lg-5">   
		            	<h3>선생님</h3>
		            	<table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-pagination="true" data-search="true">
		            	<thead>
		            		<tr>
		            			<th>아이디</th><th>이름</th><th>승인</th>
		            		</tr>
		            	</thead>
		            	<tbody>
		            		<s:iterator value='teacherListnotConfirmed' status='stat'>
		            			<tr>
		            				<td><s:property value='%{teacherListnotConfirmed[#stat.index].id}'/></td>
		            				<td><s:property value='%{teacherListnotConfirmed[#stat.index].name}'/></td>		            				 
		            				<td>
		            					<s:if test='%{teacherListnotConfirmed[#stat.index].confirm=="0"}'>
		            						<a href="javascript:teacherAccept('<s:property value="%{teacherListnotConfirmed[#stat.index].id}"/>')" class="btn btn-success">승인</a>
		            					</s:if>
		            					<s:elseif test='%{teacherListnotConfirmed[#stat.index].confirm=="1"}'>
		            						<a href="#" class="btn btn-danger">승인취소</a>
		            					</s:elseif>
		            				</td>
		            			</tr>
		            		</s:iterator>
		            	</tbody>
		            	</table>
	            	</div>
	            	<div class="col-lg-7">
		            	<h3>학생</h3> <!--승인페이지의 학생란입니다.  -->
		            	
		            		<table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-pagination="true" data-search="true">
		            		 <thead>
		            			<tr>
		            			<th>아이디&nbsp;</th><th>이름&nbsp;</th><th>기수&nbsp;</th><th>반&nbsp;</th><th>일본어&nbsp;</th><th>승인&nbsp;</th>
		            			</tr>
		            		 </thead>
		            		 <tbody>
			            		<s:iterator value='studentListnotConfirmed' status='stat'>
			            		 
			            			<tr>
			            				<td><s:property value='studentListnotConfirmed[#stat.index].id'/></td>
			            				<td><s:property value='studentListnotConfirmed[#stat.index].name'/></td>
			            				<td><select id="<s:property value="studentListnotConfirmed[#stat.index].id"/>_flag">
			            						<s:iterator value='flagList' status="statF">
			            							<option value="<s:property value="flagList[#statF.index].flag_num"/>"><s:property value="flagList[#statF.index].flag_num"/>기</option>
			            						</s:iterator>
			            				    </select></td>
			            				<td>
			            					<select id="<s:property value="studentListnotConfirmed[#stat.index].id"/>_ban">
			            						<option value="A반">A반</option>
			            						<option value="B반">B반</option>
			            					</select>
			            				</td>
			            				<td>
			            					<select id="<s:property value="studentListnotConfirmed[#stat.index].id"/>_japanese">
			            						<option value="상">상</option>
			            						<option value="중">중</option>
			            						<option value="하">하</option>
			            					</select>
			            				</td> 
			            				<td>
			            				
			            					<s:if test='%{studentListnotConfirmed[#stat.index].confirm==0}'>
			            						<a href="javascript:studentAccept('<s:property value="studentListnotConfirmed[#stat.index].id"/>')" class="btn btn-success" >승인</a>
			            					</s:if>
			            					<s:elseif test='%{studentListnotConfirmed[#stat.index].confirm==1}'>
			            						<a href="#" class="btn btn-danger">승인취소</a>
			            					</s:elseif>
			            				</td>
			            			</tr>
			            		</s:iterator>
		            		 </tbody>
		            		</table>
	            	</div>
	            	<!--  <ul id="tabs2" class="mctabs" >
	                    <li><a href="#view2-1">선생님</a></li>
	                    <li><a href="#view2-2">학생</a></li>
                	</ul>        
	                <div class="panel-container" style="border:2px solid #CCC; border-radius:5px;">
	                    <div id="view2-1" style="padding:30px;">
	                    	<ul>
	                    		<li>승인을 기다리는 선생님의 회원목록입니다.</li>
	                    	</ul>
	                    </div>
	                    <div id="view2-2" style="padding:30px;">
	                        <ul>
	                            <li>승인을 기다리는 학생의 회원목록입니다.</li>
	                        </ul>
	                    </div>
	                </div>     -->  
	            </div>
	            <div id="view2">
	                    <!-- 선생님의정보를보여줍니다. --> 
	               <div class="col-lg-5" id="teacherList">
	               <table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-pagination="true" data-search="true">
	               <thead>
	               <tr><th>ID</th><th>이름</th></tr>
	               </thead>
	               <tbody>
	               	 <s:iterator value="teacherList" status="stat">
		               	 <tr>
		               	 <td>
		               	 	<s:property value="%{teacherList[#stat.index].id}"/>
		               	 </td>
		               	 <td>
		               	 	<s:a href="javascript:loadInfoViewTeacher('%{teacherList[#stat.index].id}','%{teacherList[#stat.index].name}','%{teacherList[#stat.index].phone}','%{teacherList[#stat.index].email}',%{teacherList[#stat.index].type},'%{teacherList[#stat.index].birth}','%{teacherList[#stat.index].propic}',%{teacherList[#stat.index].confirm})">
		               	 		<s:property value="%{teacherList[#stat.index].name}"/><!-- %{studentList[#stat.index].eip},'%{studentList[#stat.index].jlpt}','%{studentList[#stat.index].japanese} '%{studentList[#stat.index].class_num}''%{studentList[#stat.index].flagnum}'-->
		               	 	</s:a>
		               	 </td>
		               	 </tr>	
	               	 </s:iterator>
	               	</tbody>
	               </table>
	               </div>
	               <div class="col-lg-offset-5" id="loadInfoDivTeacher"></div>
	            </div>
	            <div id="view3">
	                   <!--  학생의정보를보여줍니다.  -->
	               <div class="col-lg-5" id="studentList">
	               <table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-pagination="true" data-search="true">
	               <thead>
	                <tr><th>ID</th><th>이름</th></tr>
	               </thead>
	               <tbody>       
	               	 <s:iterator value="studentList" status="stat">
	               	 	<tr>
	               	 		<td>
	               	 			<s:property value="%{studentList[#stat.index].id}"/>
		               	 	</td>
		               	 	<td>
		               	 		<s:a href="javascript:loadInfoView('%{studentList[#stat.index].id}','%{studentList[#stat.index].name}','%{studentList[#stat.index].phone}','%{studentList[#stat.index].email}',%{studentList[#stat.index].type},'%{studentList[#stat.index].birth}','%{studentList[#stat.index].propic}',%{studentList[#stat.index].confirm})">
			               	 		<s:property value="%{studentList[#stat.index].name}"/><!-- %{studentList[#stat.index].eip},'%{studentList[#stat.index].jlpt}','%{studentList[#stat.index].japanese} '%{studentList[#stat.index].class_num}''%{studentList[#stat.index].flagnum}'-->
			               	 	</s:a>
		               	 	</td>
	               	 	</tr>
	               	 </s:iterator>
	               	</tbody>
	                </table>
	               </div>
	               <div class="col-lg-offset-5" id="loadInfoDiv"></div>
	            </div>
	        </div>
	    <!-- </div> -->
         <div class="clearfix visible-xs visible-lg"></div>
           
        </article>
         
     	<aside class="col-lg-3 col-sm-4 col-lg-pull-9 col-sm-pull-8 ">
       		<div class="thumbnail">
      			<h3>학사관리</h3>
	            <ul class="nav nav-pills nav-stacked">
	                <s:if test="#session.userSign.type == 0">
		        		<li class="active"><a href="../member/memberManagement.action">회원관리</a></li>
		                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view1">- 회원승인</a><br>
		                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view2">- 선생님</a><br>
		                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view3">- 학생</a><br>
	            	</s:if>
	        		 	<li ><a href="../attendance/goAttendanceList.action">출석관리</a></li>
                	<s:if test="#session.userSign.type == 0 || #session.userSign.type == 1">
	                	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../attendance/goAttendanceCheck.action">- 출석체크</a>
	               	</s:if>
	            	<s:if test="#session.userSign.type == 0 || #session.userSign.type == 1">
	              		 <li><a href="../test/testItUi.action">시험관리</a></li>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/testItUi.action">- IT과목별시험</a><br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/itCapacity.action">- IT역량평가</a><br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/japDaily.action">- 일본어매일시험</a><br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/japMonth.action">- 일본어월말시험</a><br>
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
