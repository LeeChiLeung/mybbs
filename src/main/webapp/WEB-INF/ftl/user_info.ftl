
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/mybbs/css/bootstrap.min.css" rel="stylesheet">
    <script src="/mybbs/js/jquery-3.2.1.js"></script>
    <script src="/mybbs/js/bootstrap.min.js"></script>
    <title>VBoxs ›

    <#if userInfo??>
    ${userInfo.username!}
    <#elseif errorInfo??>
        会员未找到
    </#if>


    </title>
</head>
<body>
<!-- 引入header文件 -->
<#include "header.ftl">

<div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="/mybbs">VBoxs</a> › ${userInfo.username!}
        </div>

        <div class="panel-body">

                <#if userInfo??>
                <form class="form-horizontal" role="form">
                    <div style="margin-left: 17%">
                        <img width="60px" height="60px" src="/mybbs${userInfo.avatar!}" class="img-rounded">
                    </div><br/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">uid</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${userInfo.id!}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${userInfo.username!}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${userInfo.email!}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">注册时间</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${userInfo.localCreateTime!}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">积分</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${userInfo.credit!}</p>
                        </div>
                    </div>
                </form>
                <#elseif errorInfo??>
                    会员未找到!
                </#if>

        </div>
    </div>
</div>

<!-- 引入侧边栏文件 -->
<#include "side.ftl">

<!-- 引入footer文件 -->
<#include "footer.ftl">

</body>
</html>