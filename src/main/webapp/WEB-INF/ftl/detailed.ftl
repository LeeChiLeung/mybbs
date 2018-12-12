
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
<div style="width: 70%;margin:1% 2% 1% 15%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <div>
                <#--<div class="panel-heading" style="background-color: white">-->
                    <#--<a href="/mybbs">Boxs</a> › 详细-->
                <#--</div>-->
                <h3>${topic.title!}</h3><br/>
                <div>
                    <a href="${path!}/member/${topic.user.username}"><span ><strong>${topic.user.username}</strong></span></a>&nbsp;&nbsp;
                    <small class="text-muted">${topic.localCreateTime}&nbsp;&nbsp;&nbsp;+08:00</small>&nbsp;&nbsp;
                    <small class="text-muted">${topic.click}次点击</small>
                </div>
            </div>

            <div style="float: right;margin-top: -100px" >
                <img width="50px" height="50px" src="/mybbs${topic.user.avatar}" class="img-rounded">
            </div>
        </div>

        <div id="markdownHtml"></div>
    </div>

  <#--div  <c:if test="${!empty replies}">-->
        <#--<div class="panel panel-default" id="main" style="">-->
            <#--<div class="panel-heading" style="background-color: white">-->
        <#--<span>-->
                <#--${fn:length(replies)} 回 复|  直到 <c:forEach items="${replies}" var="reply" varStatus="status">-->

<#--varStatus<c:if test="${status.last}">-->
<#--${reply.localCreateTime}-->
    <#--</c:if>-->
    <#--</c:forEach>-->
    <#--</span>-->
            <#--</div>-->

            <#--<ul class="list-group" style="width: 100%">-->
                <#--<!-- 遍历评论 &ndash;&gt;-->
                <#--<c:forEach items="${replies}" var="reply">-->
                    <#--<li class="list-group-item">-->
                        <#--<div style="height: 50px">-->
                            <#--<div style="float: left;width: 6%;margin-bottom: 5px">-->
                                <#--<img width="50px" height="50px" src="${reply.user.avatar} " class="img-rounded">-->
                            <#--</div>-->
                            <#--<div style="width: 89%;float: left">-->
                                <#--<a href="/member/${reply.user.username}"><strong>${reply.user.username}</strong></a>&nbsp;&nbsp;-->
                                <#--<small class="text-muted">${reply.localCreateTime}</small>-->
                                <#--<br/>-->
                                <#--<div>-->
                                    <#--<p>${reply.content}</p>-->
                                <#--</div>-->
                            <#--</div>-->
                        <#--</div>-->
                    <#--</li>-->
                <#--</c:forEach>-->

            <#--</ul>-->
        <#--</div>-->
    <#--</c:if>-->

    <#--<c:if test="${!empty user}">-->

        <#--<div class="panel panel-default" id="main" style="">-->
            <#--<div class="panel-heading" style="background-color: white">-->
                <#--添加一条新回复-->
            <#--</div>-->
            <#--<div class="panel-body">-->
                <#--<div class="form-group">-->
                    <#--<form action="/reply/add" method="post">-->
                        <#--<input type="hidden" name="topicId" value="${topic.id}">-->
                        <#--<input type="hidden" name="replyUserId" value="${user.id}">-->
                        <#--<textarea class="form-control" rows="3" name="content" required="required"></textarea><br/>-->
                        <#--<input type="submit" class="btn btn-default btn-sm" value="回复">-->
                    <#--</form>-->
                <#--</div>-->

            <#--</div>-->
        <#--</div>-->
    <#--</c:if>-->
<input type="hidden" id="content-md" value="${topic.content!""}">
</div>
<script type="application/javascript">

    $(function(){
        console.log("页面加载完成");
        var content = $("#content-md").val();
       mdToHtml(content);
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
<#include "footer.ftl">

</body>
</html>