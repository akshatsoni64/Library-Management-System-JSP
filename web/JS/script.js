$(document).ready(function()
{
    //Event Handler to register new candidate 
    $("#submit-register").on('submit',function(event){		
        event.preventDefault();
        //alert("Registering...");
        
        var ctype = $("input[name='ctype']:checked").val();
        var username=$("#username").val();
        var cname=$("#cname").val();
        var password=$("#password").val();
        var deptid=$("#deptid").val();
        
        $.ajax({
            url:"server.jsp",
            method:"post",
            data: {submit:"submit-register",ctype:ctype,username:username,password:password,deptid:deptid,cname:cname},
            success:function(data){
                if(($.trim(data))==="Registered")
                {
                    $(location).attr('href',"index.jsp");
                }
                else
                {
                    alert("Registration Error: "+data);
                    $(location).attr('href',"register.jsp");
                }
            }
        });
    });
    
    //Event Handler to reset value of username
    $("#reset_username").on('click',function(){
        $("#username").val('');
    });
    
    //Event Handler to reset value of password
    $("#reset_password").on('click',function(){
        $("#pswd").val('');
    });
    
    //Event Handler to login
    $("#submit-login").on('submit',function(event){
        event.preventDefault();
        //console.log("Submitting...");

        var uname=$("#username").val();
        var pwd=$("#pswd").val();

        $.ajax({
            url:"server.jsp",
            method:"post",               
            data: {submit:"submit-login",username:uname,password:pwd},
            success:function(data){
                var d="Logged In Successfully";
                if(($.trim(data))===d)
                {                
                    $(location).attr('href',"index.jsp");
                }
                else
                {
                    alert("Login Error!"+data);
                    $(location).attr('href',"login.jsp");
                }
            }      
        });
    });
    
    //Logout
    $("#log-out").on('click',function(){
        $.ajax({
            url:"server.jsp",
            method:"post",
            data:{submit:"submit-logout"},
            success:function(){
                alert("Logged Out Successfully!");
                $(location).attr('href',"login.jsp");
           }
        });        
    });
    
    //Redirect to register
    $("#click-register").on('click',function(){
        $(location).attr('href',"register.jsp");
    });    

    //Event Handler to retrieve the data select in the combobox(category) at top left
    $(".category").on('change',function(){
        var category=this.value;
        var submit="submit-category";
        $.ajax({
            url:"server.jsp", 
            method:"post",
            data:{submit:submit,category:category},  
            success:function(data){  
                    $('#data').html(data);  
            }
        });
    });

    //Event handler to add new books in library
    $("#submit-book").on('submit',function(event){
        event.preventDefault();

        /*var formdata=new FormData(this);
        formdata.append("submit","submit-book");*/
        //alert("Adding Books..");

        var bookname=$("#bookname_book").val();
        var author=$("#author").val();
        var quantity=$("#quantity").val();

        $.ajax({
            url:"server.jsp",
            method:"post",
            /*contentType: false,
            cache: false,
            processData:false,*/
            data: {submit:"submit-book",bookname:bookname,author:author,quantity:quantity},
            success:function(data){
                alert("Books Added Successfully");
                $("#book").modal("hide");
                $(".category")
                    .val("books")
                    .trigger('change');
            }
        });
    });

    //Book Related Events (Issue)
    $("#bookname_issue").on({
        //Event Handlers to load all the booknames
        click:function()
        {
            $.ajax({
                url:"server.jsp",
                method:"post",
                data: {submit:"get_books",table:"books"},
                success:function(data){
                    $("#booklist").html(data);
                }
            });
        },
        //Event handler to load the name of book after filtering according to the value entered
        keyup:function(){
            var val=$("#bookname_issue").val();
            $.ajax({
                url:"server.jsp",
                method:"post",
                data: {submit:"get_filtered_books",val:val},
                success:function(data){
                    $("#booklist").html(data);
                }
            });
        },
        //Same as Click Event
        focus:function(){
            $("#bookname_issue")
                .trigger('click')
                .off("focus");
        }
    });

    //Event Handler to get the available quantities of book(Issue)
    $("#QButton").click(function(){
        var bkname=$("#bookname_issue").val();
        $.ajax({
            url:"server.jsp",
            method:"post",
            data:{submit:"get_quantity",bkname:bkname},
            success:function(data){
                $("#QLabel").html(data);
            }
        });
    });

    //Event Handler to issue new book to any candidate
    $("#submit-issue").on('submit',function(event){
        event.preventDefault();

        var formdata=new FormData(this);
        formdata.append("submit","submit-issue");

        var quantity=parseInt($("#QLabel").val());
        var oid=$("#ownerid_issue").val();

        var count,otype,limit;
        $.ajax({
            url:"server.jsp",
            method:"post",
            data:{submit:"get_oid",oid:oid},
            success:function(data){
                count=data;
                //console.log(data);
            }
        }); //count the transactions of issuing the book
        var otype="",count=0;
        $.ajax({
            url:"server.jsp",
            method:"post",
            data:{submit:"get_oType",oid:oid},
            success:function(data){
                otype=$.trim(data);
                console.log(data);
            }
        }); //get the limit of issuing the book according to the type of candidate

        if(otype==="Student")
        {
            limit=4;
        }
        else if(otype==="Teacher")
        {
            limit=7;
        } //assign the limits according to the type of owner

        if(count>limit)//check if the no. of issued are books are more than the limit or not?
        {
            alert("Sorry! You have reached the maximum limit of issuing the books, Kindly the return the issued books to get the new book issued");
        }
        else{
            if(quantity<1)//Check the desired book is in stock or not
            {
                alert("Sorry! This Book is not available, All the Copies of this book are issued to other candidates");
            }
            else
            {
                var owner=$("#ownerid_issue").val();
                var bookname=$("#bookname_issue").val();
                $("bookname_issue").val();
                if(owner[0]==='T' || owner[0]==='S')//Validate the Owner ID
                {
                    $.ajax({
                        url:"server.jsp",
                        method:"post",
                        /*contentType: false,
                        cache: false,            
                        processData:false, */
                        data: {submit:"submit-issue",owner:owner,bookname:bookname},
                        success:function(data){
                            alert("Book Issued Successfully, Please Try to return within 7days of issuing to avoid fines");
                            $("#issue").modal("hide");
                            $(".category")
                                .val("issue")
                                .trigger('change');
                        }
                    });
                }
                else
                {
                    alert("Invalid Owner ID!");
                }
            }
        }
    });	

    //Event handler to return the issued book
    $("#submit-return").on('submit',function(event){
        event.preventDefault();

        var ownerid_return=$("#ownerid_return").val();
        var bookid_return=$("#bookid_return").val();

        $.ajax({
            url:"server.jsp",
            method:"post",
            data: {submit:"submit-return",ownerid_return:ownerid_return,bookid_return:bookid_return},
            success:function(data){
                alert(data);
                //alert("Book Returned");
                $("#return").modal("hide");
                $(".category")
                    .val("issue")
                    .trigger('change');
            }
        });
    });

    $("#FButton").click(function(){

        var FINEoid=$("#ownerid_fine").val();
        var FINEbkid=$("#bookid_fine").val();
        $.ajax({
            url:"server.jsp",
            method:"post",
            data:{submit:"submit_get_fine",FINEoid:FINEoid,FINEbkid:FINEbkid},
            success:function(data){
                $("#FLabel").html(data);
            }
        });
    });
    //Event handler to collect fine on any transaction of book
    $("#submit-fine").on('submit',function(event){
        event.preventDefault();

        var ownerid_fine=$("#ownerid_fine").val();
        var bookid_fine=$("#bookid_fine").val();

        $.ajax({
            url:"server.jsp",
            method:"post",
            data: {submit:"submit-fine",ownerid_fine:ownerid_fine,bookid_fine:bookid_fine},
            success:function(data){
                alert("Fine Collected, Thank You");
                $("#fine").modal("hide");
                $(".category")
                    .val("fine")
                    .trigger('change');
            }
        });
    });	

    //Event Handler to open modals
    $(".open-book").click(function(){
        $("#book").modal("show");
    }); //Add new Books

    $(".open-issue").click(function(){
        $("#issue").modal("show");
    }); //Issue a Book

    $(".open-return").click(function(){
        $("#return").modal("show");
    }); //Return issued Book   

    $(".open-fine").click(function(){
        $("#fine").modal("show");
    }); //Collect fine on late return

    //Event Handler to close modals
    $(".close-fine").click(function(){
        $("#fine").modal("hide");
    });

    $(".close-book").click(function(){
        $("#book").modal("hide");
    });

    $(".close-issue").click(function(){
        $("#issue").modal("hide");
    });

    $(".close-return").click(function(){
        $("#return").modal("hide");
    });
});