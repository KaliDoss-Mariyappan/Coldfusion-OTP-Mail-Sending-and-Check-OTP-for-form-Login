$(document).ready(function() {
    $("#loginBtn").on("click", function() {
        console.log('Login Processing');
        $("#loginBtn").val('Wait...');
        var userEmail = $("#userEmail").val();
        var password = $("#userPassword").val();
        $.ajax({
            type : 'POST'
            , url : 'com/db/login.cfc?method=secureLoginProcess'
            , data : {
                'userName' : userEmail
                , 'password': password
            }
            , success : function(result) {
                $("#loginBtn").val('Success...');
                setInterval(function(){
                    var res = $.parseJSON(result);
                    if(res.DATA.length > 0) {
                        window.location = 'dashboard.cfm';
                    }
                    clearInterval();
                },1000);
            }
            , error : function(result) {
                $("#loginBtn").val('Error...');
                console.log('error', result);
            }
        });
    });
});