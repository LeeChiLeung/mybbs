<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="Content-Type" content="text/html;charset=utf-8">
    <meta name="keywords" content="Genesis,论坛,社区,程序员">
    <title>VBoxs - 一个分享创造的开发者社区 </title>
    <link href="/mybbs/css/bootstrap.min.css" rel="stylesheet">


    <script src="/mybbs/js/jquery-3.2.1.js"></script>
    <script src="/mybbs/js/bootstrap.min.js"></script>

    <style>
        li {
            list-style-type: none;
        }

        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular, AvenirNext-Regular, arial, Hiragino Sans GB, "Microsoft Yahei", "Hiragino Sans GB", "WenQuanYi Micro Hei", sans-serif;
            background: #f0f2f5;
        }

        .footer {
            background-color: #fff;
            margin-top: 22px;
            margin-bottom: 22px;
            width: 100%;
            padding-top: 22px;
            color: #8A8A8A;
            display: block;
            height: 200px;
            border: 1px;
            clear: both
        }

        .container {
            margin-right: 5%;
            margin-left: 5%;
            padding-left: 15px;
            padding-right: 15px;
            width: 40%;
            float: left;
        }

        .info {
            margin-right: 5%;
            width: 10%;
            float: left;
        }

        a {
            color: #8A8A8A;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->

<#include "header.ftl" />
<div class="panel panel-default" id="main" style="width: 70%;margin:1% 2% 5% 15%;float: left;">
    <div class="panel-heading" style="background-color: white">
        <a style="margin-right: 2%">活跃</a><a style="margin-right: 2%">精华</a><a style="margin-right: 2%">最近</a>
    </div>

    <ul class="list-group" style="width: 100%">


    <#list topics as va >
        <li class="list-group-item">
            <div style="height: 50px">
                <div style="float: left;width: 6%;margin-bottom: 5px">
                    <img width="50px" height="50px" src="/mybbs${va.user.avatar!}" class="img-rounded">
                </div>
                <div style="width: 89%;float: left">
                    <a href="/mybbs/t/${va.id!}">${va.title!}</a><br/>
                    <div>
                        <a><span class="label label-default">${va.tab.tabName!}</span></a>&nbsp;&nbsp;&nbsp;
                        <a href="/mybbs/member/${va.user.username!}"><span><strong>${va.user.username!}</strong></span></a>&nbsp;&nbsp;&nbsp;
                        <small class="text-muted">${va.localCreateTime!}</small>
                    </div>
                </div>
            <#--<div style="width: 5%;float: right;text-align: center">-->
            <#--<span class="badge">${va.countReplies!}</span>-->
            <#--</div>-->
            </div>
        </li>


    </#list>


    </ul>

</div>

<!-- 引入侧边栏文件 -->
<#include "side.ftl">

<!-- 引入footer文件 -->
<#include "footer.ftl">
</body>
</html>