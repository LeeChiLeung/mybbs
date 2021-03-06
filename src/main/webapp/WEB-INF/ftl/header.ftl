<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="Content-Type" content="text/html;charset=utf-8">
    <meta name="keywords" content="Genesis,论坛,社区,程序员">
    <title>VBoxs - 一个分享创造的开发者博客 </title>
    <link href="${path!}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path!}/js/jquery-3.2.1.js"></script>
    <script src="${path!}/js/bootstrap.min.js"></script>
    <script src="${path!}/js/js.red.js"></script>

</head>

<header style="
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 2;">

<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
	<div class="navbar-header">
	
		<a href="/mybbs/index" class="navbar-brand" ><p class="text-danger" style="
    /* margin-left: 130px; */
    font-size: 40px;
    margin-top: 8px;
    ">VBoxs</p></a>
	</div>
	  <#if user.id??>
	<div>
		<ul class="nav navbar-nav navbar-right">
		  <li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					${user.username!}
					<b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="${path!}/user/member/${user.username!}">我的资料-积分:${user.credit!}</a></li>
					<li><a href="${path!}/user/settings">设置</a></li>
					<li><a href="${path!}/creative_articles">创作新主题</a></li>
					<li class="divider"></li>
					<li><a href="javascript:signout_confirm();">登出</a></li>
					
				</ul>
			</li>
		</ul>
	</div>
	<#else>
	<ul class="nav navbar-nav navbar-right">
		<p class="navbar-text"><a href="${path!}/signin" class="btn btn-default btn-block">去登录</a>
	</ul>

	</#if>
	</div>
</nav>

</header>

<script>
    function signout_confirm() {
 
     window.location.href = "${path!}/user/signout";
   
    }
</script>