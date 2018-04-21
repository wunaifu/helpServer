<%@ page import="com.helpserver.dto.NowUser" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-02-11
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <style type="text/css">
        body, html, #allmap {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
            font-family: "微软雅黑";
        }
    </style>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=YUqCLjiE9ymXaCpOpZGU2sCZ6WXGHTGf"></script>
    <link href="/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <%--<link href="/css/personal.css" rel="stylesheet" type="text/css">--%>
    <link href="/css/vipstyle.css" rel="stylesheet" type="text/css">
    <link href="/css/hmstyle.css" rel="stylesheet" type="text/css"/>
    <link href="/css/base.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/media.css" rel="stylesheet">
    <title>定位</title>
    <%
        NowUser nowUser = new NowUser();
        if (request.getSession().getAttribute("nowUser") != null) {
            nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        }

    %>
</head>
<body>
<div id="allmap"></div>
</body>
</html>
<script src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
    var mp = new BMap.Map("allmap");
    var point = new BMap.Point(116.404, 39.915);
    mp.centerAndZoom(point, 14);
    mp.enableScrollWheelZoom();
    mp.enableInertialDragging();

    mp.enableContinuousZoom();

    var size = new BMap.Size(10, 20);
    mp.addControl(new BMap.CityListControl({
        anchor: BMAP_ANCHOR_TOP_LEFT,
        offset: size,
        // 切换城市之间事件
        // onChangeBefore: function(){
        //    alert('before');
        // },
        // 切换城市之后事件
        // onChangeAfter:function(){
        //   alert('after');
        // }
    }));
    function showInfo(e){
        alert(e.point.lng + ", " + e.point.lat);
    }
    mp.addEventListener("click", showInfo);
</script>
