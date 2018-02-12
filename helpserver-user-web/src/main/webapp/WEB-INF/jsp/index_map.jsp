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
<div class="hmtop" style="height: 25%">
    <!-- top start -->

    <!--顶部导航条 -->
    <div class="am-container header">
        <ul class="message-l">
            <div class="topMessage">
                <div class="menu-hd">
                    <a href="/map" target="_top">定位：<%=nowUser.getLocation()%>
                    </a>
                    <a href="/index_user" target="_top" class="h" style="margin-left: 50px;"><%=nowUser.getName()%>
                    </a>
                    <a href="/logout" target="_top">退出登录</a>
                </div>
            </div>
        </ul>
        <ul class="message-r">
            <div class="topMessage home">
                <div class="menu-hd"><a href="/index" target="_top" class="h">平台首页</a></div>
            </div>
            <div class="topMessage my-shangcheng">
                <div class="menu-hd MyShangcheng"><a href="/index_user" target="_top"><i
                        class="am-icon-user am-icon-fw"></i>个人中心</a></div>
            </div>
            <div class="topMessage mini-cart">
                <div class="menu-hd"><a id="mc-menu-hd" href="/index_myorder" target="_top"><i
                        class="am-icon-shopping-cart  am-icon-fw"></i><span>我的订单</span>
                    <!--<strong id="J_MiniCartNum" class="h">0</strong>--></a></div>
            </div>
            <div class="topMessage favorite">
                <div class="menu-hd"><a href="#" target="_top"><i
                        class="am-icon-heart am-icon-fw"></i><span>消息</span></a>
                </div>
            </div>
        </ul>
    </div>

    <!--悬浮搜索框-->

    <div class="nav white">
        <%--<div class="logo" style="margin: 10px 0 0 10px;">--%>
            <%--<a href="/index" target="_top" class="h" style="color: #0a628f;padding: 5px;font-size: 15px">首页</a>--%>
        <%--</div>--%>
        <%--<div class="logoBig">--%>
            <%--<li><img src="/images/logobig.png"/></li>--%>
        <%--</div>--%>
        <div class="search-bar pr">
            <a name="index_none_header_sysc" href="#"></a>
            <form>
                <input id="cityName" name="index_none_header_sysc" type="text" placeholder="请输入要搜索的地点"
                       autocomplete="off">
                <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="button"
                       onclick="theLocation()">
            </form>
        </div>
        <div class="search-bar pr">
            <a name="index_none_header_sysc" href="#"></a>
            <form action="finishmap" method="post">
                <input id="cityName1" name="locationmap" style="font-size: 17px;" type="text" readonly="true" value="<%=nowUser.getLocation()%>">
                <input id="ai-topsearch" class="submit am-btn" value="确定" index="1" type="submit">
            </form>
        </div>
    </div>
    <!-- top end -->
    <div class="clear"></div>
</div>
<div id="allmap" style="height: 75%"></div>

</body>
</html>
<script src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">

    var myLocationHere;
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(113.090575, 22.599154), 11);

    function myFun(result) {
        var cityName = result.name;
        map.setCenter(cityName);
        var local = new BMap.LocalSearch(map, {
            renderOptions: {map: map}
        });
        local.search(cityName);
        myLocationHere = cityName;
        $("#cityName1").attr("value",myLocationHere);
    }
    var myCity = new BMap.LocalCity();
    myCity.get(myFun);

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
    geolocationControl.addEventListener("locationSuccess", function (e) {
        // 定位成功事件
        var address = '';
        address += e.addressComponent.province;
        address += e.addressComponent.city;
        address += e.addressComponent.district;
        address += e.addressComponent.street;
        address += e.addressComponent.streetNumber;
        var local = new BMap.LocalSearch(map, {
            renderOptions: {map: map}
        });
        local.search(address);
        myLocationHere = address;
        $("#cityName1").attr("value",myLocationHere);
        //alert("2myLocationHere：" + myLocationHere);
    });
    geolocationControl.addEventListener("locationError", function (e) {
        // 定位失败事件
        alert(e.message);
    });
    map.addControl(geolocationControl);

    map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

    function theLocation() {
        var citySearch = document.getElementById("cityName").value;
        var localSearch = new BMap.LocalSearch(map, {
            renderOptions: {map: map}
        });
        localSearch.search(citySearch);
        myLocationHere = citySearch;
        $("#cityName1").attr("value",myLocationHere);
    }
</script>
