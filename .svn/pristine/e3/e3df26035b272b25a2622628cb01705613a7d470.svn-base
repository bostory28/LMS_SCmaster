<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>3조 프로젝트</title>
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
		$('a.btn-info').tooltip();
		$('#slider').anythingSlider({
			buildArrows : false,
			autoPlay : true,
			buildStartStop : true
		});
		
		$('#flag').change(function() {
			var flag = $('#flag').val();
			location.href="itCapacity.action?flag=" + flag + "&field=IT";
		});
		$('#capacitybtn').click(function() {
			 cw=screen.availWidth;     //화면 넓이
			 ch=screen.availHeight;    //화면 높이

			 sw=600;    //띄울 창의 넓이
			 sh=360;    //띄울 창의 높이

			 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
			window.open('capacityInsertForm.action', 'capacityInsertForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
		});
		$('.editcapacitydisable').addClass('btn btn-success disabled');
		$('.editcapacity').addClass('btn btn-success');
		$('.editcapacity').click(function() {
			var testname = $(this).attr('testname');
			var flag = $(this).attr('flag');
			 cw=screen.availWidth;     //화면 넓이
			 ch=screen.availHeight;    //화면 높이

			 sw=600;    //띄울 창의 넓이
			 sh=360;    //띄울 창의 높이

			 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
			window.open('editCapacityForm.action?testname='+testname+'&flag='+flag, 'editCapacityForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
		});
		$('.insertgradedisablebtn').addClass('btn btn-primary disabled');
		$('.insertgradebtn').addClass('btn btn-primary');
		$('.insertgradebtn').click(function() {
			var testname = $(this).attr('testname');
			var flag = $(this).attr('flag');
			 cw=screen.availWidth;     //화면 넓이
			 ch=screen.availHeight;    //화면 높이

			 sw=550;    //띄울 창의 넓이
			 sh=500;    //띄울 창의 높이

			 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
			window.open('insertCapacityGradeForm.action?testname='+testname+'&flag='+flag, 'insertCapacityGradeForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
		});
		$('.editgradedisablebtn').addClass('btn btn-success disabled');
		$('.editgradebtn').addClass('btn btn-success');
		$('.editgradebtn').click(function() {
			var testname = $(this).attr('testname');
			var flag = $(this).attr('flag');
			 cw=screen.availWidth;     //화면 넓이
			 ch=screen.availHeight;    //화면 높이

			 sw=550;    //띄울 창의 넓이
			 sh=500;    //띄울 창의 높이

			 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
			window.open('editCapacityGradeForm.action?testname='+testname+'&flag='+flag, 'insertCapacityGradeForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
		});
		$('.showgradedisablebtn').addClass('btn btn-info disabled');
		$('.showgradebtn').addClass('btn btn-warning');
		$('.showgradebtn').click(function() {
			var testname = $(this).attr('testname');
			var flag = $(this).attr('flag');
			$.ajax({
				url:'showStudentCapacityGrade.action',
				type:'post',
				dataType:'json',
				data:{testname:testname, flag:flag},
				success:function(json) {
					var str = "";
					var table = "";
					var i = 0;
					var j = 0;
					var count = 5;
					while(true) {
						if(i % 5 == 0 || i == 0 ) {
							str += "<br><br><table style='text-align:center;' border='0' class='table table-condensed'>";
							if(i == 0) {
								str += "<tr class='success'><td style='font-weight: bold;'>기수 : "+ json.list_test[0].flag +"</td><td style='text-align:left; font-weight: bold;'>시험명 : "+ json.list_test[0].testname +"</td></tr>";
							} else {
								str += "<tr style='height: 31px' class='success'><td></td><td></td></tr>";
							}
							str += "<tr><td style='width: 210px'>이름</td><td style='width: 210px'>성적</td></tr>";
							count = count * ++j;
						}
						if(i < count) {
							if(json.list_test.length == i) {
								str += "</table>";
								table = "table" + parseInt(i/5+1);
								$('#'+ table).html(str);
								break;
							}
							str += "<tr><td>"+ json.list_test[i].name +"</td><td>"+ json.list_test[i].score +"</td></tr>";
							i++;
							if(i == count) {
								count = 5;
								str += "</table>";
								table = "table" + (i/5);
								$('#'+ table).html(str);
								str = "";
							}
						}
					}
				}
			});
			
		});
	});
</script>
</head>
<body>
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
              <li><a href="./itCapacity.action">IT역량평가</a></li>
            </ol>
       		<div>
       			<table align="center" border="0" width="100%">
       				<tr>
       					<td colspan="2" width="10%" style="text-align: center;">
       						기수
       					</td>
       					<td rowspan="2">
       						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
       						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b style="font-size: 30px">[역량평가시험리트스]</b>
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
       			<div style="float: left">
       				<div style="float: left"><b style="font-size: 15px"></b></div>
	       			 
       			</div>
	       			<div >
	       				<p style="text-align: center; font-size: 20px;">
	       			</div>
       			<p>
       			<table border="0" class="table table-striped" style="text-align: center;">
       				<tr class="success">
       					<td>삭제</td>
       					<td>기수</td>
       					<td>시험명</td>
       					<td>시험시작날짜</td>
       					<td>시험종료날짜</td>
       					<td>시험시간(분)</td>
       					<td>평균</td>
       					<td>성적입력</td>
       					<td>성적보기</td>
       					<td>수정</td>
       				</tr>
   					<s:iterator value="list_test" status="stat">
	   					<tr>
	   						<td>
	   							<s:if test="#session.userSign.type == 0">
		   							<a href="deleteCapacityTest.action?subjectname=<s:property value="list_test[#stat.index].subjectname"/>&testname=<s:property value="list_test[#stat.index].testname"/>&flag=<s:property value="list_test[#stat.index].flag"/>">
		   								<img src="../images/x_button.png" width="20" height="20" alt="x_button">
		   							</a>
	   							</s:if>
	   							<s:else>
	   								<img src="../images/x_button.png" style="FILTER:alpha(opacity=90, style=2, finishopacity=70);opacity:0.3;" width="20" height="20" alt="x_button">
	   							</s:else>
	   						</td>
	   						<td><s:property value="list_test[#stat.index].flag"/></td>
	   						<td><s:property value="list_test[#stat.index].testname"/></td>
	   						<td><s:property value="list_test[#stat.index].startdate"/></td>
	   						<td><s:property value="list_test[#stat.index].enddate"/></td>
	   						<td><s:property value="list_test[#stat.index].limittime"/></td>
   							<td><s:property value="list_test[#stat.index].avg_score"/></td>
   							<s:if test="#session.userSign.type == 0">
		   						<s:if test="list_test[#stat.index].avg_score == 0">
		   							<td><input type="button" value="성적입력" class="insertgradebtn" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>"></td>
		   						</s:if>
		   						<s:else>
		   							<td><input type="button" value="성적수정"  class="editgradebtn" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>"></td>
		   						</s:else>
		   					</s:if>
		   					<s:else>
		   						<s:if test="list_test[#stat.index].avg_score == 0">
		   							<td><input type="button" value="성적입력" class="insertgradedisablebtn" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>"></td>
		   						</s:if>
		   						<s:else>
		   							<td><input type="button" value="성적수정"  class="editgradedisablebtn" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>"></td>
		   						</s:else>
		   					</s:else>
		   					<s:if test="#session.userSign.type == 0 || #session.userSign.type == 1">
		   						<td>
		   							<input type="button" value="성적보기"  class="showgradebtn" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>">
		   						</td>
		   					</s:if>
		   					<s:else>
		   						<td>
		   							<input type="button" value="성적보기"  class="showgradedisablebtn" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>">
		   						</td>
		   					</s:else>
		   					<s:if test="#session.userSign.type == 0">
		   						<td><input type="button" value="시험수정"  class="editcapacity" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>"></td>
	   						</s:if>
	   						<s:else>
	   							<td><input type="button" value="시험수정"  class="editcapacitydisable" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>"></td>
	   						</s:else>
	   					</tr>
   					</s:iterator>
       			</table>
       			<s:if test="#session.userSign.type == 0">
       				<input type="button" value="역량평가등록" class="btn btn-primary" id="capacitybtn"><br>
       			</s:if>
       			<s:else>
       				<input type="button" value="역량평가등록" class="btn btn-primary disabled" id="capacitybtn"><br>
       			</s:else>
       		</div>
       		<div id="table1" style="float: left;">
       		</div>
       		<div id="table2" style="float: left;">
       		</div>
       		<div id="table3"  style="float: left;">
       		</div>
       		<div id="table4"  style="float: left;">
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