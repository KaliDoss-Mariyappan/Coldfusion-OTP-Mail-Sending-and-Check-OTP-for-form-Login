$(document).ready(function() {
    $(".icon-bar span").hide();
    $(".icon-bar a").hover(function() {
        $(this).parent().css('width','200px');
        $(".icon-bar span").show();
    }, function() {
        $(this).parent().css('width','100px');
        $(".icon-bar span").hide();
    });

    $(".icon-bar a").on("click", function() {
        var fileId = $(this).attr('id');
        $.ajax({
            type : 'GET'
            , url : `${fileId}.cfm`
            , success : function(result) {
                $("#htmlContents").html(result);
            }
        });
    });
});