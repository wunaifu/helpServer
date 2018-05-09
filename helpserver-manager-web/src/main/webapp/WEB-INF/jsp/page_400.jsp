<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	
    <title>400</title>
	
	<!-- num -->
    <link href="/css/num.css" rel="stylesheet">
	<script src="/js/jquery-1.7.2.min.js"></script>
    
<!--注意 -->
<%--这个东东只在这里调用而已 --%>
<script type="text/javascript">
	$(function() {
		var h = $(window).height();
		$('body').height(h);
		$('.mianBox').height(h);
		centerWindow(".tipInfo");
	});
	//2.将盒子方法放入这个方，方便法统一调用<%--这个东东只在这里调用而已 --%>
	function centerWindow(a) {
		center(a);
		//自适应窗口
		$(window).bind('scroll resize',
				function() {
					center(a);
				});
	}
	//1.居中方法，传入需要剧中的标签<%--这个东东只在这里调用而已 --%>
	function center(a) {
		var wWidth = $(window).width();
		var wHeight = $(window).height();
		var boxWidth = $(a).width();
		var boxHeight = $(a).height();
		var scrollTop = $(window).scrollTop();
		var scrollLeft = $(window).scrollLeft();
		var top = scrollTop + (wHeight - boxHeight) / 2;
		var left = scrollLeft + (wWidth - boxWidth) / 2;
		$(a).css({
			"top": top,
			"left": left
		});
	}
</script>
</head>
<body>
<div class="mianBox">
	<img src="/img/yx400.png" alt=""  class="num403" style="height: 75%"/>
	<div class="tipInfo tiao" style="height: 25%">
		<div class="in">

			<div class="textThis">
				<%
					if (request.getAttribute("reason") == null) {
				%>
				<h2>操作失败，请检查您的操作！</h2>
				<%
				} else {
				String reason = (String) request.getAttribute("reason");
				%>
				<h2><%=reason%></h2>
				<%
				}
				%>
				<!-- <h2>You do not have permission to access this content</h2> -->
				<p><span><a href="javascript:history.back();">back?</a></span></p>
			</div>
		</div>
	</div>
</div>
  </body>
</html>