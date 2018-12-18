<header style="
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 2;">
    <nav class="navbar navbar-default" role="navigation"
         style="background-image:url('/mybbs/img/icon/bgIMG1.png');background-size:100% 100%;margin-bottom: 0px;">
        <div class="container-fluid">
            <div class="navbar-header">
                <h2><a href="/mybbs/index"><p class="text-danger">VBoxs</p></a></h2>

            </div>
            <div>

                <ul class="nav navbar-nav navbar-right">

                <#if user.id??>
                    <li>
                        <p class=""><a href="${path!}/user/member/${user.username!}">${user.username!}</a>
                        </p>
                    </li>
                    <li>
                        <p class=""><a href="${path!}/user/settings">设置</a></p>
                    </li>
                    <li>
                        <p class=""><a href="javascript:signout_confirm();">登出</a></p>
                    </li>
                    <li><p class="text-danger"><a href="${path!}/creative_articles">创作新主题</a></p></li>
                    <li><p class="text-danger"><a href="">0条未读提醒</a></p></li>
                    <li><p class="text-danger"><a href="">积分:${user.credit!}</a></p></li>
                <#else >
                        <li>
                            <p class="navbar-text"><a href="${path!}/signin" class="btn btn-primary btn-block">登录</a>
                            </p>
                        </li>
                        <li>
                            <p class="navbar-text"><a href="${path!}/signup" class="btn btn-default btn-block">注册</a>
                            </p>
                        </li>
                </#if>

                </ul>
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