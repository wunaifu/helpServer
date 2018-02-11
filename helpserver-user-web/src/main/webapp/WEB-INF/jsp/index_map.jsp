<%--
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=YUqCLjiE9ymXaCpOpZGU2sCZ6WXGHTGf"></script>
    <title>定位</title>
</head>
<body onload="mylocation();">
<div id="r-result" style="height: 5%">
    关键字: <input id="cityName" type="text" style="width:200px; margin-right:10px;" placeholder="请输入要搜索的地点"/>
    <input type="button" value="查询" onclick="theLocation()" />
</div>
<div id="allmap" style="height: 95%"></div>

</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
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
        var local = new BMap.LocalSearch(map, {
            renderOptions:{map: map}
        });
        local.search(address);
//        alert("当前定位地址为：" + address);
    });
    geolocationControl.addEventListener("locationError",function(e){
        // 定位失败事件
        alert(e.message);
    });
    map.addControl(geolocationControl);

    map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

//    map.addEventListener("tilesloaded",function(){alert("地图加载完毕");});

    //点击事件，显示坐标
    function showInfo(e){
        alert(e.point.lng + ", " + e.point.lat);
        var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat)); // 创建点
//        marker.addEventListener("click",attribute);
        map.addOverlay(marker);    //增加点
    }
    map.addEventListener("click", showInfo);

    function theLocation(){
        var city = document.getElementById("cityName").value;
//        if(city != ""){
//            map.centerAndZoom(city,11);      // 用城市名设置地图中心点
//        }
        var local = new BMap.LocalSearch(map, {
            renderOptions:{map: map}
        });
        local.search(city);
    }
</script>
