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
    <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
    <link href="../jquery-plugin/mctabs/generic-notForMcTabs.css" rel="stylesheet" type="text/css" />
    <link href="../jquery-plugin/mctabs/template2/mctabs.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../css/radar-chart.css">
	 <!-- 리스트 테이블 CSS 지정 시작 -->
     <link href="<s:url value="/css/bootstrap-table.css"/>" rel="stylesheet">
    
	<script src="../jquery-plugin/mctabs/javascript-tabs.js" type="text/javascript"></script>
    <script src="../js/respond.js"></script>
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../jquery-plugin/anythingSlider/jquery.anythingslider.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="<s:url value="/js/bootstrap-tableForSeong.js"/>"></script>
    
    
    
<!-- 그래프를 위한 스타일 -->	
	<style>
		body {padding: 20px; }
		/* tr:nth-child(odd) {background: WhiteSmoke;} */
  	</style>			
	
	<style>
		.radar-chart .area {
		  fill-opacity: 0.7;
		}
		.radar-chart.focus .area {
		  fill-opacity: 0.3;
		}
		.radar-chart.focus .area.focused {
		  fill-opacity: 0.9;
		}
		.area.germany, .germany .circle {
		  fill: #FFD700;
		  stroke: none;
		}
		.area.argentina, .argentina .circle {
		  fill: #ADD8E6;
		  stroke: none;
		}
		th{text-align:center;}
</style>
<style>
    	.OneofInfo{border:1px solid black;}
    	th{background:SteelBlue;
    	   color:white;}
    	td{background:WhiteSmoke;}
    	.OneofInfoth{background:white;
    				 color:black;
    				 border:1px solid black;}
    </style>	
<!-- 그래프를 위한 스크립트 -->
	<script src="http://d3js.org/d3.v3.js"></script>
	<script src="../js/radar-chart.js"></script>
	<script>
		RadarChart.defaultConfig.color = function() {};
		RadarChart.defaultConfig.radius = 3;
	</script>
