<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>출석부-학생</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/custom.css" rel="stylesheet">
    <link href="../jquery-plugin/anythingSlider/anythingslider.css" rel="stylesheet">
   <link href="../jquery-plugin/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet">
    
    <script src="../js/respond.js"></script>
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../jquery-plugin/anythingSlider/jquery.anythingslider.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    
    <script src="../jquery-plugin/fancybox/jquery.fancybox-1.3.4.min.js"></script>
  
  	<style type="text/css">
  	table{
 		width: 100%;
 		background-color:white;
 		
 	} 
 	
 	th{
 		/* #FFFF99 #B5FFB5 */
 		background-color : #B8E6B8;
		text-align: center;
 	}
 	td{
 		text-align: center;
 	}
 	textarea{
 		border: none;
 		width : 95%;
 		size: auto;
 	}
  	.button{
 		width : 100px;
 		height : 40px;
 		position: absolute;
    	right: 40px;
    	bottom : 5px;
   	 	background-color: #FF6666; 
   	 	color: white;
 	}
 	.button2{
 		width : 100px;
 		height : 40px;
 		position: absolute;
    	right: 40px;
    	bottom : 5px;
   	 	background-color: #CCFF66; 
   	 	color: black;
 	}
 	.statement{
 		border: none;
 		width : 95%;
 	}
 	
  	</style>
		
    <script type="text/javascript">
    
 	// 학생의 아이디를 가져와서 같을때만 링크를 걸어주어야 하므로 세션을 검사한다.
	// 다른 학생의 것에는 사유서를 작성할 수 없다.
	var id = '<s:property value="#session.userSign.id" />';
    
    
    $(document).ready(function() {
    	
    	$('a.btn-info').tooltip();
		$('#slider').anythingSlider({
			buildArrows : false,
			autoPlay : true,
			buildStartStop : true	
		});
		$("th").css("width:30px;");
		
		
		
		getDate();
		getAttendance();
		
		
		// 콤보박스의 변화에 따라 출석부를 가져오도록 기수, 반, 년, 월 에 이벤트를 준다.
		$("#flag").change(getAttendance);
		$("#class_num").change(getAttendance);
		$("#year").change(getAttendance);
		$("#month").change(getAttendance);
		
    }); // end ready
    
    // 콤보박스에 현재 재학중인 기수목록을 뿌리기 위한 메서드
  /*   function getfalgs(){
    	
    } */
    function getAttendance(){
		var flag = $("#flag").val();
		var class_num = $("#class_num").val();
		var year = $("#year").val();
		var month = $("#month").val() < 10 ? "0"+$("#month").val()  : $("#month").val() ;
		
		$.ajax({
			url : 'getAttendanceList1.action',
			type : 'post',
			dataType : 'json',
			data : { flag : flag 
					,class_num : class_num
					,year : year
					,month : month
					,day : 1
					},
			success : function(json){			
				var outhtml = "";
				
				outhtml += "<table border='1' class='table-responsive  table-hover'>";
				outhtml += 		"<tr class='success'><th width='40px'>이름</th><th width='19px'>1</th><th width='19px'>2</th><th width='19px'>3</th><th width='19px'>4</th><th width='19px'>5</th><th width='19px'>6</th><th width='19px'>7</th><th width='19px'>8</th><th width='19px'>9</th><th width='19px'>10</th>";
				outhtml += 		"	 <th width='19px'>11</th><th width='19px'>12</th><th width='19px'>13</th><th width='19px'>14</th><th width='19px'>15</th><th width='19px'>16</th><th width='19px'>17</th><th width='19px'>18</th><th width='19px'>19</th><th width='19px'>20</th>";
				outhtml += 		"	 <th width='19px'>21</th><th width='19px'>22</th><th width='19px'>23</th><th width='19px'>24</th><th width='19px'>25</th><th width='19px'>26</th><th width='19px'>27</th><th width='19px'>28</th><th width='19px'>29</th><th width='19px'>30</th><th width='19px'>31</th><th width='40px'>지각</th><th width='40px'>결석</th></tr>";
				
				$.each(json.studentList, function(index,student){
					
					outhtml += "<tr>";
					outhtml += 		"<td  bgcolor='#FFFFC6'>"+student.name+"</td>";
					
					for(var i=1 ; i<=33 ; i++){
						outhtml += "<td><div id="+student.name+(i<10?"0"+i:i)+" value='"+(i<10?"0"+i:i)+"'><div></td>";
					}	
					outhtml += "</tr>";
				});
				// ------일 별 출결 사항 을 위한 지각, 결석 row 추가------
				for(var i =0 ; i < 2 ; i++){
					outhtml += "<tr><td bgcolor='#FFFFC6'>"+(i==0?"지각":"결석")+"</td>";
					for(var j = 1 ; j < 34 ; j++){
						if(i==0){
						    outhtml += 		"<td><div id='tardiness_"+(j<10?"0"+j:j)+"'>"+"tardiness_"+(j<10?"0"+j:j)+"</div></td>";
						}else{
							outhtml += 		"<td><div id='absence_"+(j<10?"0"+j:j)+"'>"+"absence_"+(j<10?"0"+j:j)+"</div></td>";
						}
						
					}
					outhtml += "</tr>";
				}
				// ---------------------------------------		
				outhtml += "</table>";		
				
				$("#attendanceTable").html(outhtml);
	
				var tardiness_cols 	= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
				var absence_cols 	= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
				$.each(json.studentList, function(index,student){
			 		var tardiness_row = 0;  // 학생별 지각 합
					var absence_row = 0;	// 학생별 결석 합
		
					$.each(json.attendanceList, function(index,attendance){
						if(student.id==attendance.id){
							
							//td_id  =  '김두용01' '김두용02'
							//			'은다운01' '은다훈02' 형식으로 나옴...
							var td_id = (attendance.name)+attendance.attendance_date.substring(6);	
							//각 날짜에 해당하는 곳에 값을 넣어준다.------------------------
							var check_figure = "";
							var statement_key = "";
							
							//var name = "'"+attendance.name+"'";
				
							// 여기서 풀네임을 넘겨줘야 하는데 왜 이름을 넣으면 펑션 실행이 안되는것인가.. 하...
							statement_key = "'"+attendance.name+"."+year+month+attendance.attendance_date.substring(6)+"'";
							
							if(attendance.attendance_check==1){
								check_figure = "●";
							}else if(attendance.attendance_check==2){
								
								// 지금 로그인 되어있는 사람은 학생임.... 여기 학생 페이지...
							
								//출석 체크 되어있는 학생과 세션의 학생이 같으면 링크를 걸어줘서 사유서를 등록, 수정 할수 있게 한다.
								if(attendance.id==id){
									check_figure = '<a class="iframe" style="background-color:;" href="javascript:statementWrite('+statement_key+');">▲</a>';	
								}else{
									check_figure = '▲';
								}
								// 을 사용하여 배경 줄수 있음;
								// style="background-color:red;"
								
							}else{
								if(attendance.id==id){
									check_figure = '<a class="iframe" style="background-color:;" href="javascript:statementWrite('+statement_key+');">x</a>';	
								}else{
									check_figure = 'x';
								}
							}
							
							$("#"+td_id).html(check_figure);
							$("#"+td_id).attr("value",attendance.attendance_check);

							
							/* $("a.iframe").fancybox({
								width : 500,
								height : 2000
							}); */
							
							
							// 배열에 넣어주기 위해 숫자로 바꿔준다....
							var str_day = attendance.attendance_date.substring(6);
							var day = Number(str_day);
							
							if(attendance.attendance_check==2){
								tardiness_row++;
							}else if(attendance.attendance_check==3){
								absence_row++;
							}
							var check = $("#"+student.name+(day<10?"0"+day:day)).attr("value"); //  새로줄의 값만 불러옴
							if(check==2){
								//지각 배열 [1 0 0 0 3 0 0 2 0 1 0 0]
								// 01 02 03 04
								//---------
								
								//alert(day);
								
								//-----------
								tardiness_cols[day-1]++;
							}else if(check==3){
								//결석 배열 [0 0 0 0 0 0 0 0 0 0 0 0]
								absence_cols[day-1]++;
							}
						}
					});	//end inner each
					
					//학생별 지각, 결석 합 출력
					$("#"+student.name+"32").html(tardiness_row==0?"":tardiness_row);
					$("#"+student.name+"33").html(absence_row==0?"":absence_row);
				});  //end outer each
				
				// 일별 지각, 결석 합 출력해야 하는곳
				var tardiness_sum = 0;
				var absence_sum = 0;
				
				//지각 배열의 값 출력해보자 
			//	alert(tardiness_cols);
				//결석 배열의 값 도~
			//	alert(absence_cols);
				
				for(var k = 1 ; k < 34 ; k++){
				//  해당 날짜의 지각, 결석 합 넣어주기    [0 0 0 0 0 0 0 0 0] 배열이 생성되어있고 각각에는 일별 합이 들어있다. 
					$("#tardiness_"+(k<10?"0"+k:k)).html(tardiness_cols[k-1]==0?"":tardiness_cols[k-1]);
					$("#absence_"+(k<10?"0"+k:k)).html(absence_cols[k-1]==0?"":absence_cols[k-1]);
					tardiness_sum 	+= tardiness_cols[k-1];
					absence_sum		+= absence_cols[k-1];
				}
				// 일별 지각 결석 합 넣는곳
				$("#tardiness_32").html(tardiness_sum==0?"":tardiness_sum);
				$("#absence_33").html(absence_sum==0?"":absence_sum);
			}//end success				
		});
	}	
    function formCheck(){
    	affiliation
    	if($("#affiliation").val()=="" ||$("#name").val()=="" ||$("#content").val()==""||$("#reason").val()==""||$("#afterplan").val()==""){
    		alert("모든 항목을 입력하세요");
    		return false;
    	}
    	
    	
    }
	function getDate(){
	   	var date = new Date();
	   	var month = date.getMonth()+1;
	   	$("#month").val(month);
	}
	function statementWrite(statement_key){
		$.ajax({
			url : 'statementRead.action',
			type : 'post',
			dataType : 'json',
			data : { statement_key : statement_key },
			success : function (json) {
				// on success, post (preview) returned data in fancybox
				
				// 그 날짜에 해당하는 사유서가 있는지 검색하고 없으면 새로운 폼을 제시한다.
				if(json.statementVo==null){
					// 이 페이지가 나올 때는 소속, 이름이 비어있기때문에 세션으로 검사하여 자동으로 소속, 이름 을 넣어준다.
					
					var affiliation ='<s:property value="#session.userSign.flagnum"/>';
					var name =		 '<s:property value="#session.userSign.name"/>';
					
					var fullContent = "<form action = 'insertStatement.action' method='post' onsubmit='return formCheck()'>";
					fullContent += "<input type='hidden' name='statementVo.statement_key' value ="+statement_key+" >";
					fullContent += "<input type='hidden' id='flag' value ="+affiliation+" >";
					fullContent += "<table border='1' width='300px'>";
					fullContent += 		"<tr>";
					fullContent += 			"<th width='120px'>소 속</th><td width='500px'><input readonly='readonly' id='affiliation' type ='text' style='resize:none; width:100%;border:none;' class='statement' name='statementVo.affiliation' value="+affiliation+"></td>";
					fullContent += 		"</tr>";
					fullContent += 		"<tr>";
					fullContent += 			"<th>성 명</th><td width='400px'><input id='name' readonly='readonly' type='text' class='statement' style='resize:none; width:100%;border:none;' name='statementVo.name' value="+name+"></td>";
					fullContent += 		"</tr>";
					fullContent += 		"<tr>";
					fullContent += 			"<th>사고 내용</th><td><input type='text' id = 'content' class='statement' style='resize:none; width:100%;border:none;' name='statementVo.content'></td>";
					fullContent += 		"</tr>";
					fullContent += 		"<tr>";
					fullContent += 			"<th height='200px' >사고 사유</th><td><textarea id ='reason' rows='10' class='statement' name='statementVo.reason' style='resize:none; width:100%;border:none;'></textarea></td>";
					fullContent += 		"</tr>";
					fullContent += 		"<tr>";
					fullContent += 			"<th height='200px'>처리 및 조치방안</th><td><textarea id ='afterplan' rows='10' class='statement' name='statementVo.afterplan' style='resize:none; width:100%;border:none;'></textarea></td>";
					fullContent += 		"</tr>";
					fullContent += 		"<tr>";
					fullContent += 			"<td colspan='2'>작성자 본인은 처리 및 조치가 이행되지 않을 경우 모든 행정적 불이익을 감수함<br>";
					fullContent +=			new Date().getFullYear()+"년   "+(new Date().getMonth()+1)+" 월   "+new Date().getDate()+"일<br>";
					fullContent +=			"성명            :             (서명)<input class='button2' type='submit' width='20px' value='저장'/></td>";
					fullContent += 		"</tr>";
					fullContent += "</table>";
					fullContent += "</form>";
					
					$.fancybox(json, {
				        // fancybox API options
				      	fitToView: false,
				        width: 300,
				        height: 500, 
				        closeClick: false,
				        openEffect: 'none',
				        closeEffect: 'none',
				        content : fullContent
					}); // fancybox
					
					// 이미 사유서가 존재 한다면, 데이터를 불러와 수정한다.
				}else{
					var fullContent = "<form action = 'updateStatement.action' method='post' onsubmit='return formCheck()'>";
					fullContent += "<input type='hidden' name='statementVo.statement_key' value ="+statement_key+" >";
					fullContent += "<table border='1' width='300px'>";
					fullContent += 		"<tr>";
					fullContent += 			"<th width='120px'>소 속</th><td width='500px'><input readonly='readonly' id='affiliation' type = 'text' style='resize:none; width:100%;border:none;' class ='statement' name='statementVo.affiliation' value="+json.statementVo.affiliation+"></td>";
					fullContent += 		"</tr>";
					fullContent += 		"<tr>";
					fullContent += 			"<th>성 명</th><td width='400px'><input readonly='readonly' id='name' type='text' style='resize:none; width:100%;border:none;' class='statement' name = 'statementVo.name' value="+json.statementVo.name+"></td>";
					fullContent += 		"</tr>";
					fullContent += 		"<tr>";
					fullContent += 			"<th>사고 내용</th><td><input id='content' type='text' style='resize:none; width:100%;border:none;' class='statement' name='statementVo.content' value="+json.statementVo.content+"></td>";
					fullContent += 		"</tr>";
					fullContent += 		"<tr>";
					fullContent += 			"<th height='200px' >사고 사유</th><td><textarea id='reson' rows='10' style='resize:none; width:100%;border:none;' name='statementVo.reason'>"+json.statementVo.reason+"</textarea></td>";
					fullContent += 		"</tr>";
					fullContent += 		"<tr>";
					fullContent += 			"<th height='200px'>처리 및 조치방안</th><td><textarea id='afterplan' rows='10' style='resize:none; width:100%;border:none;' name='statementVo.afterplan'>"+json.statementVo.afterplan+"</textarea></td>";
					fullContent += 		"</tr>";
					fullContent += 		"<tr>";
					fullContent += 			"<td colspan='2'>작성자 본인은 처리 및 조치가 이행되지 않을 경우 모든 행정적 불이익을 감수함<br>";
					fullContent +=			new Date().getFullYear()+"년   "+(new Date().getMonth()+1)+" 월   "+new Date().getDate()+"일<br>";
					fullContent +=			"성명            :   "  +json.statementVo.name+"                   (서명)<input class='button' type='submit' value='수정'/></td>";
					fullContent += 		"</tr>";
					fullContent += "</table>";
					
					$.fancybox(json, {
				        // fancybox API options
				      	fitToView: false,
				        width: 300,
				        height: 500, 
				      	scrolling : "no",
				        closeClick: false,
				        openEffect: 'none',
				        closeEffect: 'none',
				        content : fullContent
					}); // fancybox
				}
			}
		});
	}
    </script>
    
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
                        	<!-- <li><a href="../member/memberManagement.action">회원관리</a></li> -->
                            <li><a href="../attendance/goAttendanceList.action">출석관리</a></li>
                            <!-- <li><a href="../test/testItUi.action">시험관리</a></li> -->
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
    
    	<article class="thumbnail col-lg-9 col-sm-8 col-lg-push-3 col-sm-push-4">
        
            <ol class="breadcrumb">
              <li><a href="#">홈</a> <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>학사관리 <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li><a href="../attendance/goAttendanceList.action">출석관리</a></li>
              
            </ol>
         <div class="clearfix visible-xs visible-lg"></div>
         <div><!-- 출석부를 뿌리자 -->
         <form class="form-inline" role="form">
         	<div class="form-group">
	       		<select id="flag" class="form-control" style="width:70px">
	       			<s:if test="flag!=0">
	       				<option><s:property value = "flag"/> </option>
	       			</s:if>
	       			<s:iterator value="flagList" status = "stat">
	       				<s:if test="flagList[#stat.index] != flag">
	       					<option><s:property/></option>
	       				</s:if>
	       			</s:iterator>
	       		</select>기&nbsp;&nbsp;
	       	</div>
	       	<div class="form-group">
	       		<select id="class_num" class="form-control" style="width:80px">
	       			<s:if test="class_num!=null">
	       				<option selected="selected"><s:property value="class_num"/></option>
	       			</s:if>
	       			<s:iterator value = "class_numList" status = "stat">
	       				<s:if test="class_numList[#stat.index] != class_num">
	       					<option><s:property/></option>
	       				</s:if>
	       			</s:iterator>
	       		</select>&nbsp;&nbsp;
	       	</div>
	       	<div class="form-group">
	       		<select id = "year" class="form-control" style="width:90px">
	       			<s:iterator var="i" begin="2014" end="2000" step="-1">
	       				<option>${i}
	       			</s:iterator>
	       		</select>년&nbsp;&nbsp;
	       		<select id = "month" class="form-control" style="width:80px">
	       			<s:iterator var="i" begin="1" end="12">
	       				<option>${i}
	       			</s:iterator>
	       		</select>월
	       	</div>
	       </form><br>
       		<!-- 년 월 선택했을시 해당 월의 출석부를 표로 보여준다. ajax 를 사용한다.  -->
       		<!-- 출석부를 표로 뿌린다.
       		<input type = "button" value = "출석부 가져와" id = "btn_get"><br>
       		
       		 -->
       		<div id = "attendanceTable">
       			<!-- 여기다가 테이블 만들어서 출석부를 불러오자... 흐... -->
       		</div>
       		
       		
       </div>
        </article>
<!--         
         <table>
        	<tr>
        		<td></td>
        	</tr>
        </table>  
 -->        
        <aside class="col-lg-3 col-sm-4 col-lg-pull-9 col-sm-pull-8 ">
       		<div class="thumbnail">
       			<h3>학사관리</h3>
	            <ul class="nav nav-pills nav-stacked">
	                <!-- 
	                	<li><a href="../member/memberManagement.action">회원관리</a></li>
	                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view1">- 회원승인</a><br>
	                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view2">- 선생님</a><br>
	                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/memberManagement.action#view3">- 학생</a><br> 
	                -->
	                <li class="active"><a href="../attendance/goAttendanceList.action">출석관리</a></li>
	               <!--  	 
	               		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="goAttendanceCheck.action">- 출석체크</a>
	                <li><a href="../test/testItUi.action">시험관리</a></li>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/testItUi.action">- IT과목별시험</a><br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/itCapacity.action">- IT역량평가</a><br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/japDaily.action">- 일본어매일시험</a><br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../test/japMonth.action">- 일본어월말시험</a><br> 
                   -->
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
