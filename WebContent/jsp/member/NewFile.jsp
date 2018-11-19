<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.js"></script>
 <style>
  #HelloBoy{
     border:1px solid;
     background:#ff9999;
     width:200px;
     height:120px;
     display:none;
     position:absolute;
   }
 </style>
  <script>
   var mouseX,mouseY,windowWidth,windowHeight;
   var  popupLeft,popupTop;
 $(document).ready(function(){

   $(document).mousemove(function(e){
           mouseX = e.pageX;
           mouseY = e.pageY;
           //To Get the relative position
           if( this.offsetLeft !=undefined)
             mouseX = e.pageX - this.offsetLeft;
           if( this.offsetTop != undefined)
             mouseY = e.pageY; - this.offsetTop;

           if(mouseX < 0)
                mouseX =0;
           if(mouseY < 0)
               mouseY = 0;

           windowWidth  = $(window).width();
           windowHeight = $(window).height();
   });
     $('.studentNames').hover(function(){
       $('#HelloBoy').show();
      var popupWidth  = $('#HelloBoy').outerWidth();
      var popupHeight =  $('#HelloBoy').outerHeight();

      if(mouseX+popupWidth > windowWidth)
        popupLeft = mouseX-popupWidth;
      else
       popupLeft = mouseX;

      if(mouseY+popupHeight > windowHeight)
        popupTop = mouseY-popupHeight;
      else
        popupTop = mouseY; 
      if(popupLeft < 0)
          popupLeft = 0;
      if(popupTop < 0)
          popupTop = 0;

      $('#HelloBoy').offset({top:popupTop,left:popupLeft}); 
      },function(){$('#HelloBoy').hide();});
     
     });
  </script>
 </head>

 <body>
        <br/><br/><br/>  <br/><br/><br/><br/> <br/><br/> <br/>   <br/>   <br/>   <br/>   <br/>   <br/> 
        <br/><br/> <br/> <br/> <br/>    <br/><br/><br/> <br/><br/>  <br/>   <br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/>    
		<a class="studentNames">test</a><br/>
		<a class="studentNames">test2</a><br/>
		<a class="studentNames">test3</a><br/>
        <div id="HelloBoy">
         s dflasld fsadf
         sdfas dfsadf
        </div>

</body>

</html>