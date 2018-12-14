$.extend({

    getObject: function (_selector)
    {
        var _obj = {};
        $.each($(_selector + " input[type=text], "
            + _selector + " input[type=hidden], "
            + _selector + " input[type=password], "
            + _selector + " input[type=number], "
            + _selector + " input[type=email], "
            + _selector + " input[type=url], "
            + _selector + " select, "
            + _selector + " :radio:checked, "
            + _selector + " textarea"), function (i, obj) {
            var name = $(obj).attr("name");
            var value = $.trim($(obj).val());
            if (typeof(name) != "undefined" && name != null && name != "")
            {
                //alert(name + ": " + value);
                _obj[name] = value;
            }
        });
        return _obj;
    },

   dateFmt:  function dateFtt(fmt,val)  { 
	 var date = new Date(val)
  var o = {   
    "M+" : date.getMonth()+1,                 //月份   
    "d+" : date.getDate(),                    //日   
    "H+" : date.getHours(),                   //小时   
    "m+" : date.getMinutes(),                 //分   
    "s+" : date.getSeconds(),                 //秒   
    "q+" : Math.floor((date.getMonth()+3)/3), //季度   
    "S"  : date.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
} 

})