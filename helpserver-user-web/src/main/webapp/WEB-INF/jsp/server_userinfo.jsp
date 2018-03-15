<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-01-28
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>商品页面</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="/css/optstyle.css" rel="stylesheet" />
    <link type="text/css" href="/css/style.css" rel="stylesheet" />

    <script type="text/javascript" src="/basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="/basic/js/quick_links.js"></script>

    <script type="text/javascript" src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="/js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="/js/list.js"></script>

</head>

<body>


<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">
        <div class="topMessage">
            <div class="menu-hd">
                <a href="#" target="_top" class="h">亲，请登录</a>
                <a href="#" target="_top">免费注册</a>
            </div>
        </div>
    </ul>
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
            <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
        </form>
    </div>
</div>

<div class="clear"></div>
<b class="line"></b>
<div class="listMain">

    <!--分类-->
    <div class="nav-table">
        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="#">首页</a></li>
                <li class="qc"><a href="#">闪购</a></li>
                <li class="qc"><a href="#">限时抢</a></li>
                <li class="qc"><a href="#">团购</a></li>
                <li class="qc last"><a href="#">大包装</a></li>
            </ul>
            <div class="nav-extra">
                <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
                <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
            </div>
        </div>
    </div>
    <ol class="am-breadcrumb am-breadcrumb-slash">
        <li><a href="#">首页</a></li>
        <li><a href="#">分类</a></li>
        <li class="am-active">内容</li>
    </ol>
    <script type="text/javascript">
        $(function() {});
        $(window).load(function() {
            $('.flexslider').flexslider({
                animation: "slide",
                start: function(slider) {
                    $('body').removeClass('loading');
                }
            });
        });
    </script>
    <!-- introduce-->

    <div class="introduce">

        <div class="introduceMain">
            <div class="am-tabs" data-am-tabs>

                <div class="am-tabs-bd">

                    <div class="am-tab-panel am-fade am-in am-active">
                        <div class="details">
                            <!--<div class="attr-list-hd after-market-hd">
                                <h4>商品细节</h4>
                            </div>-->
                            <div class="twlistNews">
                                <img style="width: 80px;height: 80px;" src="/images/tw1.jpg" />

                            </div>
                        </div>
                        <div class="clear"></div>
                        <div align="left" style="margin-left: 20px;vertical-align: top;color: #666;font-size:14px;">
                            <%--<ul id="J_AttrUL">--%>
                                <div style="margin-top: 10px;"><b style="color: #101010;">姓名:</b>&nbsp;零活</div>
                                <div style="margin-top: 10px;"><b style="color: #101010;">昵称:</b>&nbsp;200￥</div>
                                <div style="margin-top: 10px;"><b style="color: #101010;">地址:</b>&nbsp;湖北省武汉市</div>
                                <div style="margin-top: 10px;"><b style="color: #101010;">抢单时间:</b>&nbsp;2018-01-01 12:00:00</div>
                                <div style="margin-top: 10px;"><b style="color: #101010;">性别:</b>&nbsp;女</div>
                                <div style="margin-top: 10px;"><b style="color: #101010;">联系方式：</b>&nbsp;18219111621</div>
                                <div style="margin-top: 10px;"><b style="color: #101010;">个人简介：</b>&nbsp;开袋去壳即食，请放置于常温、阴凉、通风、干燥处保存，
                                    请放置于常温、阴凉、通风、干燥处保存，请放置于常温、阴凉、通风、干燥处保存
                                </div>
                            <%--</ul>--%>
                            <div class="clear"></div>
                        </div>



                    </div>


                </div>

            </div>

            <div class="clear"></div>

            <!--底部 start-->
            <jsp:include page="footer.jsp"></jsp:include>
            <!--底部 end-->
        </div>

    </div>
</div>
<!--菜单 -->


</body>

</html>
