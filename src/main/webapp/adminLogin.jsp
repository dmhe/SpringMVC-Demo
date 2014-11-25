<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <title>User Manage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The styles -->
    <link id="bs-css" href="${base}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/common/common.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="${base}/js/jQuery/jquery-1.11.1.min.js"></script>
    <script src="${base}/js/bootstrap/bootstrap.min.js"></script>
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="${base}/img/favicon.ico">
    <style type="text/css">
    	div.center, p.center, img.center {
    display: block;
    float: none !important;
    margin-left: auto !important;
    margin-right: auto !important;
    text-align: center;
}
.login-header {
    height: 120px;
    padding-top: 30px;
}
.login-box .input-prepend {
    margin-bottom: 10px;
}
.login-box .btn {
    margin-top: 15px;
    width: 100%;
}
.well{padding:18px 25px;}
    </style>
</head>
<body>
<div class="ch-container">
    <div class="row">
        
    <div class="row">
        <div class="col-md-12 center login-header">
            <h2>欢迎登录后台管理系统</h2>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row">
        <div class="well col-md-4 center login-box">
            <div class="alert alert-info">
				请输入用户名和密码
            </div>
            <form class="form-horizontal" action="/login" method="post">
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                        <input type="text" name="username" class="form-control" placeholder="用户名">
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                        <input type="password" name="password" class="form-control" placeholder="密码">
                    </div>
                    <div class="clearfix"></div>

                    <div class="input-prepend">
                        <label class="remember" for="remember"><input type="checkbox" name="remember" id="remember"> 记住我</label>
                    </div>
                    <div class="clearfix"></div>

                    <p class="center col-md-5">
                        <button type="submit" class="btn btn-primary">登录</button>
                    </p>
                </fieldset>
            </form>
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->
</body>
</html>
