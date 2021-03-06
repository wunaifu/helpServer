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

<body>


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
            <div class="menu-hd"><a id="mc-menu-hd" href="/server/myaccept/list" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>我的订单</span><!--<strong id="J_MiniCartNum" class="h">0</strong>--></a></div>
        </div>
        <%--<div class="topMessage favorite">--%>
            <%--<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>消息</span></a></div>--%>
        <%--</div>--%>
    </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
    <div class="logo"><img src="/images/logo.png" /></div>
    <div class="logoBig">
        <li><img src="/images/logobig.png" /></li>
    </div>

    <!--头 start-->
    <jsp:include page="search.jsp"></jsp:include>
    <!--头 end-->
</div>

<div class="clear"></div>



<div class="take-delivery">
    <div class="status">
        <h2>您需付款</h2>
        <div class="successInfo">
            <ul>
                <li>租金付款金额<em>¥${needMoney}.00</em></li>
                <div class="user-info">
                    <p>返回扣除的押金：${moneyYa}</p>
                </div>
                请认真核对您的付款信息，如有错误请联系客服
            </ul>
            <div class="option">
                <span class="info">您可以</span>
                <a href="javascript:history.back();" class="J_MakePoint">返回<span>查看我的已抢单</span></a>
                <a href="#" onclick="putMoney(${acceptId},${pageNum})" class="J_MakePoint"><span>确认支付</span></a>
            </div>
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
<script src="/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script>
    function putMoney(acceptId,pageNum) {
        var url = "/server/"+acceptId+"/putmoney";
        $.ajax({
            type : "POST",
            url: url,
            contentType : "application/json;charset=utf-8",
            dataType : "text",
            error : function() {
                $.myToast("请求失败，请重试！");
            },
            success : function (data) {
                console.log(data);
                if (data=="update_success") {
                    $.myToast("付款成功，已归还押金并扣除租金及超期费用！");
                    window.location.href="/server/myaccept/list?pageNum="+pageNum;
                }else{
                    $.myToast("操作失败，请稍后再试！");
                }
            }
        });
    }
</script>
</body>
</html>

