<!DOCTYPE html>
<html>
    <head>
        <title>Secure Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="assets/css/style.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <cfif isDefined("session.OTP")>
            <div class="container mx-auto mt-5 w-50">
                <form method="POST" name="secureLoginCheckForm" class="form">
                    <div class="form-group">
                        <input type="text" name="checkOtp" id="checkOtp" class="form-control">
                    </div>
                    <input type="submit" name="checkOtpBtn" class="btn btn-primary" value="Check OTP">
                </form>
                <cfif structKeyExists(form, 'checkOtpBtn')>
                    <cfif form.checkOtp EQ session.OTP>
                        <cflocation url="welcome.cfm" addtoken="false">
                    <cfelse>
                        <div class="alert alert-danger alert-dismissible mt-2">
                            Sorry, Your OTP is Wrong...!
                        </div>
                    </cfif>
                </cfif>
            </div>
        <cfelse>
            <cflocation url="index.cfm" addtoken="false">
        </cfif>
    </body>
</html>