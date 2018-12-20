
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href=" ${path!}/css/bootstrap.min.css" rel="stylesheet">
    <link  href="${path!}/js/editor/lib/codemirror/codemirror.min.css" rel="stylesheet">
    <link  href="${path!}/js/editor/css/editormd.preview.css" rel="stylesheet">
    <link  href="${path!}/js/editor/css/editormd.css" rel="stylesheet">
    <link  href="${path!}/js/editor/css/editormd.logo.css" rel="stylesheet">
    <link  href="${path!}/js/editor/lib/codemirror/addon/dialog/dialog.css" rel="stylesheet">
    <script src="${path!}/js/jquery-3.2.1.js"></script>
    <script src="${path!}/js/bootstrap.min.js"></script>
    <script src="${path!}/js/editor/lib/marked.min.js"></script>
    <script src="${path!}/js/editor/lib/prettify.min.js"></script>
    <script src="${path!}/js/editor/lib/raphael.min.js"></script>
    <script src="${path!}/js/editor/lib/underscore.min.js"></script>
    <script src="${path!}/js/editor/lib/sequence-diagram.min.js"></script>
    <script src="${path!}/js/editor/lib/flowchart.min.js"></script>
    <script src="${path!}/js/editor/lib/jquery.flowchart.min.js"></script>
    <script src="${path!}/js/editor/editormd.js"></script>
    <title>${topic.title!} - VBoxs </title>
</head>
<body>
<!-- 引入header文件 -->
<#include "header.ftl">
<!-- <img src="https://source.unsplash.com/collection/954550/1920x1080"/> -->
<div style="
    width: 80%;
    margin: auto;
">
    <div class="panel panel-default" id="main" style="
    width: 100%;
    margin: auto;
    margin-top: 88px;">
        <div class="panel-heading" style="background-color: white">
            <div style="width: 35%;margin: auto;">
              <h3>${topic.title!}</h3>
                    <small class="text-muted"> <a href="${path!}/member/${topic.user.username}"><span ><strong>${topic.user.username}</strong></span></a></small>&nbsp;&nbsp;
                    <small class="text-muted">更新时间: ${(topic.updateTime?string('yyyy-MM-dd HH:mm:ss'))!}</small>&nbsp;&nbsp;
                    <small class="text-muted">${topic.click}次点击</small>
               
            </div>
       </div>
        
        <div><div id="markdownHtml" style="
    /* margin-right: 0px; */
    margin-left: 430px;
     margin-right: 213px;
    width: auto;
"></div></div>
       
    </div>


 <#include "footer.ftl">
 <div style="display:none;">

<textarea rows="" cols="" id="content-md">${topic.content!''}</textarea>
</div>
</div>
<script type="application/javascript">

    $(function(){
        console.log("页面加载完成");
        var content = $("#content-md").text();
       mdToHtml(content);
       $("#content-md").remove();
    })

    function mdToHtml(markdownTXT){
        editormd.markdownToHTML("markdownHtml",{
            markdown :markdownTXT,
            htmlDecode : "style,script,iframe",
            tocm :false,
            emoji :false,
            taskList :false
        });

    }

</script>
<!-- 引入侧边栏文件 -->
<#include "side.ftl">

<!-- 引入footer文件 -->


</body>
</html>