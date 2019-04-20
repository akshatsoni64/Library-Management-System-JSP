<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Registration Form-->
<div id="register" class="w3-modal w3-container w3-padding-16">
    <div class="w3-modal-content w3-card" style="max-width:600px">
        <div class="w3-center"><br>
            <img src="PICS/img_avatar4.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
        </div>
        <form class="w3-container" id="submit-register" action="" method="post">
            <div class="w3-section">
                <input type="text" required id="username_reg" name="username" class="w3-round-large w3-input w3-border w3-margin-bottom" placeholder="Enter Username" maxlength=30>
                <input type="text" required id="cname" name="cname" class="w3-round-large w3-input w3-border w3-margin-bottom" placeholder="Enter Candidate Name" maxlength=30>
                <input type="password" required id="password" name="password" class="w3-round-large w3-input w3-border w3-margin-bottom" placeholder="Enter Password" maxlength=30>
                <%
                    String sql="select * from department";
                    rs=stmt.executeQuery(sql);
                %>
                <select id="deptid" name="deptid" class="w3-round-large w3-select w3-border w3-margin-bottom" title="Select Department">
                    <option disabled>Select Department</option>o
                    <% while(rs.next()) {%>
                    <option value="<% out.println(rs.getString("deptid")); %>"><% out.println(rs.getString("dname")); %></option>
                    <% } %>
                </select><br>
                <label><b>Candidate Type: </b></label>&nbsp;
                <input type="radio" name="ctype" class="w3-radio w3-border w3-padding w3-margin-bottom" value="Teacher"><label><b>&nbsp;Teacher</b></label>&nbsp;
                <input type="radio" name="ctype" class="w3-radio w3-border w3-padding" value="Student"><label><b>&nbsp;Student</b></label><br>
            </div>
            <span class="w3-right w3-padding w3-hide-small">
                <input type="reset" class="w3-round-xxlarge w3-margin w3-btn w3-red w3-hover-red">
            </span>
            <span class="w3-right w3-padding w3-hide-small">
                <input class="w3-round-xxlarge w3-button w3-block w3-green w3-hover-blue w3-section w3-padding" type="submit" name="submit" value="Register">
            </span>
        </form>
    </div>
</div>

<!--Login Modal-->
<div id="login" class="w3-container w3-padding-16 w3-modal">
    <div class="w3-modal-content w3-card" style="max-width:430px" style="background-image: url('/PICS/lib_bg2.jpg')">
        <div class="w3-center"><br>
            <img src="PICS/img_avatar4.png" style="width:30%" class="w3-circle w3-margin-top w3-margin-bottom">
        </div>
        <form class="w3-container" id="submit-login" method="post">
            <div class="w3-section w3-container">
                <input class="w3-col w3-left w3-round-xxlarge w3-input w3-border w3-margin-bottom" required type="text" placeholder="Enter Username" name="username" id="username" required>
                <input class="w3-col w3-left w3-round-xxlarge w3-input w3-border" type="password" required placeholder="Enter Password" name="password" id="pswd" required>
            </div>
            <span class="w3-right w3-padding w3-hide-small">
                <input type="reset" class="w3-round-xxlarge w3-margin w3-btn w3-red w3-hover-red">
            </span>
            <span class="w3-right w3-padding w3-hide-small">
                <input class="w3-round-xxlarge w3-button w3-block w3-blue w3-hover-blue w3-section w3-padding" type="submit" name="submit_lms_login" value="Login">
            </span>
        </form>
    </div>
</div>
<!--Add new Books Modal-->
<div id="book" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
        <header class="w3-container w3-blue">
            <span class="close-book w3-button w3-display-topright w3-hover-red">&times;</span>
            <h2>Insert New Book's</h2>
        </header>
        <form id="submit-book" action="" method="post">
            <div class="w3-container w3-margin w3-border">
                <label>Book Name: </label>
                <input type="text" name="bookname" id="bookname_book" class="w3-input w3-border w3-hover-shadow" required>
                <label>Author Name: </label>
                <input type="text" name="author" id="author" class="w3-input w3-border w3-hover-shadow" required>
                <label>Quantity: </label>
                <input type="number" name="quantity" id="quantity" max=100 class="w3-input w3-border w3-hover-shadow" required><br>
            </div>
            <footer class="w3-container w3-blue">
                <input type="submit" id="submit_book" class="w3-right w3-margin w3-btn w3-green w3-hover-blue">
                <input type="reset" class="w3-left w3-margin w3-btn w3-red w3-hover-blue">
            </footer>
        </form>
    </div>
</div>

<!--Issue a Book Modal-->
<div id="issue" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
        <header class="w3-container w3-blue">
            <span class="close-issue w3-button w3-display-topright w3-hover-red">&times;</span>
            <h2>Issue The Book</h2>
        </header>
        <form id="submit-issue" action="" method="post">
            <div class="w3-container w3-margin w3-border">
                <label>Book Name: </label>
                <input type="text" name="bookname" id="bookname_issue" class="w3-input w3-border w3-hover-shadow" list="booklist" required><!--display the suggestion list below this input-->
                <datalist name="booklist" id="booklist"></datalist><br>
                <label>Available Quantity: </label><label id="QLabel"></label>
                <button id="QButton" type="button" class="w3-btn w3-yellow w3-hover-yellow">Check Quantity</button><br><br>
            </div>
            <footer class="w3-container w3-blue">
                <input type="submit" id="submit_issue" class="w3-right w3-margin w3-btn w3-green w3-hover-blue">
                <input type="reset" class="w3-left w3-margin w3-btn w3-red w3-hover-blue">
            </footer>
        </form>
    </div>
</div>

<!--Return Issued Book Modal-->
<div id="return" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
        <header class="w3-container w3-blue">
            <span class="close-return w3-button w3-display-topright w3-hover-red">&times;</span>
            <h2>Return Book</h2>
        </header>
        <form id="submit-return" action="" method="post">
            <div class="w3-container w3-margin w3-border">
                <label>Book id: </label>
                <input type="text" name="bookid" id="bookid_return" class="w3-input w3-border w3-hover-shadow" required><br>
                <label>*Note: Check the Bookid from the data of Books Issued </label>
            </div>
            <footer class="w3-container w3-blue">
                <input type="submit" id="submit_return" value="Submit" class="w3-right w3-margin w3-btn w3-green w3-hover-blue">
                <input type="reset" class="w3-left w3-margin w3-btn w3-red w3-hover-blue">
            </footer>
        </form>
    </div>
</div>


<!--Collect Fine Modal-->
<div id="fine" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
        <header class="w3-container w3-blue">
            <span class="close-fine w3-button w3-display-topright w3-hover-red">&times;</span>
            <h2>Collect Fine</h2>
        </header>
        <form id="submit-fine" action="" method="post">
            <div class="w3-container w3-margin w3-border">
                <label>Book id: </label>
                <input type="text" name="bookid" id="bookid_fine" class="w3-input w3-border w3-hover-shadow" required><br>
                <label>Fine Rate: </label><label id="FLabel"></label>
                <button id="FButton" class="w3-btn w3-yellow w3-hover-yellow" type="button">Check Fine</button><br><br>
            </div>
            <footer class="w3-container w3-blue">
                <input type="submit" id="submit_fine" class="w3-right w3-margin w3-btn w3-green w3-hover-blue">
                <input type="reset" class="w3-left w3-margin w3-btn w3-red w3-hover-blue">
            </footer>
        </form>
    </div>
</div>