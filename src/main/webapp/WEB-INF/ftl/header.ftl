<header>
    <nav class="navbar navbar-default" role="navigation" style="background-color: white">
        <div class="container-fluid" style="margin-left: 10%">
            <div class="navbar-header">
                <a class="navbar-brand" href="${path!}/index">VBoxs</a>
                <span class="navbar-brand">一个分享创造的开发者社区 </span>
            </div>
            <div>

                <!--向左对齐-->
            <#--<ul class="nav navbar-nav navbar-left">-->
            <#--<li <c:if test="${tab.tabNameEn == 'tech'}">-->
            <#--class="active" </c:if>><a href="/tab/tech">技术</a>-->
            <#--</li>-->
            <#--<%--<li <c:if test="${tab.tabNameEn == 'play'}">class="active"--%>-->
            <#--<%--</c:if>><a href="/tab/play">好玩</a></li>--%>-->
            <#--<%--<li <c:if test="${tab.tabNameEn == 'creative'}">class="active"--%>-->
            <#--<%--</c:if>><a href="/tab/creative">创意</a></li>--%>-->
            <#--<%--<li <c:if test="${tab.tabNameEn == 'jobs'}">class="active"--%>-->
            <#--<%--</c:if>><a href="/tab/jobs">工作</a></li>--%>-->
            <#--<%--<li <c:if test="${tab.tabNameEn == 'deals'}">class="active"--%>-->
            <#--<%--</c:if>><a href="/tab/deals">交易</a></li>--%>-->

            <#--</ul>-->

            <#--<c:if test="${empty userId}">-->
            <#--<!--未登陆&ndash;&gt;-->
            <#--<ul class="nav navbar-nav navbar-right">-->
            <#--<li>-->
            <#--<p class="navbar-text"><a href="/signin">登录</a></p>-->
            <#--</li>-->
            <#--<li>-->
            <#--<p class="navbar-text"><a href="/signup">注册</a></p>-->
            <#--</li>-->
            <#--</ul>-->
            <#--</c:if>-->
            <#--<c:if test="${!empty userId}">-->
            <#--<!--已登陆&ndash;&gt;-->
                <ul class="nav navbar-nav navbar-right">

                <#if user.id??>
                    <li>
                        <p class="navbar-text"><a href="${path!}/user/member/${user.username!}">${user.username!}</a>
                        </p>
                    </li>
                    <li>
                        <p class="navbar-text"><a href="${path!}/user/settings">设置</a></p>
                    </li>
                    <li>
                        <p class="navbar-text"><a href="javascript:signout_confirm();">登出</a></p>
                    </li>
                    <li><p class="navbar-text"><a href="${path!}/creative_articles">创作新主题</a></p></li>
                    <li><p class="navbar-text"><a href="">0条未读提醒</a></p></li>
                    <li><p class="navbar-text"><a href="">积分:${user.credit!}</a></p></li>
                    <#else >
                        <li>
                            <p class="navbar-text"><a href="${path!}/signin" class="btn btn-primary btn-block">登录</a></p>
                        </li>
                        <li>
                            <p class="navbar-text"> <a href="${path!}/signup" class="btn btn-default btn-block">注册</a></p>
                        </li>
                </#if>

                </ul>
            <#--</c:if>-->
            </div>
        </div>
    </nav>


</header>
<script>
    function signout_confirm() {
        var r = confirm("确定退出?")
        if (r == true) {
            window.location.href = "${path!}/user/signout";
        }
        else {

        }
    }
</script>