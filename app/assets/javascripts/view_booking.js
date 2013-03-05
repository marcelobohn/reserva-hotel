// alert('teste')
//<![CDATA[ 
$(window).load(function(){
$("li").bind("mousemove", function(event) {
    $(this).find("div.tooltip").css({
        top: event.pageY + 5 + "px",
        left: event.pageX + 5 + "px"
    }).show();
}).bind("mouseout", function() {
    $("div.tooltip").hide();
});
});

