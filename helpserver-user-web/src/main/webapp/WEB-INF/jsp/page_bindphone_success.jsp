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
    <title>操作成功页面</title>
    <link rel="stylesheet"  type="text/css" href="/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/basic/css/demo.css" rel="stylesheet" type="text/css" />

    <link href="/css/sustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/basic/js/jquery-1.7.min.js"></script>

</head>

<body onload="RemainTime();">


<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="/index" target="_top" class="h">平台首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="/index_user" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="/index_myorder" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>我的订单</span><!--<strong id="J_MiniCartNum" class="h">0</strong>--></a></div>
        </div>
        <div class="topMessage favorite">
            <div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>消息</span></a></div>
        </div>
    </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
    <div class="logo"><img src="/images/logo.png" /></div>
    <div class="logoBig">
        <li><img src="/images/logobig.png" /></li>
    </div>

    <div class="search-bar pr">
        <a name="index_none_header_sysc" href="#"></a>
        <form>
            <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
            <input id="ai-topsearch" class="submit" value="搜索" index="1" type="submit"></form>
    </div>
</div>

<div class="clear"></div>



<div class="take-delivery">
    <div class="status">
        <h2 style="font-size: 20px;">绑定手机成功，请重新登录！还有&nbsp;
            <span id="timess" style="font-size: 23px;color: #fe0023">8</span>&nbsp;即将前往&nbsp;
            <a href="/login" style="font-size: 23px;color: #0c80ba">登录</a></h2>
        <div class="successInfo">
            <ul>
                <li style="font-size: 18px;margin: 10px 0 10px 0;">若手机已丢失或停用，请立即更换。</li>


                感谢您对我们平台的支持，如有对平台更好的建议，请反馈给我们，谢谢！

            </ul>

        </div>
    </div>
</div>


<!--底部 start-->
<jsp:include page="footer.jsp"></jsp:include>
<!--底部 end-->
<script>
    var iTime = 8;
    var Account;
    //时间60秒倒数
    function RemainTime(){
        var iSecond,sSecond="",sTime="";
        if (iTime >= 0){
            iSecond = parseInt(iTime);
            iMinute = 0;//parseInt(iTime/5)
            if (iSecond >= 0){
                if(iMinute>0){
                    sSecond = iMinute + "分" + iSecond + "秒";
                }else{
                    sSecond = iSecond + " 秒";
                }
            }
            sTime=sSecond;
            if(iTime==0){
                clearTimeout(Account);
                sTime='0';
                iTime = 0;
                //前往首页
                window.location.href="/login";
            }else{
                Account = setTimeout("RemainTime()",1000);
                iTime=iTime-1;
            }
        }else{
            sTime='nothing';
        }
        $("#timess").text(sTime);
    }
</script>

</body>
</html>

