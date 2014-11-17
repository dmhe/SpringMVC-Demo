<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <title>User Manage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The styles -->
    <link id="bs-css" href="${base}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/common/common.css" rel="stylesheet">
    <link href="${base}/css/datatables/jquery.dataTables.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="${base}/js/jQuery/jquery-1.11.1.min.js"></script>
    <script src="${base}/js/bootstrap/bootstrap.min.js"></script>
    <script src="${base}/js/datatables/jquery.dataTables.min.js"></script>
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="${base}/img/favicon.ico">
    <style type="text/css">
    	.panel-default .panel-heading{padding:6px 8px;line-height:34px;}
    </style>
</head>
<body>
    <!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">
        <div class="navbar-inner">
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">
                <span>Dmhe Study</span>
            </a>
            <!-- user dropdown starts -->
            <div class="btn-right pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> admin</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="login.html">退出</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->
            <ul class="collapse navbar-collapse nav navbar-nav top-menu">
                <li <#if mainMenu?? && mainMenu=="adminManage">class="active"</#if>><a href="${base}/admin/admin/getAdminUsers"><i class="glyphicon glyphicon-globe"></i> 后台管理</a></li>
                <li <#if mainMenu?? && mainMenu=="userManage">class="active"</#if>><a href="#"><i class="glyphicon glyphicon-globe"></i> 用户管理</a></li>
                
                <li>
                    <form class="navbar-search pull-left">
                        <input placeholder="Search" class="search-query form-control col-md-10" name="query" type="text">
                    </form>
                </li>
            </ul>
        </div>
    </div>
    <!-- topbar ends -->
	<div class="ch-container">
	    <div class="contentrow row">
	        <!-- left menu starts -->
	        <div class="col-sm-2 col-lg-2">
	            <div class="sidebar-nav">
	                <div class="nav-canvas">
	                    <div class="nav-sm nav nav-stacked"></div>
	                    <ul class="nav nav-pills nav-stacked main-menu">
	                    <#if mainMenu?? && mainMenu=="adminManage">
	                        <li class="nav-header">后台管理</li>
	                        <li <#if subMenu?? && subMenu=="adminUserManage">class="active"</#if>>
	                        	<a class="ajax-link" href="${base}/admin/admin/getAdminUsers"><i class="glyphicon glyphicon-home"></i><span> 用户管理</span></a>
	                        </li>
	                        <li <#if subMenu?? && subMenu=="roleManage">class="active"</#if>>
	                        	<a class="ajax-link" href="${base}/admin/admin/getRoles"><i class="glyphicon glyphicon-eye-open"></i><span> 角色管理</span></a>
	                        </li>
	                        <li <#if subMenu?? && subMenu=="resourceManage">class="active"</#if>>
	                        	<a class="ajax-link" href="${base}/admin/admin/getResources"><i class="glyphicon glyphicon-list-alt"></i><span> 资源管理</span></a>
	                        </li>
	                    </#if>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        <!-- left menu ends -->
	        <noscript>
	            <div class="alert alert-block col-md-12">
	                <h4 class="alert-heading">Warning!</h4>
	                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
	                    enabled to use this site.</p>
	            </div>
	        </noscript>
	
	        <div id="content" class="col-lg-10 col-sm-10">
	            <@block name="content"></@block>
	        </div>   
	    	<!-- content ends -->
	    </div>

    	<hr>

	    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">��</button>
	                    <h3>Settings</h3>
	                </div>
	                <div class="modal-body">
	                    <p>Here settings can be configured...</p>
	                </div>
	                <div class="modal-footer">
	                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
	                    <a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <footer class="row">
	        <p class="col-md-9 col-sm-9 col-xs-12 copyright">&copy; <a href="http://usman.it" target="_blank">Muhammad Usman</a> 2012 - 2014</p>
	        <p class="col-md-3 col-sm-3 col-xs-12 powered-by">Powered by: <a href="http://usman.it/free-responsive-admin-template">Charisma</a></p>
	    </footer>

	</div><!--/.fluid-container-->
</body>
</html>
