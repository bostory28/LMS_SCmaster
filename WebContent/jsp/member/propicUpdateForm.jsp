<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/custom.css" rel="stylesheet">
    <link href="../jquery-plugin/anythingSlider/anythingslider.css" rel="stylesheet">
    <script src="../js/respond.js"></script>
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../jquery-plugin/anythingSlider/jquery.anythingslider.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script>
    $(document).ready(function() {
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
    function nullCheckUpdate(){
    	/* alert("before ajax0"); */
    	var profile= document.getElementById("profile").value;
    	if(profile==""){
    		return false;	
    	}
    	return true;
    }
    </script>
</head>
<body>
<form action="propicUpdate.action" onsubmit="return nullCheckUpdate();" method="post" id="propicForm" enctype="multipart/form-data">
	<table>
		<tr>
			<td>
				<div class="col-lg-2" style="width:100px">
        			<div id="targetBox" style="height:150px;width:130px;border:1px solid black;">
        			 <img id="target" src="#" alt="your image" height="150px" width="130px"/>
        			</div>
        			 <input type="file" id="profile" name="upload"/>
        			 <input type="hidden" id="id" name="id" value="${sessionScope.userSign.id }"/>
        			 <input type="hidden" id="type" name="type" value="${sessionScope.userSign.type }"/>
        		</div>
			</td>
		</tr>
		<tr>
			<td align="right">
				<input type="submit" class="btn btn-default" value="사진변경">
			</td>
		</tr>
	</table>
</form>
</body>
</html>