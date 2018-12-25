<body>
<link rel="stylesheet" type="text/css" href="${path!}/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${path!}/css/bootstrap-markdown.min.css">
<link rel="stylesheet" type="text/css" href="${path!}/css/font-awesome/css/font-awesome.min.css">
<script src="${path!}/js/jquery-3.2.1.js"></script>
<script src="${path!}/js/bootstrap.min.js"></script>
<script src="${path!}/js/markdown.js"></script>
<script src="${path!}/js/to-markdown.js"></script>
<script src="${path!}/js/bootstrap-markdown.js"></script>
<script src="${path!}/js/bootstrap-markdown.fr.js"></script>
<script src="${path!}/js/bootstrap-markdown.zh.js"></script>
<!-- 引入header文件 -->
<#include "header.ftl">
<div style="height:80%;">
    <div style="/* width: 60%; */margin:1% 2% 1% 5%;height: 100%;margin-top: 78px;margin-right: 180px;background-color: #f5f5f5;margin-left: 300px;">
        <div><span><a href="${path}/index">首页 </a> > 创作新主题</span></div>
        <div id="panel-body"
             style="width: 100%;/* margin:1% 2% 1% 5%; */height: 95%;margin-top: 5px;/* margin-right: 180px; */background-color: #f5f5f5;/* margin-left: 300px; */padding-top: 25px;/* border-top-width: 50px; */">
            <label for="name">标题</label>
            <input type="text" class="form-control" id="name" placeholder="请输入标题" style="border-color: #66afe9;"
                   name="title">
            <label for="content">正文</label>
            <textarea name="content" data-provide="markdown" data-iconlibrary="fa" rows="23" id="editor"></textarea>
            <label for="name">板块</label>
            <p>
        
                <select class="form-control btn-lg btn-block" id="tab" name="tab">

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
         

            </p>
            <p style=" margin-top: 15px;">
                <button type="button" id="submit-button" class="btn btn-default btn-lg btn-block"
                        style="border-color: #5bc0de;background-image: linear-gradient(to bottom,#fff 0,rgba(255,255,255,.15) 100%);">
                    提交
                </button>
            </p>
        </div>
           <#include "footer.ftl" >
    </div>
 
</div>
<!-- 引入footer文件 -->


<script type="text/javascript">
    function submitValidate(flag) {
        return flag;
    }

    $("#replyForm").submit(function () {
        if ($("#title").val() == '') {
            alert("请填写标题！");
            return submitValidate(false);
        } else {
            var ifSubmit = confirm("确定发表该主题吗?");
            if (ifSubmit == true) {

            } else {
                return submitValidate(false);
            }
        }
    })

    $("#editor").markdown({
        autofocus: true,
        language: 'zh',
        width: '300px',

    })

    function submitFrom() {


        var obj = $.getObject("#panel-body");
        console.log(obj);
        /*  */
    }

    $("#submit-button").click("on", function () {
        var obj = $.getObject("#panel-body");
        console.log(obj);
        $.post("${path!}/topic/add",obj,function(data){
            console.log(data);
          if(data.msg=="success"){
              window.location.href="${path!}/index";
          }
        })
    })


</script>
</body>
</html> 