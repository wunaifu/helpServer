<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- head start -->
<nav class="navbar navbar-default navbar-fixed-top navbar-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-expand-toggle">
                <i class="fa fa-bars icon"></i>
            </button>
            <ol class="breadcrumb navbar-breadcrumb">
                <li class="active">服务平台后台管理</li>
            </ol>
            <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                <i class="fa fa-th icon"></i>
            </button>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                <i class="fa fa-times icon"></i>
            </button>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-comments-o"></i></a>
                <ul class="dropdown-menu animated fadeInDown">
                    <li class="title">
                        通知 <span class="badge pull-right">0</span>
                    </li>
                    <li class="message">
                        没有通知
                    </li>
                </ul>
            </li>
            <li class="dropdown danger">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-star-half-o"></i> 4</a>
                <ul class="dropdown-menu danger  animated fadeInDown">
                    <li class="title">
                        通知 <span class="badge pull-right">4</span>
                    </li>
                    <li>
                        <ul class="list-group notifications">
                            <a href="#">
                                <li class="list-group-item">
                                    <span class="badge">1</span> <i class="fa fa-exclamation-circle icon"></i> new registration
                                </li>
                            </a>
                            <a href="#">
                                <li class="list-group-item">
                                    <span class="badge success">1</span> <i class="fa fa-check icon"></i> new orders
                                </li>
                            </a>
                            <a href="#">
                                <li class="list-group-item">
                                    <span class="badge danger">2</span> <i class="fa fa-comments icon"></i> customers messages
                                </li>
                            </a>
                            <a href="#">
                                <li class="list-group-item message">
                                    view all
                                </li>
                            </a>
                        </ul>
                    </li>
                </ul>
            </li>
            <li class="dropdown profile">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">管理员 <span class="caret"></span></a>
                <ul class="dropdown-menu animated fadeInDown">
                    <li class="profile-img">
                        <img src="/img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
                    </li>
                    <li>
                        <div class="profile-info">
                            <h4 class="username">管理员</h4>
                            <p>emily_hart@email.com</p>
                            <div class="btn-group margin-bottom-2x" role="group">
                                <a type="button" class="btn btn-default" href="/manager/myinfo"><i class="fa fa-user"></i> Profile</a>
                                <a type="button" class="btn btn-default" href="/logout"><i class="fa fa-sign-out"></i> Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<!-- head end -->

<!-- 导航 start -->
<div class="side-menu sidebar-inverse">
    <nav class="navbar navbar-default" role="navigation">
        <div class="side-menu-container">
            <div class="navbar-header">
                <a class="navbar-brand">
                    <div class="icon fa fa-paper-plane"></div>
                    <div class="title">后台管理</div>
                </a>
                <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                    <i class="fa fa-times icon"></i>
                </button>
            </div>
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="/index">
                        <span class="icon fa fa-tachometer"></span><span class="title">首页</span>
                    </a>
                </li>
                <li class="panel panel-default dropdown">
                    <a data-toggle="collapse" href="#dropdown-element">
                        <span class="icon fa fa-archive"></span><span class="title">用户管理</span>
                    </a>
                    <!-- Dropdown level 1 -->
                    <div id="dropdown-element" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav navbar-nav">
                                <li><a href="/user/uselist">用户列表</a>
                                </li>
                                <li><a href="/user/banlist">已被禁用用户列表</a>
                                </li>
                                <li><a href="/user/unidentitylist">申请身份认证列表</a>
                                </li>
                                <li><a href="/user/unagreelist">身份认证不通过列表</a>
                                </li>
                                <li><a href="/user/identityedlist">身份认证已通过列表</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="panel panel-default dropdown">
                    <a data-toggle="collapse" href="#dropdown-table">
                        <span class="icon fa fa-table"></span><span class="title">账户余额管理</span>
                    </a>
                    <!-- Dropdown level 1 -->
                    <div id="dropdown-table" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav navbar-nav">
                                <li><a href="/money/userlist">用户余额列表</a>
                                </li>
                                <li><a href="/money/checkadd">余额充值申请列表</a>
                                </li>
                                <li><a href="/money/havedcheck">余额充值历史列表</a>
                                </li>
                                <li><a href="/money/checkget">余额提现申请列表</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <!-- Dropdown-->
                <li class="panel panel-default dropdown">
                    <a data-toggle="collapse" href="#component-example">
                        <span class="icon fa fa-cubes"></span><span class="title">金币管理</span>
                    </a>
                    <!-- Dropdown level 1 -->
                    <div id="component-example" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav navbar-nav">
                                <li><a href="/gold/usergold">用户金币列表</a>
                                </li>
                                <li><a href="/gold/checkadd">金币充值申请列表</a>
                                </li>
                                <li><a href="/gold/havedcheck">金币充值历史列表</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="panel panel-default dropdown">
                    <a data-toggle="collapse" href="#dropdown-form">
                        <span class="icon fa fa-file-text-o"></span><span class="title">资源服务管理</span>
                    </a>
                    <!-- Dropdown level 1 -->
                    <div id="dropdown-form" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav navbar-nav">
                                <li><a href="/ordertype/biglist">资源类型管理</a>
                                </li>
                                <li><a href="/order/listing">可租用资源服务列表</a>
                                </li>
                                <li><a href="/order/finishlist">已下架资源服务列表</a>
                                </li>
                                <li><a href="/order/banlist">已禁用资源服务列表</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>

                <!-- Dropdown-->
                <li class="panel panel-default dropdown">
                    <a data-toggle="collapse" href="#dropdown-icon">
                        <span class="icon fa fa-thumbs-o-up"></span><span class="title">平台头条管理</span>
                    </a>
                    <!-- Dropdown level 1 -->
                    <div id="dropdown-icon" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav navbar-nav">
                                <li><a href="/news/addjsp">添加平台头条</a>
                                </li>
                                <li><a href="/news/list">平台头条列表</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <!-- Dropdown-->
                <li class="panel panel-default dropdown">
                    <a data-toggle="collapse" href="#dropdown-example">
                        <span class="icon fa fa-slack"></span><span class="title">反馈管理</span>
                    </a>
                    <!-- Dropdown level 1 -->
                    <div id="dropdown-example" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav navbar-nav">
                                <li><a href="/feedback/undisposelist">未处理反馈列表</a>
                                </li>
                                <li><a href="/feedback/disposelist">历史反馈列表</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <a href="/manager/mypayaccount">
                        <span class="icon fa fa-desktop"></span><span class="title">我的支付宝</span>
                    </a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</div>
<!-- 导航 end -->