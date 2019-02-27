<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="server.jsp" %>
<html>
    <head>
        <link rel="icon" type="images/x-icon" href="PICS/logo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>REGISTER | LMS</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   
        <script src="JS/script.js"></script>
    </head>
    <body>
        <div id="register" class="w3-container w3-padding-16">
            <div class="w3-modal-content w3-card" style="max-width:600px">
                <div class="w3-center"><br>                   
                    <img src="PICS/img_avatar4.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
                </div>
                <form class="w3-container" id="submit-register" action="" method="post">
                    <div class="w3-section">
                        <label><b>Username</b></label>
                        <input type="text" id="username" name="username" class="w3-round-large w3-input w3-border w3-margin-bottom" placeholder="Enter Username" maxlength=30> 
                        <label><b>Candidate Name</b></label>
                        <input type="text" id="cname" name="cname" class="w3-round-large w3-input w3-border w3-margin-bottom" placeholder="Enter Candidate Name" maxlength=30> 
                        <label><b>Password</b></label>
                        <input type="password" id="password" name="password" class="w3-round-large w3-input w3-border w3-margin-bottom" placeholder="Enter Password" maxlength=30> 
                        <label><b>Department Id </b></label>
                        <%                   
                            String sql="select * from department";
                            rs=stmt.executeQuery(sql);
                        %>
                        <select id="deptid" name="deptid" class="w3-round-large w3-select w3-border w3-margin-bottom">
                            <% while(rs.next()) {%>
                            <option value="<% out.println(rs.getString("deptid")); %>"><% out.println(rs.getString("dname")); %></option>
                            <% } %>
                        </select><br>
                        <label><b>Candidate Type</b></label><br>
                        <input type="radio" name="ctype" class="w3-radio w3-border w3-padding w3-margin-bottom" value="Teacher"><label><b>&nbsp;Teacher</b></label>&nbsp;
                        <input type="radio" name="ctype" class="w3-radio w3-border w3-padding w3-margin-bottom" value="Student"><label><b>&nbsp;Student</b></label><br>
                    </div>                                                   
                    <div class="w3-container w3-border-top w3-padding w3-light-grey">                                            
                        <span class="w3-left w3-padding w3-hide-small">
                            <input type="reset" class="w3-round-xlarge w3-margin w3-btn w3-red w3-hover-red">
                        </span>
                        <span class="w3-right w3-padding w3-hide-small">
                            <input class="w3-round-xlarge w3-button w3-block w3-green w3-hover-blue w3-section w3-padding" type="submit" name="submit" value="Register">
                        </span>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
