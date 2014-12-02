// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .

$(document).ready(function() {
    $(".categories_bar").wrap('<div class = "categories_placeholder"></div>');
    $(".categories_placeholder").height($(".categories_bar").outerHeight());

    var scrollTop = 0;
    var menuOffset = $(".categories_bar").offset().top;
    $(window).scroll(function() {
        scrollTop = $(window).scrollTop();
        if(scrollTop >= menuOffset) {
            $(".categories_bar").addClass("fixed");
        } else {
            $(".categories_bar").removeClass("fixed");
        }
    });
});
