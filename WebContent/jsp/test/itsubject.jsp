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
	<style type="text/css">
		
	</style>
    <script type="text/javascript">
    $(document).ready(function() {
    	$('a.btn-info').tooltip();
		$('#slider').anythingSlider({
			buildArrows : false,
			autoPlay : true,
			buildStartStop : true
		});
		//일괄등록
		$('#subjectbtn').click(function() {
			 cw=screen.availWidth;     //화면 넓이
			 ch=screen.availHeight;    //화면 높이

			 sw=600;    //띄울 창의 넓이
			 sh=380;    //띄울 창의 높이

			 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치

			window.open('insertSubjectForm.action', 'insertSubjectForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
		});
		//검색기능
		$('#searchbtn').click(search);
		//기수를 바꾸었을 경우 과목이 유동적으로 변화되기 위해
		$('#flag').change(function() {
			var flag = $('#flag').val();
			location.href="testItUi.action?flag=" + flag + "&field=IT";
		});
		//insert, edit했을 경우 원래ajax화면으로 가기
		var check_open = $('#check_open').val();
		if(check_open == 'true') {
			var flag = $('#flag_open').val();
	    	var online = $('#online_open').val();
	    	var subject = $('#subject_open').val();
	    	var class_num = $('#class_num_open').val();
	    	$.ajax({
				url:'searchSubject.action',
				type:'post',
				dataType:'json',
				data:{flag:flag, online:online, subject:subject, class_num:class_num},
				success:output
			});
		}
    }); // end ready
    
    function editForm(subjectname, testname, flag) {
    	 cw=screen.availWidth;     //화면 넓이
		 ch=screen.availHeight;    //화면 높이

		 sw=600;    //띄울 창의 넓이
		 sh=380;    //띄울 창의 높이

		 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
		 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
    	window.open('editSubjectForm.action?&subjectname='+subjectname+ '&flag='+flag+ '&testname='+testname, 'editSubjectForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
    }
    
    function search() {
    	var flag = $('#flag').val();
    	var online = $('#online').val();
    	var subject = $('#subject').val();
    	var class_num = $('#class_num').val();
    	$.ajax({
			url:'searchSubject.action',
			type:'post',
			dataType:'json',
			data:{flag:flag, online:online, subject:subject, class_num:class_num},
			success:output
		});
    }
    
    function output(json) {
    	var session = '<s:property value="#session.userSign.id"/>';
    	//ajax를 이용한 것이 talbe에 뿌려진 실재 내용
    	var str = '<br><b style="text-align: center; font-size: 20px;">'+ json.flag +'기 IT</b><table border="0" class="table table-condensed" style="text-align: center;">';
    	var s = 1;
    	var c = 0;
    	
    	var avg = 0;
    	var sum = 0;
    	var count = 0;
    	var m = 0;
    	for(var j = 0; j < json.list_class.length; j++) {
    		for (var i = 0; i < json.list_test.length; i++) {
	    		if(json.list_test[i].class_num == json.list_class[j] && s == 1) {
	    			if(json.subject != '전체') {
		    			str += "<tr><td colspan='10'> <b style='font-size: 18px'>과목명 : "+ json.list_test[i].subjectname +"	&nbsp; &nbsp;&nbsp; 강사명 : "+ json.list_test[i].teachername +"</b></td></tr>";
	    			}
		    		str += "<tr class='success'><td>기수</td><td>반</td><td>과목</td><td>시험명</td><td>온라인</td><td>시작날짜</td><td>종료날짜</td><td>시험시간(분)</td><td>성적평균</td><td>성적입력</td></tr>";
		    		s = 0;
	    		}
	    		if(json.list_test[i].class_num == json.list_class[j]) {
	    			if(json.list_grade[i] == "") {
			    		str += "<tr><td>"+json.list_test[i].flag+"</td><td>"+json.list_test[i].class_num+"</td><td>"+json.list_test[i].subjectname+"</td><td>"+json.list_test[i].testname+"</td><td>"+json.list_test[i].type+"</td><td>"+json.list_test[i].startdate+"</td><td>"+json.list_test[i].enddate+"</td><td>"+json.list_test[i].limittime+"</td><td></td><td>";
			    		if(session == json.list_test[i].teacherid || session == 'admin') {
			    			str += "<input type='button' class='gradebtn' flag='"+json.list_test[i].flag+"' class_num='"+json.list_test[i].class_num+"' subjectid='"+json.list_test[i].subjectid+"' testid='"+json.list_test[i].testid+"' type_on='"+ json.list_test[i].type +"' value='성적입력'></td></tr>";
			    		} else {
			    			str += "<input type='button' class='gradedisablebtn' flag='"+json.list_test[i].flag+"' class_num='"+json.list_test[i].class_num+"' subjectid='"+json.list_test[i].subjectid+"' testid='"+json.list_test[i].testid+"' type_on='"+ json.list_test[i].type +"' value='성적입력'></td></tr>";
			    		}
			    		c++;
	    			} else {
	    				str += "<tr><td>"+json.list_test[i].flag+"</td><td>"+json.list_test[i].class_num+"</td><td>"+json.list_test[i].subjectname+"</td><td>"+json.list_test[i].testname+"</td><td>"+json.list_test[i].type+"</td><td>"+json.list_test[i].startdate+"</td><td>"+json.list_test[i].enddate+"</td><td>"+json.list_test[i].limittime;
	    				for(var k = 0; k < json.list_grade[i].length; k++) {
	    					sum += json.list_grade[i][k].score;
	    					count++;
	    				}
	    				avg = sum / count;
				    	str += "</td><td>"+ avg.toFixed(1) +"</td><td>";
				    	if(session == json.list_test[i].teacherid || session == 'admin') {
			    			str += "<input type='button'  class='editgradebtn' flag='"+json.list_test[i].flag+"' class_num='"+json.list_test[i].class_num+"' subjectname='"+json.list_test[i].subjectname+"' subjectid='"+json.list_test[i].subjectid+"' testid='"+json.list_test[i].testid+"' type_on='"+ json.list_test[i].type +"' value='성적수정'></td></tr>";
				    	} else {
				    		str += "<input type='button'  class='editgradedisablebtn' flag='"+json.list_test[i].flag+"' class_num='"+json.list_test[i].class_num+"' subjectname='"+json.list_test[i].subjectname+"' subjectid='"+json.list_test[i].subjectid+"' testid='"+json.list_test[i].testid+"' type_on='"+ json.list_test[i].type +"' value='성적수정'></td></tr>";
				    	}
			    		sum = 0; avg = 0; count = 0;
			    		c++;
	    			}
	    		}
	    		if(c != 0) {
	    			if(json.list_test[i].class_num != json.list_class[j]) {
    					for(m; m < c; m++) {
		    				for(var k = 0; k < json.list_grade[m].length; k++) {
		    					sum += json.list_grade[m][k].score;
		    					count++;
		    				}
	    				}
	    				avg = sum / count;
	           			str += "<tr><td colspan='9' style='text-align: right; font-weight: bold;'>평균 :"+ avg.toFixed(1) +"</td><td></td></tr>";
	           			s = 1; c = 0; count = 0; sum = 0; avg = 0;
	           			break;
	           		}
	    			if((j == json.list_class.length - 1) && (i == json.list_test.length - 1)) {
	    				for(m; m <= i; m++) {
		    				for(var k = 0; k < json.list_grade[m].length; k++) {
		    					sum += json.list_grade[m][k].score;
		    					count++;
		    				}
	    				}
	    				avg = sum / count;
	    				str += "<tr><td colspan='9' style='text-align: right; font-weight: bold;'>평균 :"+ avg.toFixed(1) +"</td><td></td></tr>";
	    			}
	    		} else {
	    			s = 1;
	    			c = 0;
	    		}
    		}
    	}
    	str += '</table>';
    	$('#table').html(str);
    	$('.gradedisablebtn').addClass('btn btn-primary disabled');
    	$('.gradebtn').addClass('btn btn-primary');
    	$('.gradebtn').click(function() {
    		//table에서 뿌려진 실재 값을 가져온다.
			var flag = $(this).attr('flag');
			var class_num = $(this).attr('class_num');
			var subjectid = $(this).attr('subjectid');
			var testid = $(this).attr('testid');
			var type = $(this).attr('type_on');
			//search한것의 정보를 저장하기 위해
			var flag_search = $('#flag_search').val();
	    	var online_search = $('#online').val();
	    	var subject_search = $('#subject').val();
	    	var class_num_search = $('#class_num').val();
	    	
	    	 cw=screen.availWidth;     //화면 넓이
			 ch=screen.availHeight;    //화면 높이

			 sw=550;    //띄울 창의 넓이
			 sh=500;    //띄울 창의 높이

			 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
	    	
			window.open('insertGradeForm.action?&teasubteavo.flag='+flag+ '&teasubteavo.class_num='+class_num+ '&teasubteavo.subjectid='+subjectid+'&teasubteavo.testid='+testid+'&teasubteavo.type='+type +'&flag='+flag_search +'&online='+online_search +'&subject='+subject_search +'&class_num='+class_num_search, 'insertGradeForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
		});
    	$('.editgradedisablebtn').addClass('btn btn-success disabled');
    	$('.editgradebtn').addClass('btn btn-success');
    	$('.editgradebtn').click(function() {
    		//table에서 뿌려진 실재 값을 가져온다.
    		var flag = $(this).attr('flag');
			var class_num = $(this).attr('class_num');
			var subjectname = $(this).attr('subjectname');
			var subjectid = $(this).attr('subjectid');
			var testid = $(this).attr('testid');
			var type = $(this).attr('type_on');
			//search한것의 정보를 저장하기 위해
			var flag_search = $('#flag').val();
	    	var online_search = $('#online').val();
	    	var subject_search = $('#subject').val();
	    	var class_num_search = $('#class_num').val();
	    	
	    	 cw=screen.availWidth;     //화면 넓이
			 ch=screen.availHeight;    //화면 높이

			 sw=550;    //띄울 창의 넓이
			 sh=500;    //띄울 창의 높이

			 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
	    	
			window.open('editGradeForm.action?teasubteavo.flag='+flag+ '&teasubteavo.class_num='+class_num+ '&teasubteavo.subjectname='+subjectname+ '&teasubteavo.subjectid='+subjectid+'&teasubteavo.testid='+testid+'&teasubteavo.type='+type+'&flag='+flag_search +'&online='+online_search +'&subject='+subject_search +'&class_num='+class_num_search, 'editGradeForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
		});
    }
    </script>
</head>

<body>
<input type="hidden" id="check_open" value="<s:property value="check_open"/>">
<input type="hidden" id="flag_open" value="<s:property value="flag"/>">
<input type="hidden" id="class_num_open" value="<s:property value="class_num"/>">
<input type="hidden" id="subject_open" value="<s:property value="subject"/>">
<input type="hidden" id="online_open" value="<s:property value="online"/>">
<div class="container">


	<!------------- 로그인, 회원가입, 마이페이지, 로그아웃관련 부분  시작------------------------- -->
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
<!-- 네비게이션의 액션을 정리하는곳 -->
	 <!-- 홈 --> 	
	 	 <s:url value="/index.action" var="goIndex"></s:url>
	 	
	 
	 <!-- 커뮤니티 -->
  		 <!-- 통합게시판으로 이동함 -->
  	 	 <s:url value="/bbs/bbsList.action" var="goBbsList"></s:url>
   









    <!-- row 1: header -->
    <header class="row">
    	<div class="col-lg-4 col-sm-5">
        	<a href='<s:property value="#goIndex"/>'><img src="<s:url value="/images/KUpEzwG.gif"/>" alt="Wisdom Pets. click for home." class="img-responsive" style="height:200px;"></a>
        </div>
    	<div class="col-lg-8 col-sm-7">
        	<img src="<s:url value="/images/logo.gif"/>" alt="" class="hidden-xs img-responsive">
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
    <!-- row 3: article/aside -->
    <div class="row">
    	<article class="thumbnail col-lg-9 col-sm-8 col-lg-push-3 col-sm-push-4">
            <ol class="breadcrumb">
              <li><a href="../index.action">홈</a><span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>학사관리<span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>시험관리<span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li><a href="./testItUi.action">IT과목별시험</a></li>
            </ol>
            
       		<!-- 전체시험리스트 보여지는 부분 -->
       		<table align="center" border="0" width="100%">
       				<tr>
       					<td colspan="2" width="10%" style="text-align: center;">
       						기수
       					</td>
       					<td rowspan="2">
       						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
       						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b style="font-size: 30px;">[과목별시험리트스]</b>
       					</td>
       				</tr>
       				<tr>
       					<td>
       						<select id="flag" class="form-control">
								<option selected="selected"><s:property value="flag"/></option>
				            	<s:iterator value="list_flag" status="stat">
				            		<s:if test="list_flag[#stat.index].flag_num != flag">
						        		<option><s:property value="list_flag[#stat.index].flag_num"/></option>
					        		</s:if>
					        	</s:iterator>
							</select>
       					</td>	
       				</tr>
       			</table>
       		
       		
       		<div>
       			<table border="0" class="table table-striped" style="text-align: center;">
       				<tr  class="success">
       					<td>삭제</td>
       					<td>과목</td>
       					<td>기수</td>
       					<td>온라인</td>
       					<td>시험명</td>
       					<td>시험시작날짜</td>
       					<td>시험종료날짜</td>
       					<td>시험시간(분)</td>
       					<td>수정</td>
       				</tr>
   					<s:iterator value="list_test" status="stat">
   					<tr>
   						<td>
   							<s:if test="#session.userSign.type == 0">
	   							<a href="deleteTest.action?subjectname=<s:property value="list_test[#stat.index].subjectname"/>&testname=<s:property value="list_test[#stat.index].testname"/>&flag=<s:property value="list_test[#stat.index].flag"/>">
	   								<img src="../images/x_button.png" width="20" height="20" alt="x_button">
	   							</a>
   							</s:if>
   							<s:else>
								<img src="../images/x_button.png" style="FILTER:alpha(opacity=90, style=2, finishopacity=70);opacity:0.3;" width="20" height="20" alt="x_button">
   							</s:else>
   						</td>
   						<td><s:property value="list_test[#stat.index].subjectname"/></td>
   						<td><s:property value="list_test[#stat.index].flag"/></td>
   						<td><s:property value="list_test[#stat.index].type"/></td>
   						<td><s:property value="list_test[#stat.index].testname"/></td>
   						<td><s:property value="list_test[#stat.index].startdate"/></td>
   						<td><s:property value="list_test[#stat.index].enddate"/></td>
   						<td><s:property value="list_test[#stat.index].limittime"/></td>
   						<s:if test="#session.userSign.type == 0">
   							<td><input type="button" value="일괄수정" class='btn btn-success' id="unitedEdit" onclick="javascript:editForm('<s:property value="list_test[#stat.index].subjectname"/>','<s:property value="list_test[#stat.index].testname"/>','<s:property value="list_test[#stat.index].flag"/>');"></td>
   						</s:if>
   						<s:else>
   						
   							<td><input type="button" value="일괄수정" class='btn btn-success disabled' id="unitedEdit" onclick="javascript:editForm('<s:property value="list_test[#stat.index].subjectname"/>','<s:property value="list_test[#stat.index].testname"/>','<s:property value="list_test[#stat.index].flag"/>');"></td>
   						</s:else>
   					</tr>
   					</s:iterator>
       			</table>
       		</div>
       		<s:if test="#session.userSign.type == 0">
       			<input type="button" class="btn btn-primary" value="과목별시험일괄등록" id="subjectbtn"><br><br>
       		</s:if>
       		<s:else>
       			<input type="button" class="btn btn-primary disabled" value="과목별시험일괄등록" id="subjectbtn"><br><br>
       		</s:else>
       		<!-- 검색기능 -->
       		 <p style="text-align: center; font-size: 30px;"><b>[과목별시험검색]</b><p>
       		 <table style="text-align: center;" align="center">
       		 	<tr>
       		 		<td>기수</td>
       		 		<td>반</td>
       		 		<td>온라인</td>
       		 		<td>과목</td>
       		 		<td></td>
       		 	</tr>
       		 	<tr>
       		 		<td>
       		 			<select id="flag_search" class="form-control">
							<option selected="selected"><s:property value="flag"/></option>
			            	<s:iterator value="list_flag" status="stat">
			            		<s:if test="list_flag[#stat.index].flag_num != flag">
					        		<option><s:property value="list_flag[#stat.index].flag_num"/></option>
				        		</s:if>
				        	</s:iterator>
						</select>
       		 		</td>
       		 		<td>
       		 			<select id="class_num" class="form-control">
				        	<option>전체</option>
				        	<s:iterator value="list_class" status="stat">
				        		<option><s:property value="list_class[#stat.index]"/></option>
				        	</s:iterator>
						</select>
       		 		</td>
       		 		<td>
	       		 		<select id="online" class="form-control">
				        	<option>NO</option>
				        	<option>YES</option>
						</select>
       		 		</td>
       		 		<td>
	       		 		<select id="subject" class="form-control">
				        	<option>전체</option>
				        	<s:iterator value="list_subject" status="stat">
					        	<option><s:property value="list_subject[#stat.index].subjectname"/></option>
				        	</s:iterator>
						</select>
       		 		</td>
       		 		<td>
       		 			<input type="button" value="검색" id="searchbtn" class="btn btn-warning"><br>
       		 		</td>
       		 	</tr>
       		 </table>
       		
       		<!-- ajax사용했을 경우 보여지는 부분 -->
       		<div id="table">
       		</div>
        </article>
        <!--본 영역이 메인프레임영역입니다 -->
        
        <aside class="col-lg-3 col-sm-4 col-lg-pull-9 col-sm-pull-8 ">
      		<div class="thumbnail">
      			<h3>학사관리</h3>
	            <ul class="nav nav-pills nav-stacked">
	                <s:if test="#session.userSign.type == 0">
		        		<li><a href="../member/memberManagement.action">회원관리</a></li>
		                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view1">- 회원승인</a><br>
		                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view2">- 선생님</a><br>
		                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view3">- 학생</a><br>
	            	</s:if>
	        		 	<li ><a href="../attendance/goAttendanceList.action">출석관리</a></li>
                	<s:if test="#session.userSign.type == 0 || #session.userSign.type == 1">
	                	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../attendance/goAttendanceCheck.action">- 출석체크</a>
	               	</s:if>
	            	<s:if test="#session.userSign.type == 0 || #session.userSign.type == 1">
	              		 <li class="active"><a href="../test/testItUi.action">시험관리</a></li>
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
</div>
</body>
</html>