<!-- 그래프의 입력값을 위한 스크립트  -->	
	<script>
		var data = [
		  {
		    className: 'germany', // optional can be used for styling //exam data
		    axes: [
		      {axis: "strength", value: 13}, 
		      {axis: "intelligence", value: 6}, 
		      {axis: "charisma", value: 5},  
		      {axis: "dexterity", value: 9},  
		      {axis: "luck", value: 2},
			  {axis: "blessed", value: 12}
		    ]
		  },
		  {
		    className: 'argentina',
		    axes: [
		      {axis: "strength", value: 10}, 
		      {axis: "intelligence", value: 7}, 
		      {axis: "charisma", value: 10},  
		      {axis: "dexterity", value: 13},  
		      {axis: "luck", value: 9}
		    ]
		  }
		];
		function randomDataset() {//exam function
		  return data.map(function(d) {
		    return {
		      className: d.className,
		      axes: d.axes.map(function(axis) {
		        return {axis: axis.axis, value: Math.ceil(Math.random() * 10)};
		      })
		    };
		  });
		}
	</script>
	<!--차트를 위한 스크립트2  -->
	<script>
		var chart = RadarChart.chart();
		var cfg = chart.config(); // retrieve default config
		var svg = d3.select('body').append('svg')
		  .attr('width', cfg.w)
		  .attr('height', cfg.h + cfg.h / 4);
		svg.append('g').classed('single', 1).datum(randomDataset()).call(chart);
		
		// many radars //exam radar function
		chart.config({w: cfg.w / 4, h: cfg.h / 4, axisText: false, levels: 0, circles: false});
		cfg = chart.config();
		function render() {
		  var game = svg.selectAll('g.game').data(
		    [
		      randomDataset(),
		      randomDataset(),
		      randomDataset(),
		      randomDataset()
		    ]
		  );
		  game.enter().append('g').classed('game', 1);
		  game
		    .attr('transform', function(d, i) { return 'translate('+(i * cfg.w)+','+ (cfg.h * 4) +')'; })
		    .call(chart);
		
		  setTimeout(render, 1000);
		}
		render();
	</script>
	
    <script type="text/javascript">
    $(document).ready(function() {
    	/* $('#searchbtn').click(searchFnc); //검색
    	$('#searchName').click(function(){document.getElementById("searchName").value="";}); */
    	$('a.btn-info').tooltip();
		$('#slider').anythingSlider({
			buildArrows : false,
			autoPlay : true,
			buildStartStop : true
		});
		//일괄등록
		$('#subjectbtn').click(function() {
			window.open('insertSubjectForm.action', 'insertSubjectForm', 'width=400, top=200, height=400, left=400');
		});
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
    	window.open('editSubjectForm.action?&subjectname='+subjectname+ '&flag='+flag+ '&testname='+testname, 'editSubjectForm', 'width=400, top=200, height=400, left=400');
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
    	
    function viewScore(id){
    	$.ajax({
			url:'myScoreView.action',
			type:'post',
			dataType:'json',
			data:{idForView:id},
			success:output
		});
	 
    }
    function viewScoreJ(id){
    	alert("hello");
    	$.ajax({
			url:'myScoreViewJ.action',
			type:'post',
			dataType:'json',
			data:{idForView:id},
			success:outputJ
		});
	 
    }
    function output(json){
 		//차트데이터
 		alert("dtest");
 		var temp="[{";
 			 temp+="className: 'argentina',";
 			 temp+="axes: [";
 		for(i=0;i<json.scoreList.length;i++){
 			temp+="{axis: '"+json.scoreList[i].testname+"', value: "+json.scoreList[i].score+"},";
		}
 		     temp+="]";
 			 temp+="}";
 			 temp+="];";
 		   data = eval(temp);
 		 //성적조회 뷰
 	    var outhtml="";
 		   	outhtml+="<div class='col-lg-12'><table><tr>";
 		   	outhtml+="<td colspan='4'><div id='propicDiv'>";
 	    	outhtml+="<div style='height:200px;width:160px;border:1px solid black;font-weight:bold;font-size:15pt;'>";
 		   	outhtml+="<img id='target' src='../upload/"+json.student.propic+"' alt='your image' height='200px' width='160px'/><br/>";
 	    	outhtml+="이름 : "+json.student.name+"<br/>";
 	    	outhtml+="기수 : "+json.student.flagnum+"<br/>";
 	    	outhtml+="반 : "+json.student.class_num;
 	    	outhtml+="</div></td><td colspan='2'><div id='graphDiv' class='chart-container' ></div></td></tr></table><br/><hr size='0.5' style='border:1px solid black;'/>";
 	    	outhtml+="<table><tr><td colspan='6' align='left' style='font-weight:bold;'>IT성적과목별리스트</td></tr></table>";
 	    	outhtml+="<table class='table table-condensed' style='text-align:center;'><tr><th colspan='2'>시험일시</th><th>시험명</th><th>점수</th><th>Online</th></tr>";
 	    	for(i=0;i<json.scoreList.length;i++){
 	 			outhtml+="<tr><td colspan='2'>"+json.scoreList[i].startdate.substring(0,11)+"</td><td>"+json.scoreList[i].testname+"</td><td>"+json.scoreList[i].score+"점</td><td>"+json.scoreList[i].type+"</td></tr>";
 			}
 	    	outhtml+="<tr><td colspan='6' align='left' style='font-weight:bold;'>IT성적역량평가</td></tr>";
 	    	outhtml+="<tr><th colspan='2'>시험일시</th><th>시험명</th><th>점수</th><th>석차</th></tr>";
 	    	for(i=0;i<json.scoreList2.length;i++){
 	 			outhtml+="<tr><td colspan='2'>"+json.scoreList2[i].startdate.substring(0,11)+"</td><td>"+json.scoreList2[i].testname+"</td><td>"+json.scoreList2[i].score+"점</td><td>1등</td></tr>";
 			}
 	    	outhtml+="<tr><td colspan='3' style='text-align:left'><b>IT역량평가종합</b></td><td><b>평균 : "+(json.scoreITRank.scoreavg).toFixed(2)+"점</b></td><td><b>석차 : "+json.scoreITRank.rank+"등</b></td>/tr>";
 			outhtml+="</table></div>";						 	 
    	/* data = [
    			  {
    			    className: 'argentina', // optional can be used for styling
    			    axes: [
    			      {axis: "Java", value: 13}, 
    			      {axis: "Oracle", value: 6}, 
    			      {axis: "charisma", value: 5},  
    			      {axis: "dexterity", value: 9},  
    			      {axis: "luck", value: 2},
    				  {axis: "blessed", value: 12}
    			    ]
    			  }
    			]; */
 		//차트그리기
       	$("#scoreTable").html(outhtml);chartDraw(); 
    }
    function outputJ(json){
 		//차트데이터
 		alert("test");
 		var writeAvg=0;
 		var interviewAvg=0;
 		var speechAvg=0;
 		var writeSum=0;
 		var interviewSum=0;
 		var speechSum=0;
 		var cnt=0;
 		var katakanaAvg=json.japAvgVO.katakanaAvg; 
 		var writingAvg=json.japAvgVO.writingAvg;
 		var readingAvg=json.japAvgVO.readingAvg;
 		var kanjiAvg=json.japAvgVO.kanjiAvg;
 		/* alert(kanjiAvg); */
 		 var temp="[{";
 			 temp+="className: 'argentina',";
 			 temp+="axes: [";
 		for(i=0;i<json.scoreListJ2.length;i++){
 			writeSum+=json.scoreListJ2[i].write;
 			interviewSum+=json.scoreListJ2[i].interview;
 			speechSum+=json.scoreListJ2[i].speech;
 			++cnt;
		}
 		writeAvg=writeSum/cnt;
 		interviewAvg=interviewSum/cnt;
 		speechAvg=speechSum/cnt;
 		/* alert(speechAvg); */
 			 temp+="{axis: '필기', value: "+writeAvg+"},";
			 temp+="{axis: '인터뷰', value: "+interviewAvg+"},";
			 temp+="{axis: '스피치', value: "+speechAvg+"},";
			 temp+="{axis: '카타카나', value: "+katakanaAvg+"},";
			 temp+="{axis: '작문', value: "+writingAvg+"},";
			 temp+="{axis: '읽기', value: "+readingAvg+"},";
			 temp+="{axis: '한자', value: "+kanjiAvg+"},";
 		     temp+="]";
 			 temp+="}";
 			 temp+="];";
 		   data = eval(temp);
 		 //성적조회 뷰
 	    var outhtml="";
 		   	outhtml+="<div class='col-lg-12'><table><tr>";
 		   	outhtml+="<td colspan='4'><div id='propicDiv'>";
 	    	outhtml+="<div style='height:200px;width:160px;border:1px solid black;font-weight:bold;font-size:15pt;'>";
 		   	outhtml+="<img id='target' src='../upload/"+json.student.propic+"' alt='your image' height='200px' width='160px'/>";
 	    	outhtml+="이름 : "+json.student.name+"<br/>";
 	    	outhtml+="기수 : "+json.student.flagnum+"<br/>";
 	    	outhtml+="반 : "+json.student.class_num;
 	    	outhtml+="</div></td><td colspan='2'><div id='graphDiv' class='chart-containerJ' ></div></td></tr></table><br/><hr size='0.5' style='border:1px solid black;'/>";
 		   	outhtml+="<table><tr><td colspan='6' align='left' style='font-weight:bold;'>일본어과목별리스트</td></tr></table>";
 	    	outhtml+="<table class='table table-condensed' style='text-align:center;'><tr><th colspan='2'>시험일시</th><th>시험명</th><th>성적</th></tr>";
 	    	for(i=0;i<json.scoreListJ.length;i++){
 	 			outhtml+="<tr><td colspan='2'>"+json.scoreListJ[i].startdate.substring(0,11)+"</td><td>"+json.scoreListJ[i].testname+"</td><td>"+json.scoreListJ[i].score+"점</td></tr>";
 			}
 	    	outhtml+="<tr><td colspan='6' align='left' style='font-weight:bold;'>일본어 월말평가</td></tr>";
 	    	outhtml+="<tr><th colspan='2'>시험일시</th><th>시험명</th><th>필기</th><th>인터뷰</th><th>스피치</th></tr>";
 	    	for(i=0;i<json.scoreListJ2.length;i++){
 	 			outhtml+="<tr><td colspan='2'>"+json.scoreListJ2[i].startdate.substring(0,11)+"</td><td>"+json.scoreListJ2[i].testname+"</td><td>"+json.scoreListJ2[i].write+"점</td><td>"+json.scoreListJ2[i].interview+"점</td><td>"+json.scoreListJ2[i].speech+"점</td></tr>";
 			}
 	    	outhtml+="<tr><td style='text-align:left;'><b>일본어월말평가종합</b></td><td><b>평균 : </b></td><td><b>"+(json.scoreJapRank.writeavg).toFixed(2)+"점</b></td><td><b>"+(json.scoreJapRank.interviewavg).toFixed(2)+"점</b></td><td><b>"+(json.scoreJapRank.speechavg).toFixed(2)+"점</b></td><td><b>석차 : "+json.scoreJapRank.japrank+"등</b></td></tr>";
 			outhtml+="</table></div>";
    	/* data = [
    			  {
    			    className: 'argentina', // optional can be used for styling
    			    axes: [
    			      {axis: "Java", value: 13}, 
    			      {axis: "Oracle", value: 6}, 
    			      {axis: "charisma", value: 5},  
    			      {axis: "dexterity", value: 9},  
    			      {axis: "luck", value: 2},
    				  {axis: "blessed", value: 12}
    			    ]
    			  }
    			]; */
 		//차트그리기
       	$("#scoreTableJ").html(outhtml);chartDrawJ(); 
    }
    
    /* function output(json) {
    	//ajax를 이용한 것이 talbe에 뿌려진 실재 내용
    	var str = '<br>'+ json.flag +'기 IT<table border="1">';
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
		    			str += "<tr><td colspan='10'> 과목명 : "+ json.list_test[i].subjectname +"강사명 : "+ json.list_test[i].teachername +"</td></tr>";
	    			}
		    		str += "<tr><td>기수</td><td>반</td><td>과목</td><td>시험명</td><td>온라인</td><td>시작날짜</td><td>종료날짜</td><td>시험시간</td><td>성적평균</td><td>성적입력</td></tr>";
		    		s = 0;
	    		}
	    		if(json.list_test[i].class_num == json.list_class[j]) {
	    			if(json.list_grade[i] == "") {
			    		str += "<tr><td>"+json.list_test[i].flag+"</td><td>"+json.list_test[i].class_num+"</td><td>"+json.list_test[i].subjectname+"</td><td>"+json.list_test[i].testname+"</td><td>"+json.list_test[i].type+"</td><td>"+json.list_test[i].startdate+"</td><td>"+json.list_test[i].enddate+"</td><td>"+json.list_test[i].limittime+
			    		"</td><td></td><td><input type='button' class='gradebtn' flag='"+json.list_test[i].flag+"' class_num='"+json.list_test[i].class_num+"' subjectid='"+json.list_test[i].subjectid+"' testid='"+json.list_test[i].testid+"' type_on='"+ json.list_test[i].type +"' value='성적입력'></td></tr>";
			    		c++;
	    			} else {
	    				str += "<tr><td>"+json.list_test[i].flag+"</td><td>"+json.list_test[i].class_num+"</td><td>"+json.list_test[i].subjectname+"</td><td>"+json.list_test[i].testname+"</td><td>"+json.list_test[i].type+"</td><td>"+json.list_test[i].startdate+"</td><td>"+json.list_test[i].enddate+"</td><td>"+json.list_test[i].limittime;
	    				for(var k = 0; k < json.list_grade[i].length; k++) {
	    					sum += json.list_grade[i][k].score;
	    					count++;
	    				}
	    				avg = sum / count;
				    	str += "</td><td>"+ avg +"</td><td>";
			    		str += "<input type='button' class='editgradebtn' flag='"+json.list_test[i].flag+"' class_num='"+json.list_test[i].class_num+"' subjectname='"+json.list_test[i].subjectname+"' subjectid='"+json.list_test[i].subjectid+"' testid='"+json.list_test[i].testid+"' type_on='"+ json.list_test[i].type +"' value='성적수정'></td></tr>";
			    		sum = 0; avg = 0; count = 0;
			    		c++;
	    			}
	    		}
	    		if(c != 0) {
	    			if(json.list_test[i].class_num != json.list_class[j]) {
	    				for(m; m < i; m++) {
		    				for(var k = 0; k < json.list_grade[m].length; k++) {
		    					sum += json.list_grade[m][k].score;
		    					count++;
		    				}
	    				}
	    				avg = sum / count;
	           			str += "<tr><td colspan='9' style='text-align: right; font-weight: bold;'>평균 :"+ avg +"</td><td></td></tr>";
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
	    				str += "<tr><td colspan='9' style='text-align: right; font-weight: bold;'>평균 :"+ avg +"</td><td></td></tr>";
	    			}
	    		} else {
	    			s = 1;
	    			c = 0;
	    		}
    		}
    	}
    	str += '</table>';
    	$('#table').html(str);
    	$('.gradebtn').click(function() {
    		//table에서 뿌려진 실재 값을 가져온다.
			var flag = $(this).attr('flag');
			var class_num = $(this).attr('class_num');
			var subjectid = $(this).attr('subjectid');
			var testid = $(this).attr('testid');
			var type = $(this).attr('type_on');
			//search한것의 정보를 저장하기 위해
			var flag_search = $('#flag').val();
	    	var online_search = $('#online').val();
	    	var subject_search = $('#subject').val();
	    	var class_num_search = $('#class_num').val();
	    	
			window.open('insertGradeForm.action?&teasubteavo.flag='+flag+ '&teasubteavo.class_num='+class_num+ '&teasubteavo.subjectid='+subjectid+'&teasubteavo.testid='+testid+'&teasubteavo.type='+type +'&flag='+flag_search +'&online='+online_search +'&subject='+subject_search +'&class_num='+class_num_search, 'insertGradeForm', 'width=400, top=200, height=400, left=400');
		});
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
			window.open('editGradeForm.action?teasubteavo.flag='+flag+ '&teasubteavo.class_num='+class_num+ '&teasubteavo.subjectname='+subjectname+ '&teasubteavo.subjectid='+subjectid+'&teasubteavo.testid='+testid+'&teasubteavo.type='+type+'&flag='+flag_search +'&online='+online_search +'&subject='+subject_search +'&class_num='+class_num_search, 'editGradeForm', 'width=400, top=200, height=400, left=400');
		});
    } */
    function chartDraw(){//차트그리는펑션
		RadarChart.defaultConfig.levelTick = true;
		RadarChart.draw(".chart-container", data);
    }
    function chartDrawJ(){//차트그리는펑션
		RadarChart.defaultConfig.levelTick = true;
		RadarChart.draw(".chart-containerJ", data);
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
              <li><a href="#">홈</a><span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>학사관리<span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>시험관리<span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li><a href="./testItUi.action">IT과목별시험</a></li>
            </ol>
             
            <ul id="tabs1" class="mctabs">
                <li><a href="#view1">IT</a></li>
                <li><a href="#view2">일본어</a></li>
            </ul>
            <div class="panel-container"><!-- 성적조회가 보여질 부분 -->
            <s:if test="#session.userSign!=null">
                <div id="view1">
		                  <div class="col-lg-4">
			       		<!-- 학생의 리스트가 보여지는 부분  -->
			       		<!-- =========================================== -->
<!-- 			       				   <table  id="table" data-width="400" data-click-to-select="true"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true">
 -->			       		
			       		<div id="studentViewList">
			       			<table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-pagination="true" data-search="true">
			       				<thead>
			       				<tr>
			       					<th>ID</th><th>이름</th>
			       				</tr>
			       				</thead>
			       				<tbody>
				      			<%-- <s:iterator value="studentList" status="stat"> --%>
				      				<s:iterator value="studentList">
					      			<tr>
					      				<td><s:property value="id"/></td>
					       				<td><s:a href="javascript:viewScore('%{id}')"><s:property value="name"/></s:a></td>
					       			</tr>
				       			</s:iterator><!--  -->
				       			</tbody>
				       		</table>
			       		</div>
			       		
			       	<!-- =========================================== -->	
			       		
		       		</div>
		       		<!-- ajax사용했을 경우 보여지는 부분(성적조회) -->
		       		<div id="scoreTable" class="col-lg-8">
		       			학생의 성적정보가 보여집니다.
		       		</div>
                </div>
                <div id="view2"><!-- 일본어 성적조회 -->
	                  
			                  <div class="col-lg-4">
				       		<!-- 학생의 리스트가 보여지는 부분  -->
				       		<div id="studentViewList">
				       		<table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-pagination="true" data-search="true">
			       				<thead>
			       					<tr><th>ID</th><th data-sortable='true'>이름</th></tr>
			       				</thead>
			       				<tbody>
					      			<s:iterator value="studentList" status="stat">
						      			<tr>
						      				<td><s:property value="studentList[#stat.index].id"/></td>
						       				<td><s:a href="javascript:viewScoreJ('%{studentList[#stat.index].id}')"><s:property value="studentList[#stat.index].name"/></s:a></td>
						       			</tr>
					       			</s:iterator><!--  -->
					       		</tbody>
					       	</table>
				       		</div>
			       		</div>
			       		<!-- ajax사용했을 경우 보여지는 부분(성적조회) -->
			       		<div id="scoreTableJ" class="col-lg-8">
			       			학생의 성적정보가 보여집니다.
			       		</div>
                </div>
             </s:if>
        	</div>
        </article>
        
        <!--본 영역이 메인프레임영역입니다 -->
        
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
</div>
</body>
</html>

<%-- var outhtml="";
 		   	outhtml+="<div class='col-lg-12'><table><tr>";
 		   	outhtml+="<td colspan='2'><div id='propicDiv' style='width:100px'>";
 	    	outhtml+="<div style='height:280px;width:240px;border:1px solid black;'>";
 		   	outhtml+="<img id='target' src='../upload/"+json.student.propic+"' alt='your image' height='280px' width='240px'/>";
 	    	outhtml+="이름 : "+json.student.name+"<br/>";
 	    	outhtml+="기수 : "+json.student.flagnum+"<br/>";
 	    	outhtml+="반 : "+json.student.class_num;
 	    	outhtml+="</div></td><td colspan='3'><div id='graphDiv' class='chart-containerJ' ></div></td></tr>";
 		   	outhtml+="<tr><td colspan='6' align='left' style='font-weight:bold;'>일본어과목별리스트</td></tr>";
 	    	outhtml+="<tr><th colspan='2'>시험일시</th><th>시험명</th><th>성적</th></tr>";
 	    	for(i=0;i<json.scoreListJ.length;i++){
 	 			outhtml+="<tr><td colspan='2'>"+json.scoreListJ[i].startdate.substring(0,11)+"</td><td>"+json.scoreListJ[i].testname+"</td><td>"+json.scoreListJ[i].score+"점</td></tr>";
 			}
 	    	outhtml+="<tr><td colspan='6' align='left' style='font-weight:bold;'>일본어 월말평가</td></tr>";
 	    	outhtml+="<tr><th colspan='2'>시험일시</th><th>시험명</th><th>필기</th><th>인터뷰</th><th>스피치</th></tr>";
 	    	for(i=0;i<json.scoreListJ2.length;i++){
 	 			outhtml+="<tr><td colspan='2'>"+json.scoreListJ2[i].startdate.substring(0,11)+"</td><td>"+json.scoreListJ2[i].testname+"</td><td>"+json.scoreListJ2[i].write+"점</td><td>"+json.scoreListJ2[i].interview+"점</td><td>"+json.scoreListJ2[i].speech+"점</td></tr>";
 			}
 	    	outhtml+="";
 			outhtml+="</table></div>";
 --%>