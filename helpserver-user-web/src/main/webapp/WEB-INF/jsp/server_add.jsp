<%@ page import="com.helpserver.dto.NowUser" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-01-28
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人资料</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/infstyle.css" rel="stylesheet" type="text/css">
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</head>
<%
    NowUser nowUser = new NowUser();
    if (request.getSession().getAttribute("nowUser") != null) {
        nowUser = (NowUser) request.getSession().getAttribute("nowUser");
    }

%>
<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!-- top start -->
            <!--顶部导航条 -->
            <div class="am-container header">
                <ul class="message-l">
                    <div class="topMessage">
                        <div class="menu-hd">
                            <a href="#" target="_top">定位：<%=nowUser.getLocation()%></a>
                            <a href="/index_user" target="_top" class="h"><%=nowUser.getName()%>
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
                        <div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>消息</span></a>
                        </div>
                    </div>
                </ul>
            </div>

            <!--悬浮搜索框-->

            <div class="nav white">
                <%--<div class="logo"><img src="/images/logo1.png"/></div>--%>
                <div class="logoBig">
                    <li><img src="/images/logobig.png"/></li>
                </div>

                <div class="search-bar pr">
                    <a name="index_none_header_sysc" href="#"></a>
                    <form action="/searchserver">
                        <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
                        <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                    </form>
                </div>
            </div>
            <!-- top end -->

            <div class="clear"></div>
        </div>
    </article>
</header>
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
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="user-info">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;
                        <%--<a style="color: #0a628f" href="/index_user">服务中心&nbsp;</a> >&nbsp;--%>
                        <strong class="am-text-danger am-text-lg">发布服务</strong> /
                        <small>Server&nbsp;add</small>
                    </div>
                </div>
                <hr/>

                <!--个人信息 -->
                <div class="info-main">
                    <form class="am-form am-form-horizontal" action="#" method="post">
                        <div class="am-form-group">
                            <label for="ordertype" class="am-form-label">类型</label>
                            <div class="am-form-content birth">
                                <div class="birth-select2">
                                    <select data-am-selected id="ordertype" name="ordertype">
                                        <option value="a">零活</option>
                                        <option value="b">跑腿</option>
                                        <option value="b">其他</option>
                                    </select>
                                    <%--<em>省</em>--%>
                                </div>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="title" class="am-form-label">标题</label>
                            <div class="am-form-content">
                                <input type="text" id="title" name="title" placeholder="标题长度不能超过20个汉字"
                                maxlength="20">
                                <%--<small>标题长度不能超过20个汉字</small>--%>
                            </div>
                        </div>

                        <div class="am-form-group" style="height: auto;">
                            <label for="content" class="am-form-label">详情</label>
                            <div class="am-form-content">
                                <textarea type="text" id="content" name="content" placeholder="详情长度不能超过120个汉字"
                                          maxlength="120" rows="4"></textarea>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="commission" class="am-form-label">酬劳(￥)</label>
                            <div class="am-form-content">
                                <input type="text" id="commission" name="commission" placeholder="发布人额外支付的酬劳"
                                       maxlength="8">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="menAccount" class="am-form-label">人数</label>
                            <div class="am-form-content">
                                <input type="text" id="menAccount" name="menAccount" placeholder="服务所需要的人数"
                                       maxlength="5">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-form-label">性别</label>
                            <div class="am-form-content sex">
                                <label class="am-radio-inline">
                                    <input type="radio" name="sex" value="1" data-am-ucheck> 男
                                </label>
                                <label class="am-radio-inline">
                                    <input type="radio" name="sex" value="0" data-am-ucheck> 女
                                </label>
                                <label class="am-radio-inline">
                                    <input type="radio" name="sex" value="2" checked="checked" data-am-ucheck> 不限
                                </label>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-birth" class="am-form-label">地点</label>
                            <div class="am-form-content birth">
                                <div class="birth-select2">
                                    <select data-am-selected>
                                        <option value="a">广东</option>
                                        <option value="b">广西</option>
                                    </select>
                                    <em>省</em>
                                </div>
                                <div class="birth-select2">
                                    <select data-am-selected>
                                        <option value="a">广州</option>
                                        <option value="b">江门</option>
                                    </select>
                                    <em>市</em></div>
                                <div class="birth-select2">
                                    <select data-am-selected>
                                        <option value="a">白云区</option>
                                        <option value="b">蓬江区</option>
                                    </select>
                                    <em>区</em></div>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="expendTime" class="am-form-label">预计耗时</label>
                            <div class="am-form-content">
                                <input id="expendTime" name="expendTime" placeholder="预计服务所需要的时间" type="text" maxlength="20">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="username" class="am-form-label">联系人</label>
                            <div class="am-form-content">
                                <input id="username" name="username" placeholder="服务联系人姓名/称呼" type="text" maxlength="20">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="userphone" class="am-form-label">联系电话</label>
                            <div class="am-form-content">
                                <input id="userphone" name="userphone" placeholder="服务联系人的联系方式" type="text" maxlength="15">
                            </div>
                        </div>
                        <input style="visibility: hidden" id="orderState" name="orderState" value="0">

                        <div class="info-btn">
                            <div class="am-btn am-btn-danger">保存修改</div>
                        </div>

                    </form>
                </div>

            </div>

        </div>
        <!--底部 start-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--底部 end-->
    </div>

    <aside class="menu">
        <ul>
            <li class="person active">
                <a href="#"><i class="am-icon-user"></i>服务中心</a>
            </li>
            <li class="person">
                <p><i class="am-icon-balance-scale"></i>我的服务</p>
                <ul>
                    <li><a href="#">已发布</a></li>
                    <li> <a href="#">已接单</a></li>
                    <li> <a href="#">待评价</a></li>
                    <li> <a href="#">已完成</a></li>
                    <li><a href="#">草稿箱</a></li>
                </ul>
            </li>
        </ul>

    </aside>
</div>

</body>

</html>
