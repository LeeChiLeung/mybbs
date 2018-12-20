<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="Content-Type" content="text/html;charset=utf-8">
    <meta name="keywords" content="Genesis,论坛,社区,程序员">
    <title>VBoxs - 一个分享创造的开发者社区 </title>
    <link href="${path!}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path!}/js/jquery-3.2.1.js"></script>
    <script src="${path!}/js/bootstrap.min.js"></script>
    <script src="${path!}/js/js.red.js"></script>
    <script type="text/javascript">
        $(function () {

            var scrollFlag = 1;
            var startRow = 0;
            $("#boxScroll").on("scroll", function () {
                let $container = $(this);
                let containerHeight = $container.height();
                let scrollHeight = $container[0].scrollHeight;
                let scrollTop = $container[0].scrollTop;
                let scrollHeightCount = containerHeight + scrollTop;
                let flag = scrollHeightCount >= scrollHeight;

                console.log(containerHeight + scrollTop);
                if (flag && scrollFlag === 1) {
                    console.log("到达了底部");
                    scrollFlag = 0;
                    startRow += 16;
                    $.get("${path}/index/" + startRow, function (obj) {
                        if (obj.length == 0) {
                            scrollFlag = 0;
                        } else {
                            scrollFlag = 1;
                            startRow += 15;
                            let html = "";
                            for (let i = 0; i < obj.length; i++) {
                                console.log(obj[i]);
                                let index = obj[i];
                                html += " <tr class=\"list-group-item\">" +
                                        "        <th style=\"width: 100%;border-top: 0px;\">" +
                                        "            <div style=\"height: 100%;width: 100%;\">" +
                                        "                <div style=\"float: left;margin-bottom: 5px\">" +
                                        "                    <img width=\"50px\" height=\"50px\" src=\"${imgUrl!}" + index.user.avatar + "\" class=\"img-rounded\"/>" +
                                        "                    <span class=\"label label-default\">" + index.tab.tabName + "</span>" +
                                        "                    <span> <a href=\"${path!}/t/" + index.id + "\">" + index.title + "</a></span><br/>" +
                                        "                    <small class=\"text-muted\">" + $.dateFmt("yyyy-MM-dd HH:mm:ss ", index.updateTime) + "</small>" +
                                        "                </div>" +
                                        "                </div>" +
                                        "            </th>" +
                                        "        </tr>";


                            }
                            $(".table").append(html);

                        }


                    })


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
<!-- background-image: url('https://source.unsplash.com/collection/954550/1920x1080') -->
<div style="height:100%;width:70%;margin: auto;margin-top: 80px;">
    <div style="height:100%;width:100%;">
        <div style="height:96%;width:101%;overflow-y:auto; " id="boxScroll">
            <table class="table">
   <#list topics as va >
       <tr class="list-group-item">
           <th style="width: 100%;border-top: 0px;">
               <div style="height: 100%;width: 100%;">
                   <div style="float: left;margin-bottom: 5px">
                       <img width="50px" height="50px" src="${imgUrl!}${va.user.avatar!}" class="img-rounded"/>
                       <span class="label label-default">${va.tab.tabName!}</span>
                       <span> <a href="${path!}/t/${va.id!}">${va.title!}</a></span><br/>
                       <small class="text-muted">发布时间:  ${(va.updateTime?string('yyyy-MM-dd HH:mm:ss'))!}</small>
                   </div>
               </div>
           </th>
       </tr>


   </#list>
            </table>
        </div>
    </div>
<#include "footer.ftl">
</div>


<!-- 引入footer文件 -->


</body>
</html>