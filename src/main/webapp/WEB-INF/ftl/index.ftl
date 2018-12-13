<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="Content-Type" content="text/html;charset=utf-8">
    <meta name="keywords" content="Genesis,论坛,社区,程序员">
    <title>VBoxs - 一个分享创造的开发者社区 </title>
    <link href="${path!}/css/bootstrap.min.css" rel="stylesheet">


    <script src="${path!}/js/jquery-3.2.1.js"></script>
    <script src="${path!}/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	
     var scrollFlag = 1;
     $("#boxScroll").on("scroll",function(){
    	 let $container=$(this);
    	 let containerHeight = $container.height();
    	 let scrollHeight = $container[0].scrollHeight;
    	 let scrollTop = $container[0].scrollTop;
    	 let scrollHeightCount = containerHeight+scrollTop;
    	 let flag = scrollHeightCount+100 >= scrollHeight;
    	 
    	 console.log(containerHeight+scrollTop);
    	 if(flag&& scrollFlag===1){
    		 console.log("到达了底部");
    		 scrollFlag = 0;
    	 }
     })
     
    	
    	
    	
    	
    })
    
    
    
    </script>
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

<div style="height:100%;width:100%;background-image: url('https://source.unsplash.com/collection/954550/1920x1080')">
<div class="panel panel-default" id="main" style="width:70%;height:80%;margin:1% 2% 1% 15%;float: left;">
    
<div style="width:100%;height:100%;overflow-x: hidden;overflow-y:scroll;" >
<div style="width:140%;height:100%;overflow-x:hidden;"id="boxScroll">
    <ul class="list-group" style="width: 100%">



    <#list topics as va >
        <li class="list-group-item">
            <div style="height: 50px">
                <div style="float: left;margin-bottom: 5px">
                    <img width="50px" height="50px" src="${path!}${va.user.avatar!}" class="img-rounded">
                </div>
                <div style="width: 89%;float: left">
                    <a href="${path!}/t/${va.id!}">${va.title!}</a><br/>
                    <div>
                        <a><span class="label label-default">${va.tab.tabName!}</span></a>&nbsp;&nbsp;&nbsp;
                        <a href="${path!}/member/${va.user.username!}"><span><strong>${va.user.username!}</strong></span></a>&nbsp;&nbsp;&nbsp;
                        <small class="text-muted">${va.localCreateTime!}</small>
                    </div>
                </div>
          
            </div>
        </li>


    </#list>


    </ul>
    </div>
</div>

</div>
<#include "footer.ftl">
</div>


<!-- 引入footer文件 -->


</body>
</html>