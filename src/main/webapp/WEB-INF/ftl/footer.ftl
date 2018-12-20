
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <style>
        li {list-style-type:none;}
        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular,AvenirNext-Regular,arial,Hiragino Sans GB,"Microsoft Yahei","Hiragino Sans GB","WenQuanYi Micro Hei",sans-serif;
            background: #f0f2f5;
        }
        .footer {
            background-color: #fff;
            margin-top: 0px;
            margin-bottom: 0px;
            width: 100%;
            padding-top: 22px;
            color: #8A8A8A;
            display: block;
            height: 200px;
            border: 1px ;
            clear:both
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
        a{
            color: #8A8A8A;
            cursor: pointer;
        }
    </style>
</head>
<body>
<footer class="footer">
    <div class="container">
        我们的目标是高品质的开发者社区，<br>
        致力于为开发者提供一个分享创造，<br>
        结识伙伴、协同互助的平台。
        <br/><br/><br/>
        <p>Designed by </span> lee </p>
    </div>
    <div class="info">

        <ul >
            <#--<li>会员数: ${usersNum!}</li>li-->
                <li> <p>统计信息</p></li>
            <li>话题数: ${topicsNum!}</li>
        </ul>
    </div>
    <div class="info">

        <ul >
            <li><p >友情链接</p></li>
            <li ><a href="https://github.com/" target="_blank">Github</a></li>
            <li><a href="https://segmentfault.com/" target="_blank">Segmentfault</a></li>
            <li><a href="https://www.v2ex.com/" target="_blank">v2ex</a></li>
        </ul>
    </div>
    <div class="info" >

        <ul >
            <li> <p >其他信息</p></li>
            <li><a href="/">关于本站</a></li>
            <li><a href="/">联系我们</a></li>
        </ul>
    </div>
</footer>
</body>
</html>