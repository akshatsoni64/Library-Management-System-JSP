<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="server.jsp"%>
<html>
    <head>
        <title>Library Management System</title>
        <link rel="icon" type="images/x-icon" href="PICS/logo.png">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            input
            {
                outline:none;
            }
            select
            {
                outline:none;
            }
            body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
            body {font-size:16px;}
            .w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
            .w3-half img:hover{opacity:1}
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JS/script.js"></script>
        <script>
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }
        </script>
    </head>
    <body background="PICS/lib_bg.jpg">
        <!-- Top menu on small screens -->
        <header class="w3-container w3-top w3-hide-large w3-blue w3-xlarge w3-padding">
            <a href="javascript:void(0)" class="w3-button w3-blue w3-margin-right" onclick="w3_open()">☰</a>
            <span>Library Management System</span>
        </header>

        <!-- Overlay effect when opening sidebar on small screens -->
        <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
        <nav class="w3-sidebar w3-blue w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-hover-black w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <div class="w3-container">
                <h3 class="w3-padding-55"><b>Library<br>Management<br>System</b></h3>
            </div>
            <div class="w3-bar-block">
                <%
                if(session_lms.getAttribute("username")==null)
                {
                %>
                <a id="open-login" class="w3-bar-item w3-button w3-hover-white w3-margin-top w3-round-xxlarge">Login</a>
                <a id="open-registration" class="w3-bar-item w3-button w3-hover-white w3-round-xxlarge">Register</a>
                <%
                }
                else
                {
                %><br>
                <div class="w3-section">
                    <label class="w3-bar-item">Data of :</label>
                    <select name="category" class="category" title="Select the option to view data">
                        <%
                            if(session_lms.getAttribute("usertype").equals("Student")){
                        %>
                        <option disabled selected>-- Select --</option>
                        <option value="books">Books</option>
                        <option value="issue">Issue</option>
                        <option value="fine">Fine</option>
                        <%
                        }
                        else if(session_lms.getAttribute("usertype").equals("Teacher")){
                        %>
                        <option disabled selected>-- Select --</option>
                        <option value="books">Books</option>
                        <option value="candidate">Candidate</option>
                        <option value="issue">Issue</option>
                        <option value="fine">Fine</option>
                        <option value="department">Department</option>
                        <%
                            }

                        %>
                    </select><br><br>
                </div>
                <%
                    if(session_lms.getAttribute("usertype").equals("Teacher"))
                    {
                    %>
                    <a id="open-book" class="w3-bar-item w3-button w3-hover-white w3-round-xxlarge">Add New Book</a>
                    <a id="open-issue" class="w3-bar-item w3-button w3-hover-white w3-round-xxlarge">Issue Book</a>
                    <a id="open-return" class="w3-bar-item w3-button w3-hover-white w3-round-xxlarge">Return Book</a>
                    <a id="open-fine" class="w3-bar-item w3-button w3-hover-white w3-round-xxlarge">Pay Fine</a>
                    <a id="log-out" class="w3-bar-item w3-button w3-hover-red w3-round-xxlarge">Logout</a>
                    <%
                    }
                    else if(session_lms.getAttribute("usertype").equals("Student"))
                    {
                    %>
                    <a id="open-issue" class="w3-bar-item w3-button w3-hover-white w3-round-xxlarge">Issue Book</a>
                    <a id="open-return" class="w3-bar-item w3-button w3-hover-white w3-round-xxlarge">Return Book</a>
                    <a id="open-fine" class="w3-bar-item w3-button w3-hover-white w3-round-xxlarge">Pay Fine</a>
                    <a id="log-out" class="w3-bar-item w3-button w3-hover-red w3-round-xxlarge">Logout</a>
                    <%
                    }
                }
                %>
            </div>
        </nav>
        <div id="data" class="w3-container" style="margin-top:15%;margin-left:22%"></div>
    </body>
</html>
<%@include file="modals.jsp"%>
