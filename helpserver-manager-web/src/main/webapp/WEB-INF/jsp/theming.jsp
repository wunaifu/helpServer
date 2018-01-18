<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/11
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>主题管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'> -->
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="../../lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/themes/flat-blue.css">
	<link rel="stylesheet" type="text/css" href="../../css/themes/flat-green.css">
</head>

<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">
            <!-- 头部 start -->
            <jsp:include page="head.jsp"/>
            <!-- 头部 end -->
			
			<!-- Main Content start-->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title">Theming</span>
                        <div class="description">Color Scheme and Theme Layout Configuration</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">
                                        <div class="title">Theming</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                  <p>Choose your navbar and sidebar color pattern. Default or Inverse Color.</p>
                                  <div class="sub-title">Navbar</div>
                                  <div>
                                    <div class="radio3 radio-check radio-inline">
                                      <input type="radio" id="radio1" name="radio-navbar" value="default" checked="">
                                      <label for="radio1">
                                        Default
                                      </label>
                                    </div>
                                    <div class="radio3 radio-check radio-inline">
                                      <input type="radio" id="radio2" name="radio-navbar" value="inverse">
                                      <label for="radio2">
                                        Inverse
                                      </label>
                                    </div>
                                  </div>
                                  <div class="sub-title">Sidebar</div>
                                  <div>
                                    <div class="radio3 radio-check radio-inline">
                                      <input type="radio" id="radio3" name="radio-sidebar" value="default">
                                      <label for="radio3">
                                        Default
                                      </label>
                                    </div>
                                    <div class="radio3 radio-check radio-inline">
                                      <input type="radio" id="radio4" name="radio-sidebar" value="inverse" checked="">
                                      <label for="radio4">
                                        Inverse
                                      </label>
                                    </div>
                                  </div>
                                  <div class="sub-title">Color Scheme</div>
                                  <div>
                                    <div class="radio3 radio-check radio-inline">
                                      <input type="radio" id="radio-blue" name="radio-color" value="blue" checked="">
                                      <label for="radio-blue">
                                        Blue (Default)
                                      </label>
                                    </div>
                                    <div class="radio3 radio-check radio-success radio-inline">
                                      <input type="radio" id="radio-green" name="radio-color" value="green">
                                      <label for="radio-green">
                                        Green
                                      </label>
                                    </div>
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			<!-- Main Content end-->
        </div>
        <footer class="app-footer">
            <div class="wrapper">
                <span class="pull-right">2.1 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2015 Copyright.
            </div>
        </footer>
    </div>
    <!-- Javascript Libs -->
    <script type="text/javascript" src="../../lib/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../lib/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../lib/js/Chart.min.js"></script>
    <script type="text/javascript" src="../../lib/js/bootstrap-switch.min.js"></script>

    <script type="text/javascript" src="../../lib/js/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="../../lib/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../lib/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="../../lib/js/select2.full.min.js"></script>
    <script type="text/javascript" src="../../lib/js/ace/ace.js"></script>
    <script type="text/javascript" src="../../lib/js/ace/mode-html.js"></script>
    <script type="text/javascript" src="../../lib/js/ace/theme-github.js"></script>
    <!-- Javascript -->
    <script type="text/javascript" src="../../js/app.js"></script>
    <script type="text/javascript" src="../../js/theming.js"></script>
    <!-- Javascript -->
</body>

</html>
