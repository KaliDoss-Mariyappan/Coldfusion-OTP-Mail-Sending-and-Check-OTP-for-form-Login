<!DOCTYPE html>
<html>
    <head>
        <title>Coldfusion - MAIL OTP</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="assets/css/style.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container w-50 mx-auto mt-5">
            <form class="form" method="POST" name="secureLoginForm">
                <div class="form-group">
                    <label for="userName">Enter Your UserName</label>
                    <input type="text" name="userName" id="userName" class="form-control">
                </div>
                <div class="form-group">
                    <label for="userPassword">Enter Your Password</label>
                    <input type="password" name="userPassword" id="userPassword" class="form-control">
                </div>
                <input type="submit" name="loginBtn" class="btn btn-primary mt-2" value="Login">
            </form>
            <cfoutput>
                <cfif structKeyExists(form, 'loginBtn')>
                    <cfset loginCheck = application.loginObject.secureLoginProcess(userName = '#form.userName#',password = '#form.userPassword#')>
                    <cfset otpNumber = randRange(000000,999999)>
                    <cfmail to="tomailaddress@gmail.com" from="frommailaddress@gmail.com" subject="Example email" server="smtp.gmail.com" port="587" 
                        username="frommailaddress@gmail.com" password="usermailpassword" usessl="false" usetls="true">
                        Your OTP Number is : #otpNumber#
                    </cfmail>
                    <cfif loginCheck.recordCount GTE 1>
                        <cfset session.OTP = otpNumber>
                        <cflocation url="secureLogin.cfm" addtoken="false">
                    </cfif>
                </cfif>
            </cfoutput>
        </div>
    </body>
</html>