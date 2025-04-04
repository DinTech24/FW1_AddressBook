<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Address_book_Login_Page</title>
        <link rel="stylesheet" href="./Bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="./Style/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <cfoutput>
            <div class="d-flex accessPageHead justify-content-between py-2">
                <div class="ms-5">
                    <span class="fw-bold">ADDRESS BOOK</span>
                </div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6 mt-5">
                    <div class="d-flex align-items-center accessBodyMainDiv">
                        <div class="addressLoginMainDiv d-flex align-items-center">
                            <div class="addressLogoDiv">
                                <img width="150" height="150" src="./Assets/Images/address-book.png" alt="logo">
                            </div>
                        </div>
                        <div class="text-center loginMainDiv">
                            <div class="accessHeading">LOGIN</div>
                            <form method="POST">
                                <div>
                                    <div>
                                        <input name="emailId" id="" class="inputStyle" placeholder="EmailID" type="text">
                                    </div>
                                    <div>
                                        <input name="password" class="inputStyle" placeholder="Password" type="password">
                                    </div>
                                    <div>
                                        <button type="submit" name="loginButton" class="accessButton py-1 mt-5">LOGIN</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-3"></div>
            </div>
            <cfif structKeyExists(rc,"loginResponse")>
                <cfif rc.loginResponse EQ "failed">
                    <div class="text-center">
                        <div class="text-danger fw-bold mt-1">Invalid Credentials<div>
                    <div>
                </cfif>
            </cfif>
        </cfoutput>
    <script src="./JavaScript/script.js"></script>
    </body>
</html>