//滑动解锁插件
//2018年6月20日 作者:zsg
(function($) {
    function Slider(elem, options) {
        this.$container = elem;
        this.default = {
            width: this.$container.width() - 2,
            height: this.$container.height() - 2,
            bgColor: '#E8E8E8',
            progressColor: '#FFE97F',
            handleColor: '#fff',
            succColor: '#78D02E',
            text: 'slide to unlock',
            succText: 'ok!',
            textColor: '#000',
            succTextColor: '#000',
            stopColor: '#CCCC66',
            stopMarginLeft:'50',
            slideLengthId: 'slideLength',//用于保存滑动的距离的input id
            slideMillisecond: 2, //滑动秒数
            successFunc: function() {
                alert('successfully unlock!');
            }
        };
        this.options = $.extend({}, this.default, options);
        this.isSuccess = false;
    }
    Slider.prototype = {
        create: function() {
            var $container = this.$container;
            var options = this.options;
            initDOM();
            initStyle();

            function initDOM() {
                var template = '<div class="slide-to-unlock-bg">' +
                    '<span>' + options.text + '</span>' +
                    '</div>' +
                    '<div class="slide-to-unlock-progress">' +
                    '<div class="slide-to-unlock-stop"></div>' +
                    '</div>' +
                    '<div class="slide-to-unlock-handle"></div>';
                $container.html(template);
            }

            function initStyle() {
                $container.css({
                    position: 'relative',
                });
                $container.find('span').css({
                    lineHeight: options.height + 'px',
                    fontSize: options.height / 3.5,
                    color: options.textColor
                });
                $container.find('.slide-to-unlock-bg').css({
                    width: options.width + 'px',
                    height: options.height + 'px',
                    backgroundColor: options.bgColor,
                });
                $container.find('.slide-to-unlock-progress').css({
                    backgroundColor: options.progressColor,
                    height: options.height - 2 + 'px'
                });
                $container.find('.slide-to-unlock-stop').css({
                    backgroundColor: options.stopColor,
                    height: (options.height - 2) + 'px',
                    lineHeight: (options.height - 2) + 'px',
                    width: (Math.floor(options.width / 8)) + 'px',
                    marginLeft: options.stopMarginLeft + 'px',
                });
                $container.find('.slide-to-unlock-handle').css({
                    backgroundColor: options.handleColor,
                    height: (options.height - 0) + 'px',
                    lineHeight: (options.height - 0) + 'px',
                    width: (Math.floor(options.width / 8)) + 'px',
                });
            }
        },
        bindDragEvent: function() {
            var that = this;
            var $container = this.$container;
            var options = this.options;
            var downX;
            var operationTime;
            var $prog = $container.find('.slide-to-unlock-progress'),
                $stop = $container.find('.slide-to-unlock-stop'),
                $bg = $container.find('.slide-to-unlock-bg'),
                $handle = $container.find('.slide-to-unlock-handle');
            var maxMoveWidth = $bg.width() - $handle.width()
            var succMoveWidth = Number($stop.css('marginLeft').replace("px",""))
            $handle.on('mousedown', null, mousedownHandler);

            function getLimitNumber(num, min, max) {
                if (num > max) {
                    num = max;
                } else if (num < min) {
                    num = min;
                }
                return num;
            }

            function mousedownHandler(event) {
                downX = event.clientX;
                operationTime = new Date()
                $(document).on('mousemove', null, mousemoveHandler);
                $(document).on('mouseup', null, mouseupHandler);
            }

            function mousemoveHandler(event) {
                var moveX = event.clientX;
                var diffX = getLimitNumber(moveX - downX, 0, maxMoveWidth);
                $prog.width(diffX);
                $handle.css({
                    left: diffX
                });
                event.preventDefault();
            }

            function mouseupHandler(event) {

                var moveX = event.clientX;
                var diffX = getLimitNumber(moveX - downX, 0, maxMoveWidth);
                var scope = diffX - Number(succMoveWidth)
                if(scope >= -1 && scope <= 1){
                    if($("#"+options.slideLengthId)){
                        $("#"+options.slideLengthId).val(diffX)
                    }
                    nowTime = new Date();
                    millisecond = nowTime.getTime() - operationTime.getTime();
                    console.log(millisecond)
                    if(millisecond/1000 > options.slideMillisecond){//大于三秒才算成功
                        success();
                    }

                }
                if (!that.isSuccess) {
                    $prog.animate({
                        width: 0
                    }, 100);
                    $handle.animate({
                        left: 0
                    }, 100);
                }
                $(document).off('mousemove', null, mousemoveHandler);
                $(document).off('mouseup', null, mouseupHandler);
            }

            function success() {
                $prog.css({
                    width: $bg.width(),
                    backgroundColor: options.succColor
                });
                $container.find('span').css({
                    color: options.succTextColor
                });
                that.isSuccess = true;
                $container.find('span').html(options.succText);
                $handle.off('mousedown', null, mousedownHandler);
                $(document).off('mousemove', null, mousemoveHandler);
                setTimeout(function() {
                    options.successFunc && options.successFunc();
                }, 30);
            }
        }
    };
    $.fn.extend({
        slideToUnlock: function(options) {
            return this.each(function() {
                var slider = new Slider($(this), options);
                slider.create();
                slider.bindDragEvent();
            });
        }
    });
})(jQuery);
