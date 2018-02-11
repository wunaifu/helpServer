<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/28
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人资料</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/infstyle.css" rel="stylesheet" type="text/css">
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!-- top start -->
            <jsp:include page="topuser.jsp"></jsp:include>
            <!-- top end -->

            <div class="clear"></div>
        </div>
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
                    <div class="am-fl am-cf"><a href="/index" style="color: #0a628f">首页&nbsp;>&nbsp;</a>
                        <a style="color: #0a628f" href="/index_user">个人中心&nbsp;>&nbsp;</a>
                        <strong class="am-text-danger am-text-lg">个人资料</strong> /
                        <small>Personal&nbsp;information</small>
                    </div>
                </div>
                <hr/>
                <form action="/user/update" enctype="multipart/form-data" method="post">
                    <!--头像 -->
                    <div class="user-infoPic">

                        <div class="filePic">
                            <input id="file" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                   name="file" onchange="c()" accept=".jpg,.png,.jpeg,.JPG,.PNG,.JPEG,">
                            <c:choose>
                                <c:when test="${userinfo.headicon!=null||userinfo.headicon!=''}">
                                    <img id="show" class="userheadicon am-circle am-img-thumbnail"
                                         src="/resources/img/${userinfo.headicon}" alt=""/>
                                </c:when>
                                <c:otherwise>
                                    <img id="show" class="am-circle am-img-thumbnail" src="/images/getAvatar.do.jpg" alt=""/>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <%--<p class="am-form-help">头像</p>--%>

                        <div class="info-m">
                            <div><b>手机号：<i>${userinfo.phone}</i></b></div>
                            <div><b>注册时间：<i>${userinfo.registertime}</i></b></div>
                            <div class="vip">
                                <c:choose>
                                    <c:when test="${userinfo.permission==0}">
                                        <span></span><a href="/user/idcard" style="color: red;">未实名认证</a>
                                    </c:when>
                                    <c:otherwise>
                                        <span></span><a href="/user/idcard" style="color: green;">已实名认证</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                        <input class="hidden" name="userid" value="${userinfo.userid}">
                    <!--个人信息 -->
                    <div class="info-main">
                        <div class="am-form am-form-horizontal">
                            <div class="am-form-group">
                                <label for="user-name2" class="am-form-label">昵称</label>
                                <div class="am-form-content">
                                    <input type="text" id="user-name1" placeholder="昵称" value="${userinfo.nickname}"
                                           maxlength="12" name="nickname" required>
                                    <small>昵称长度不能超过12个汉字</small>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-name2" class="am-form-label">姓名</label>
                                <div class="am-form-content">
                                    <input type="text" id="user-name2" placeholder="姓名" value="${userinfo.name}"
                                           maxlength="12" name="name" required>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-name2" class="am-form-label">性别</label>
                                <div class="am-form-content">
                                    <c:choose>
                                        <c:when test="${userinfo.sex==0}">
                                            <input type="text" id="user-name3" placeholder="性别（男/女）" value="女"
                                                   onkeyup="this.value=this.value.replace(/[^男女]/g,'')" maxlength="1"
                                                   name="sex" required>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="text" id="user-name3" placeholder="性别（男/女）" value="男"
                                                   onkeyup="this.value=this.value.replace(/[^男女]/g,'')" maxlength="1"
                                                   name="sex" required>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-name2" class="am-form-label">年龄</label>
                                <div class="am-form-content">
                                    <input type="text" id="user-name0" placeholder="年龄" value="${userinfo.age}"
                                           onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="2"
                                           name="age" required>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name2" class="am-form-label">地址</label>
                                <div class="am-form-content">
                                    <input type="text" id="user-name4" placeholder="地址" value="${userinfo.address}"
                                           maxlength="50" name="address" required>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name2" class="am-form-label">简介</label>
                                <div class="am-form-content">
                                    <input type="text" id="user-name5" placeholder="简介" value="${userinfo.userinfo}"
                                           maxlength="50" name="userinfo" required>
                                </div>
                            </div>

                            <div class="am-form-group safety">
                                <label class="am-form-label">账号安全</label>
                                <div class="am-form-content safety">
                                    <a href="/user/safety">
                                        <span class="am-icon-angle-right"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="info-btn">
                                <input value="保存修改" class="am-btn am-btn-danger" type="submit">
                            </div>
                        </div>

                    </div>
                </form>
            </div>

        </div>
        <!--底部 start-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--底部 end-->
    </div>

    <!--侧边菜单 start-->
    <jsp:include page="user_menu.jsp"></jsp:include>
    <!--侧边菜单 end-->
</div>
<script type="text/javascript">
    function c() {
        var r = new FileReader();
        f = document.getElementById('file').files[0];
        r.readAsDataURL(f);
        r.onload = function (e) {
            document.getElementById('show').src = this.result;
        };
    }
</script>
</body>

</html>
