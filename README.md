# helpServer
资源服务互助平台
C87765250
4223e2ce730884f4024d753c5867b0ea

### 页面链接路径
* 保证页面文件及路径是完整链接
```html
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<base href="<%=basePath%>"></base>
<!--不使用/代表项目路径+js/jquery-1.7.2.min.js-->
<script src="js/jquery-1.7.2.min.js"></script>

```
