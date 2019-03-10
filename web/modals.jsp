<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Add new Books Modal-->
<div id="book" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
        <header class="w3-container w3-teal"> 
            <span class="close-book w3-button w3-display-topright w3-hover-red">&times;</span>
            <h2>Insert New Book's</h2>
        </header>
        <form id="submit-book" action="" method="post">
            <div class="w3-container w3-margin w3-border">
                <label>Book Name: </label>
                <input type="text" name="bookname" id="bookname_book" class="w3-input w3-border w3-hover-shadow">
                <label>Author Name: </label>
                <input type="text" name="author" id="author" class="w3-input w3-border w3-hover-shadow">
                <label>Quantity: </label>
                <input type="number" name="quantity" id="quantity" max=100 class="w3-input w3-border w3-hover-shadow"><br>
            </div>
            <footer class="w3-container w3-teal">
                <input type="submit" id="submit_book" class="w3-right w3-margin w3-btn w3-green w3-hover-blue">
                <input type="reset" class="w3-left w3-margin w3-btn w3-red w3-hover-blue">
            </footer>
        </form>
    </div>
</div>

<!--Issue a Book Modal-->
<div id="issue" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
        <header class="w3-container w3-teal">
            <span class="close-issue w3-button w3-display-topright w3-hover-red">&times;</span>
            <h2>Issue The Book</h2>
        </header>
        <form id="submit-issue" action="" method="post">
            <div class="w3-container w3-margin w3-border">
                <label>Owner id: </label>
                <input type="text" name="ownerid" id="ownerid_issue" class="w3-input w3-border w3-hover-shadow">
                <label>Book Name: </label>
                <input type="text" name="bookname" id="bookname_issue" class="w3-input w3-border w3-hover-shadow" list="booklist"><!--display the suggestion list below this input-->
                <datalist name="booklist" id="booklist"></datalist><br>
                <label>Available Quantity: </label><label id="QLabel"></label>
                <button id="QButton" type="button" class="w3-btn w3-yellow w3-hover-yellow">Check Quantity</button><br><br>
            </div>
            <footer class="w3-container w3-teal">
                <input type="submit" id="submit_issue" class="w3-right w3-margin w3-btn w3-green w3-hover-blue">
                <input type="reset" class="w3-left w3-margin w3-btn w3-red w3-hover-blue">
            </footer>
        </form>
    </div>
</div>

<!--Return Issued Book Modal-->
<div id="return" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
        <header class="w3-container w3-teal">
            <span class="close-return w3-button w3-display-topright w3-hover-red">&times;</span>
            <h2>Return Book</h2>
        </header>
        <form id="submit-return" action="" method="post">
            <div class="w3-container w3-margin w3-border">
                <label>Owner id: </label>
                <input type="text" name="ownerid" id="ownerid_return" class="w3-input w3-border w3-hover-shadow">
                <label>Book id: </label>
                <input type="text" name="bookid" id="bookid_return" class="w3-input w3-border w3-hover-shadow"><br>
            </div>
            <footer class="w3-container w3-teal">
                <input type="submit" id="submit_return" value="Submit" class="w3-right w3-margin w3-btn w3-green w3-hover-blue">
                <input type="reset" class="w3-left w3-margin w3-btn w3-red w3-hover-blue">
            </footer>
        </form>
    </div>
</div>


<!--Collect Fine Modal-->
<div id="fine" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
        <header class="w3-container w3-teal">
            <span class="close-fine w3-button w3-display-topright w3-hover-red">&times;</span>
            <h2>Collect Fine</h2>
        </header>
        <form id="submit-fine" action="" method="post">
            <div class="w3-container w3-margin w3-border">
                <label>Owner id: </label>
                <input type="text" name="ownerId" id="ownerid_fine" class="w3-input w3-border w3-hover-shadow">
                <label>Book id: </label>
                <input type="text" name="bookid" id="bookid_fine" class="w3-input w3-border w3-hover-shadow"><br>
                <label>Fine Rate: </label><label id="FLabel"></label>
                <button id="FButton" class="w3-btn w3-yellow w3-hover-yellow" type="button">Check Fine</button><br><br>
            </div>
            <footer class="w3-container w3-teal">
                <input type="submit" id="submit_fine" class="w3-right w3-margin w3-btn w3-green w3-hover-blue">
                <input type="reset" class="w3-left w3-margin w3-btn w3-red w3-hover-blue">
            </footer>
        </form>
    </div>
</div>