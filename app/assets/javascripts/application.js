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
