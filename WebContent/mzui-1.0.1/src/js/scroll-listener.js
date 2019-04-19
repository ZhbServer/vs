/* ========================================================================
 * MZUI: scroll-listener.js
 * https://github.com/easysoft/mzui
 * ========================================================================
 * Copyright (c) 2016 cnezsoft.com; Licensed MIT
 * ======================================================================== */


!(function($){
    'use strict';

    var NAME = 'mzui.scrollListener';

    var ScrollListener = function($element, options) {
        var that           = this;
        that.options       = options = $.extend({}, ScrollListener.DEFAULT, $element.data(), options);
        that.$             = $element;
        that.$container    = options.container ? (options.container == 'parent' ? that.$.parent() : $(options.container)) : that.$;
        that.lastScrollTop = 0;
        that.lastCallTime  = 0;
        var lastScrollCall = 0;

        $element.on('scroll.' + NAME, function() {
            clearTimeout(lastScrollCall);
            var time = new Date().getTime();
            lastScrollCall = setTimeout(function() {
                that.onScroll();
                that.lastCallTime = time;
            }, (time - that.lastCallTime) > options.handleInterval ? 0 : options.handleInterval);
        });

        if(options.canScrollClass) {
            var scrollHeight = (that.$[0] === window ? $('body') : that.$)[0].scrollHeight;
            that.$container.toggleClass(options.canScrollClass, scrollHeight > that.$.height());
        }
    };

    ScrollListener.prototype.onScroll = function() {
        var that            = this;
        var options         = that.options;
        var scrollTop       = that.$.scrollTop();
        var isInScroll      = scrollTop > 0;
        var scrollDirection = scrollTop > that.lastScrollTop ? 'down' : 'up';
        var directionClass  = options.directionClass;

        that.$container.toggleClass(options.inScrollClass, isInScroll)
            .toggleClass(directionClass + '-down', scrollDirection === 'down')
            .toggleClass(directionClass + '-up', scrollDirection === 'up')
            .toggleClass(directionClass + '-over', scrollTop + that.$.height() >= that.$[0].scrollHeight);

        that.$container.callEvent(that, 'listenScroll', [isInScroll, scrollDirection, scrollTop]);

        that.isInScroll      = isInScroll;
        that.scrollDirection = scrollDirection;
        that.lastScrollTop   = scrollTop;
    };

    ScrollListener.NAME = NAME;
    ScrollListener.DEFAULT = {
        minDelta      : 20,
        handleInterval: 100,
        inScrollClass : 'in-scroll',
        directionClass: 'scroll',
        canScrollClass: 'can-scroll'
    };

    $.bindFn('listenScroll', ScrollListener);

    $(function() {
        $(window).listenScroll({container: 'body'});
        $('.listen-scroll').listenScroll();
    });
}(CoreLib));
