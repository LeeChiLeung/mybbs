<#if user.id??>

<!-- 已登录 -->
<div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
        <a href="/member/${user.username!}">${user.username!}</a>
    </div>
    <ul class="list-group" style="width: 100%">
        <li class="list-group-item"><a href="/creative_articles">创作新主题</a></li>
        <li class="list-group-item"><a href="">0条未读提醒</a></li>
        <li class="list-group-item"><a href="">积分:${user.credit!}</a></li>
    </ul>
</div>
<#else >

<!-- 未登录 -->
<div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
        <blockquote>
            Genesis
            <small>一个分享创造的开发者社区</small>
        </blockquote>
    </div>
    <ul class="list-group" style="width: 100%">
        <li class="list-group-item">
            <a href="/signin" class="btn btn-primary btn-block">登录</a>
            <a href="/signup" class="btn btn-default btn-block">注册</a>
        </li>
    </ul>
</div>
</#if>


<div class="panel panel-default" id="sidebar1" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
        热议主题
    </div>
    <ul class="list-group" style="width: 100%">
    <#--<c:forEach items="${hotestTopics}" var="hotestTopic">-->
            <#--<li class="list-group-item"><a href="/t/${hotestTopic.id}">${hotestTopic.title}</a></li>-->
        <#--</c:forEach>-->
    </ul>
</div>


