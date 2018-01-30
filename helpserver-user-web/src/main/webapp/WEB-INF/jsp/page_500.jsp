<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-01-28
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>500</title>
	<link rel="stylesheet"  type="text/css" href="/AmazeUI-2.4.2/assets/css/amazeui.css"/>
	<link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="/basic/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="/css/errorstyle.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/basic/js/jquery-1.7.min.js"></script>

</head>

<body>

<!-- top start -->
<jsp:include page="toperror.jsp"></jsp:include>
<!-- top end -->

<div class="clear"></div>
<div class="take-delivery" >
	<div class="status">
		<h2 style="font-size: 20px;">服务器出了点问题！前往<a style="font-size: 20px;color: #0c80ba" href="/index">首页</a></h2>
		<div class="successInfo">
			<ul>
				<%--<li>操作失败，请检查您的操作！</li>--%>

				感谢您对我们平台的支持，如有对平台更好的建议，请反馈给我们，谢谢！前往<a href="/index"style="font-size: 17px;color: #0c80ba">首页</a>

			</ul>

		</div>
	</div>
</div>


<div class="footer" >
	<div class="footer-hd">
		<p>
			<a href="#">恒望科技</a>
			<b>|</b>
			<a href="#">商城首页</a>
			<b>|</b>
			<a href="#">支付宝</a>
			<b>|</b>
			<a href="#">物流</a>
		</p>
	</div>
	<div class="footer-bd">
		<p>
			<a href="#">关于恒望</a>
			<a href="#">合作伙伴</a>
			<a href="#">联系我们</a>
			<a href="#">网站地图</a>
			<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
		</p>
	</div>
</div>
</body>
</html>

