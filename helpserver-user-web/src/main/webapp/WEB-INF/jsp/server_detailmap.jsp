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
        body, html {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
            font-size: 14px;
        }

        #l-map {
            height: 100%;
            width: 100%;
        }
    </style>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=YUqCLjiE9ymXaCpOpZGU2sCZ6WXGHTGf"></script>
    <title>资源位置定位</title>
    <%
        NowUser nowUser = new NowUser();
        if (request.getSession().getAttribute("nowUser") != null) {
            nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        }

    %>
</head>
<body <%--onload="init(<%=nowUser.getLocation()%>)"--%>>
<div style="height: 0px;">
<input style="visibility: hidden" id="mylng" value="${mylng}">
<input style="visibility: hidden" id="mylat" value="${mylat}">
<input style="visibility: hidden" id="address" value="${address}">
</div>
<div id="l-map"></div>
<%--<div id="r-result"></div>--%>
</body>
</html>

<script src="/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script type="text/javascript">
    var mylng = $("#mylng").val();
    var mylat = $("#mylat").val();
    var address = $("#address").val();
    console.log(mylng+","+mylat+" address="+address);
    // 百度地图API功能
    var map = new BMap.Map("l-map");
    var point = new BMap.Point(mylng,mylat);
    // 创建点坐标
    map.centerAndZoom(point, 15);
    map.enableScrollWheelZoom(true);

    // 用经纬度设置地图中心点
    map.clearOverlays();
    var new_point = new BMap.Point(mylng,mylat);
    var marker = new BMap.Marker(new_point);  // 创建标注
    marker.addEventListener("click",attribute);
    map.addOverlay(marker);              // 将标注添加到地图中
    map.panTo(new_point);

    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画

    var infoWindow = new BMap.InfoWindow(address);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow,new_point); //开启信息窗口
//    document.getElementById("r-result").innerHTML = "信息窗口的内容是：<br />" + infoWindow.getContent();
    function attribute() {
        var infoWindow = new BMap.InfoWindow(address);  // 创建信息窗口对象
        map.openInfoWindow(infoWindow,new_point); //开启信息窗口
//        document.getElementById("r-result").innerHTML = "信息窗口的内容是：<br />" + infoWindow.getContent();
    }

    // 添加带有定位的导航控件
    var navigationControl = new BMap.NavigationControl({
        // 靠左上角位置
        anchor: BMAP_ANCHOR_TOP_LEFT,
        // LARGE类型
        type: BMAP_NAVIGATION_CONTROL_LARGE,
        // 启用显示定位
        enableGeolocation: true
    });
    map.addControl(navigationControl);
    // 添加定位控件
    var geolocationControl = new BMap.GeolocationControl();
    geolocationControl.addEventListener("locationSuccess", function(e){
        // 定位成功事件
        var address = '';
        address += e.addressComponent.province;
        address += e.addressComponent.city;
        address += e.addressComponent.district;
        address += e.addressComponent.street;
        address += e.addressComponent.streetNumber;
        //alert("当前定位地址为：" + address);
        console.log("当前定位地址为：" + address);
    });
    geolocationControl.addEventListener("locationError",function(e){
        // 定位失败事件
        alert(e.message);
    });
    map.addControl(geolocationControl);
</script>