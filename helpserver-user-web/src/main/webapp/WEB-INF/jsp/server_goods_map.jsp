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
            height: 300px;
            width: 100%;
        }
    </style>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=YUqCLjiE9ymXaCpOpZGU2sCZ6WXGHTGf"></script>
    <title>资源位置定位</title>
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>

    <link href="/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/vipstyle.css" rel="stylesheet" type="text/css">
    <link href="/css/hmstyle.css" rel="stylesheet" type="text/css"/>
    <link href="/css/base.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/media.css" rel="stylesheet">
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <%
        NowUser nowUser = new NowUser();
        if (request.getSession().getAttribute("nowUser") != null) {
            nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        }

    %>
</head>
<body <%--onload="init(<%=nowUser.getLocation()%>)"--%>>
<div class="hmtop" style="height: 15%">
    <!-- top start -->

    <!--顶部导航条 -->
    <div class="am-container header">
        <ul class="message-l">
            <div class="topMessage">
                <div class="menu-hd">
                    <a target="_top">定位：<i class="am-icon-map-marker"></i><%=nowUser.getLocation()%>
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
        <div class="logo" style="margin-top:18px;font-size: 11px;width: 60px;">
            <a><i class="am-icon-map-marker" style="color: #ff4d2d"></i><%=nowUser.getLocation()%></a></div>
        <div class="logoBig">
            <li><img src="/images/logobig.png"/></li>
        </div>

        <div class="search-bar pr">
            <a name="index_none_header_sysc" href="#"></a>
            <form>
                <input id="suggestId" name="search" type="text" placeholder="搜索" autocomplete="off">
                <input id="ai-topsearch" class="submit am-btn" value="确定" index="1" type="button" onclick="saveLocation()">
            </form>
            <%--<input style="visibility: hidden" name="mylng" id="mylng">--%>
            <%--<input style="visibility: hidden" name="mylat" id="mylat">--%>
        </div>
    </div>

    <!-- top end -->
    <div class="clear"></div>
</div>
<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
<div id="l-map" style="height: 85%"></div>
<%--<div id="r-result">请输入:<input type="text" id="suggestId" size="20" value="百度" style="width:150px;"/></div>--%>
</body>
</html>

<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script type="text/javascript">
    var mylng;
    var mylat;

    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var map = new BMap.Map("l-map");
    map.centerAndZoom("江门", 12);                   // 初始化地图,设置城市和地图级别。
    map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

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

    var ac = new BMap.Autocomplete({//建立一个自动完成的对象
        "input": "suggestId",
        "location": map
    });

    ac.addEventListener("onhighlight", function (e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province + _value.city + _value.district + _value.street + _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province + _value.city + _value.district + _value.street + _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function (e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
        G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

        setPlace();
    });

    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            map.addOverlay(new BMap.Marker(pp));    //添加标注
            mylng=pp.lng;
            mylat=pp.lat;
            console.log("mylng="+mylng);
            console.log("mylat="+mylat);
            console.log(pp);
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
        console.log(myValue);
    }
    function showInfo(e){
        mylng=e.point.lng;
        mylat=e.point.lat;
        alert(e.point.lng + ", " + e.point.lat);
        map.clearOverlays();    //清除地图上所有覆盖物
        map.centerAndZoom(e.point, 18);
        map.addOverlay(new BMap.Marker(e.point));    //添加标注
        console.log("mylng="+mylng);
        console.log("mylat="+mylat);
    }
    map.addEventListener("click", showInfo);

    function saveLocation() {
//        $("#mylng").val(mylng);
//        $("#mylat").val(mylat);
        console.log("mylng="+mylng);
        console.log("mylat="+mylat);
        if(mylng==undefined||mylat==undefined||mylng==''||mylat==''){
            $.myToast("请先定位，再确认");
            return false;
        }
        $.ajax({
            type : "POST",
            url: "/server/dogoodsmap?mylng=" + mylng + "&mylat=" + mylat+ "&location=" +encodeURI(encodeURI(myValue)),
            contentType : "application/json;charset=utf-8",
            dataType : "text",
            error : function() {
                $.myToast("请求失败，请重试");
            },
            success:function (data) {
                if (data!=null) {
                    console.log(data);
                    if (data=="success"){
                        $.myToast('定位成功，返回继续填写');
                    }
                }else {
                    $.myToast("请求失败，请重试");
                }
            }
        });
    }
</script>