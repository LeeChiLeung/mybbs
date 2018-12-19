
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <link href=" ${path!}/css/bootstrap.min.css" rel="stylesheet">
<!--     <link  href="${path!}/js/editor/css/editormd.css" rel="stylesheet">
    <link  href="${path!}/js/editor/lib/codemirror/codemirror.min.css" rel="stylesheet">
    <link  href="${path!}/js/editor/lib/codemirror/addon/dialog/dialog.css" rel="stylesheet">
    <link  href="${path!}/js/editor/css/editormd.preview.css" rel="stylesheet">
    <link  href="${path!}/js/editor/css/editormd.css" rel="stylesheet">
    <link  href="${path!}/js/editor/css/editormd.logo.css" rel="stylesheet"> -->
    <link rel="stylesheet" type="text/css" href="${path!}/css/bootstrap-markdown.min.css">
      <link rel="stylesheet" type="text/css" href="${path!}/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="${path!}/css/font-awesome/css/font-awesome.min.css">
   
    <script src="${path!}/js/jquery-3.2.1.js"></script>
    <script src="${path!}/js/bootstrap.min.js"></script>
    <script src="${path!}/js/markdown.js"></script>
    <script src="${path!}/js/to-markdown.js"></script>
    <script src="${path!}/js/bootstrap-markdown.js"></script>
    <script src="${path!}/js/bootstrap-markdown.fr.js"></script>
<!--     <script src="${path!}/js/editor/lib/marked.min.js"></script>
    <script src="${path!}/js/editor/lib/prettify.min.js"></script>
    <script src="${path!}/js/editor/lib/raphael.min.js"></script>
    <script src="${path!}/js/editor/lib/underscore.min.js"></script>
    <script src="${path!}/js/editor/lib/sequence-diagram.min.js"></script>
    <script src="${path!}/js/editor/lib/flowchart.min.js"></script>
    <script src="${path!}/js/editor/lib/jquery.flowchart.min.js"></script>
    <srcipt src="${path!}/js/editor/lib/codemirror/codemirror.min.js"></srcipt>
    <script src="${path!}/js/editor/editormd.js"></script> -->
    <script src="${path!}/js/js.red.js"></script>
    <title>创作新主题 › V.Box.s </title>
</head>
<body>
<!-- 引入header文件 -->
<#include "header.ftl">

<div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="${path!}/index">VBoxs</a> › 创作新主题
        </div>

        <div class="panel-body" id="panel-body" style="height: 1165px;width: 1134px">
    

                <div class="form-group">
                    <label for="title">主题标题</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="请输入主题标题，如果标题能够表达完整内容，则正文可以为空" required="required">
                </div>
                <div class="form-group">
                    <label for="content">正文</label>
                    <#--<textarea class="form-control" rows="10" ></textarea>-->
                    <!-- <div class="form-control" id="content-md" name="content"></div> -->
                    <textarea name="content" data-provide="markdown" data-iconlibrary="fa" rows="10" id="editor"></textarea>
                </div>

                <div class="form-group">
                    <label for="tab">板块</label><br/>
                    <div class="col-sm-10" style="width: 40%">
                        <select class="form-control" id="tab" name="tab">

                            <#if tabs??>
                            <#list tabs as v>
                                <#if v_index==0>
                                    <option value="${v.id!}" selected>${v.tabName!}</option>
                                <#else >
                                <option value="${v.id!}">${v.tabName!}</option>
                                </#if>
                            </#list>
                            </#if>
                        </select>
                    </div>
                </div>


            <#--</form>-->
                <button  class="btn btn-default btn-sm"  onclick="submitFrom()">发布</button>
        </div>

    </div>



</div>


<div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
        发帖提示
    </div>
    <ul class="list-group" style="width: 100%">
        <li class="list-group-item">
            <h5>主题标题</h5>
            <p>
                请在标题中描述内容要点。如果一件事情在标题的长度内就已经可以说清楚，那就没有必要写正文了。
            </p>
        </li>

        <li class="list-group-item">
            <h5>正文</h5>
            <p>
                请清楚地表达所要说明的内容。
            </p>
        </li>
    </ul>
</div>


<div class="panel panel-default" id="sidebar1" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
        社区指导原则
    </div>
    <ul class="list-group" style="width: 100%">
        <li class="list-group-item">
            <h5>尊重原创</h5>
            <p>
                请不要发布任何盗版下载链接，包括软件、音乐、电影等等。V.Box.s是创意工作者的社区，我们尊重原创。
            </p>
        </li>

        <li class="list-group-item">
            <h5>友好互助</h5>
            <p>
                保持对陌生人的友善。用知识去帮助别人。
            </p>
        </li>
    </ul>
</div>


<!-- 引入footer文件 -->
<#include "footer.ftl" >

<script type="text/javascript">
    function submitValidate(flag){
        return flag;
    }
    $("#replyForm").submit(function () {
        if($("#title").val()==''){
            alert("请填写标题！");
            return submitValidate(false);
        }else {
            var ifSubmit=confirm("确定发表该主题吗?");
            if (ifSubmit == true){

            }else {
                return submitValidate(false);
            }
        }
    })
/*     $(function () {

       

        editormd("content-md",{
            width:'1145px',
            height:'900px',
            syncScrolling:"single",
            path:'./js/editor/lib/',
            name:'content'

        });
    }); */
//初始化markdown

    
    (function($){
    	$.fn.markdown.message.zh = {
    			'Bold': "粗体",
    	        'Italic': "斜体",
    	        'Heading': "标题",
    	        'URL/Link': "链接",
    	        'Image': "图片",
    	        'List': "列表",
    	        'Unordered List': "无序列表",
    	        'Ordered List': "有序列表",
    	        'Code': "代码",
    	        'Quote': "引用",
    	        'Preview': "预览",
    	        'strong text': "粗体",
    	        'emphasized text': "强调",
    	        'heading text': "标题",
    	        'enter link description here': "输入链接说明",
    	        'Insert Hyperlink': "URL地址",
    	        'enter image description here': "输入图片说明",
    	        'Insert Image Hyperlink': "图片URL地址",
    	        'enter image title here': "在这里输入图片标题",
    	        'list text here': "这里是列表文本",
    	        'code text here': "这里输入代码",
    	        'quote here': "这里输入引用文本"
    	}
    }(jQuery));
    
$("#editor").markdown({
    autofocus: true,
    language: 'zh',
})
    function submitFrom(){


        var obj=$.getObject("#panel-body");
        console.log(obj);
        $.post("${path!}/topic/add",obj,function(data){
            console.log(data);
          if(data.msg=="success"){
              window.location.href="${path!}/index";
          }
        })
    }
</script>
</body>
</html> 