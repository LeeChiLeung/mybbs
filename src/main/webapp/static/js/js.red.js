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
    }



})