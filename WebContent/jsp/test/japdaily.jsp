<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일본어매일시험</title>
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
			location.href="japDaily.action?flag=" + flag + "&field=일본어";
		});
		$('#class_num').change(function() {
			var flag = $('#flag').val();
			var class_num = $('#class_num').val();
			location.href="japDaily.action?flag=" + flag + "&field=일본어&class_num=" + class_num;
		});
		//시험등록
		$('#dailydisablebtn').addClass('btn btn-primary disabled');
		$('#dailybtn').addClass('btn btn-primary');
   		$('#dailybtn').click(function() {
   			cw=screen.availWidth;     //화면 넓이
			 ch=screen.availHeight;    //화면 높이

			 sw=600;    //띄울 창의 넓이
			 sh=400;    //띄울 창의 높이

			 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
   			window.open('dailyInsertForm.action?subjectname=민나노(상)&class_num=고급', 'dailyInsertForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
    	});
   		$('.insertgradedisable').addClass('btn btn-primary disabled');
   		$('.insertgrade').addClass('btn btn-primary');
   		$('.insertgrade').click(function() {
   			var testname = $(this).attr('testname');
			var flag = $(this).attr('flag');
			var subjectname = $(this).attr('subjectname');
			var testid = $(this).attr('testid');
			var class_num = $(this).attr('class_num');
			cw=screen.availWidth;     //화면 넓이
			 ch=screen.availHeight;    //화면 높이

			 sw=550;    //띄울 창의 넓이
			 sh=500;    //띄울 창의 높이

			 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
   			window.open('insertGradeOfDailyForm.action?testid='+testid+'&testname='+testname+'&flag='+flag+'&subjectname='+subjectname+'&class_num='+class_num, 'insertGradeOfDailyForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
   		});
   		//시험수정
   		$('.editgradedisable').addClass('btn btn-success disabled');
   		$('.editgrade').addClass('btn btn-success');
   		$('.editgrade').click(function() {
   			var testname = $(this).attr('testname');
			var flag = $(this).attr('flag');
			var subjectname = $(this).attr('subjectname');
			var testid = $(this).attr('testid');
			var class_num = $(this).attr('class_num');
			 cw=screen.availWidth;     //화면 넓이
			 ch=screen.availHeight;    //화면 높이
	
			 sw=550;    //띄울 창의 넓이
			 sh=500;    //띄울 창의 높이
	
			 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
   			window.open('editGradeOfDailyForm.action?testid='+ testid+'&testname='+testname+'&flag='+flag+'&subjectname='+subjectname+'&class_num='+class_num, 'editGradeOfDailyForm', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
   		});
   		//시험보기
   		$('.showgrade').addClass('btn btn-warning');
   		$('.showgradedisable').addClass('btn btn-warning');
   		$('.showgrade').click(function() {
   			var testname = $(this).attr('testname');
			var flag = $(this).attr('flag');
			var subjectname = $(this).attr('subjectname');
			var testid = $(this).attr('testid');
			var class_num = $(this).attr('class_num');
			var teachername = $(this).attr('teachername');
			$.ajax({
				url:'showStudentDailyGrade.action',
				type:'post',
				dataType:'json',
				data:{testname:testname, flag:flag, subjectname:subjectname, testid:testid, class_num:class_num, teachername:teachername},
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
								str += "<tr class='success'><td style='font-weight: bold;'>기수 : "+ flag +"</td><td style='text-align:left; font-weight: bold;'>시험이름 : "+ json.list_test[0].testname +" </td></tr>";
								str += "<tr class='success'><td style='font-weight: bold;'> 반 : "+ class_num +"</td><td style='text-align:left; font-weight: bold;'> 선생님 : "+ teachername +"</td></tr>";
							} else {
								str += "<tr style='height: 31px; width:50%;' class='success'><td></td><td></td></tr>";
								str += "<tr style='height: 31px; width:50%;' class='success'><td></td><td></td></tr>";
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
                    <li><a href='../index.action'>홈</a></li>
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
              <li><a href="#">홈</a><span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>학사관리<span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>시험관리<span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li><a href="./japDaily.action">일본어매일시험</a></li>
            </ol>
            
            <!-- 검색기능 -->
	       
			
            
       		
       		<!-- 전체시험리스트 보여지는 부분 -->
       		<div>
       			<table style="text-align: center;">
       				<tr>
       					<td>기수</td>
       					<td>반</td>
       					<td rowspan="2">
	       					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
       						<b style="font-size: 30px">[매일시험리트스]</b>
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
       					<td>
       						<select id="class_num" class="form-control">
								<option selected="selected"><s:property value="class_num"/></option>
					        	<s:iterator value="list_class" status="stat">
					        		<s:if test="list_class[#stat.index] != class_num">
					        			<option><s:property value="list_class[#stat.index]"/></option>
					        		</s:if>
					        	</s:iterator>
							</select>
       					</td>
       				</tr>
       			</table>
       			
       			
       			<table border="0" class="table table-striped" style="text-align: center;">
       				<tr class="success">
       					<td>삭제</td>
       					<td>기수</td>
       					<td>반</td>
       					<td>선생님</td>
       					<td>교제</td>
       					<td>시험명</td>
       					<td>시작날짜</td>
       					<td>종료날짜</td>
       					<td>시험시간(분)</td>
       					<td>성적완료</td>
       					<td>성적입력</td>
       					<td>성적보기</td>
       				</tr>
   					<s:iterator value="list_test" status="stat">
   					<tr>
   						<td>
   							<s:if test="#session.userSign.type == 0 || #session.userSign.id == list_test[0].teacherid">
	   							<a href="deleteDaily.action?testid=<s:property value="list_test[#stat.index].testid"/>">
	   							<img src="../images/x_button.png" width="20" height="20" alt="x_button">
	   							</a>
   							</s:if>
   							<s:else>
   								<img src="../images/x_button.png" style="FILTER:alpha(opacity=90, style=2, finishopacity=70);opacity:0.3;" width="20" height="20" alt="x_button">
   							</s:else>
   						</td>
   						<td><s:property value="list_test[#stat.index].flag"/></td>
   						<td><s:property value="list_test[#stat.index].class_num"/></td>
   						<td><s:property value="list_test[#stat.index].teachername"/></td>
   						<td><s:property value="list_test[#stat.index].subjectname"/></td>
   						<td><s:property value="list_test[#stat.index].testname"/></td>
   						<td><s:property value="list_test[#stat.index].startdate"/></td>
   						<td><s:property value="list_test[#stat.index].enddate"/></td>
   						<td><s:property value="list_test[#stat.index].limittime"/></td>
						<td><s:property value="list_test[#stat.index].input_type"/></td>
						<s:if test="#session.userSign.type == 0 || #session.userSign.id == list_test[#stat.index].teacherid">
	   						<s:if test='list_test[#stat.index].input_type == ("X")'>
		   						<td><input type="button" value="성적입력" class="insertgrade" class_num="<s:property value="list_test[#stat.index].class_num"/>" subjectname="<s:property value="list_test[#stat.index].subjectname"/>" testid="<s:property value="list_test[#stat.index].testid"/>" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>"></td>
	   						</s:if>
	   						<s:else>
		   						<td><input type="button" value="성적수정" class="editgrade" class_num="<s:property value="list_test[#stat.index].class_num"/>" subjectname="<s:property value="list_test[#stat.index].subjectname"/>" testid="<s:property value="list_test[#stat.index].testid"/>" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>"></td>
	   						</s:else>
   						</s:if>
   						<s:else>
   							<s:if test='list_test[#stat.index].input_type == ("X")'>
		   						<td><input type="button" value="성적입력" class="insertgradedisable" subjectname="<s:property value="list_test[#stat.index].subjectname"/>" testid="<s:property value="list_test[#stat.index].testid"/>" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>"></td>
	   						</s:if>
	   						<s:else>
		   						<td><input type="button" value="성적수정" class="editgradedisable" subjectname="<s:property value="list_test[#stat.index].subjectname"/>" testid="<s:property value="list_test[#stat.index].testid"/>" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>"></td>
	   						</s:else>
   						</s:else>
   						<td>
	   						<s:if test="#session.userSign.type == 0 || #session.userSign.type == 1">
	   							<input type="button" value="성적보기" class="showgrade" teachername="<s:property value="list_test[#stat.index].teachername"/>" class_num="<s:property value="list_test[#stat.index].class_num"/>" subjectname="<s:property value="list_test[#stat.index].subjectname"/>" testid="<s:property value="list_test[#stat.index].testid"/>" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>">
	   						</s:if>
	   						<s:else>
	   							<input type="button" value="성적보기" class="showgradedisable" subjectname="<s:property value="list_test[#stat.index].subjectname"/>" testid="<s:property value="list_test[#stat.index].testid"/>" testname="<s:property value="list_test[#stat.index].testname"/>" flag="<s:property value="list_test[#stat.index].flag"/>">
	   						</s:else>
   						</td>
   					</tr>
   					</s:iterator>
       			</table>
       			<s:if test="#session.userSign.type == 0 || (#session.userSign.field == '일본어' && #session.userSign.type == 1)">
       				<input type="button" value="일본어매일시험등록" id="dailybtn"><br>
       			</s:if>
       			<s:else>
       				<input type="button" value="일본어매일시험등록" id="dailydisablebtn"><br>
       			</s:else>
       			
       		</div>
       		<!-- ajax사용했을 경우 보여지는 부분 -->
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