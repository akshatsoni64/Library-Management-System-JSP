<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>LOGIN | LMS</title>
        <link rel="icon" type="images/x-icon" href="PICS/logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   
        <script src="JS/script.js"></script>
    </head>
    <body>
        <div id="login" class="w3-container w3-padding-16">
            <div class="w3-modal-content w3-card" style="max-width:600px">
                <div class="w3-center"><br>                   
                    <img src="PICS/img_avatar4.png" style="width:30%" class="w3-circle w3-margin-top">
                </div>
                <form class="w3-container" id="submit-login" method="post">
                    <div class="w3-section">
                        <label><b>Username</b></label>
                        <div class="w3-row w3-container">                            
                            <input class="s11 w3-col w3-left w3-round-xlarge w3-input w3-border" type="text" placeholder="Enter Username" name="username" id="username" required>
                            <button type="button" id="reset_username" class="w3-right w3-btn s1 w3-col"><i class="fa fa-refresh"></i></button>
                        </div>
                        <label><b>Password</b></label>
                        <div class="w3-row w3-container">                            
                            <input class="s11 w3-col w3-left w3-round-xlarge w3-input w3-border" type="password" placeholder="Enter Password" name="password" id="pswd" required>
                            <button type="button" id="reset_password" class="w3-right w3-btn s1 w3-col"><i class="fa fa-refresh"></i></button>
                        </div>                                                                       
                    </div>                
                    <div class="w3-container w3-padding w3-light-grey">
                        <span class="w3-left w3-padding w3-hide-small">
                            <button type="button" class="w3-col w3-round-xlarge w3-button w3-block w3-red w3-hover-red w3-section w3-padding" id="click-register">Register</button>                                                      
                        </span>
                        <span class="w3-right w3-padding w3-hide-small">
                            <input class="w3-round-xlarge w3-button w3-block w3-blue w3-hover-blue w3-section w3-padding" type="submit" name="submit_lms_login" value="Login">                           
                        </span>                    
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>