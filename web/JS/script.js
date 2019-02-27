$(document).ready(function()
{
    //Event Handler to register new candidate 
    $("#submit-register").on('submit',function(event){		
        event.preventDefault();
        alert("Registering..."); 
        
        var ctype = $("input[name='ctype']:checked").val();
        var username=$("#username").val();
        var cname=$("#cname").val();
        var password=$("#password").val();
        var deptid=$("#deptid").val();
        
        $.ajax({
            url:"server.jsp",
            method:"post",
            contentType: false,       
            cache: false,            
            processData:false,   
            data: {submit:"submit-register",ctype:ctype,username:username,password:password,deptid:deptid,cname:cname},
            success:function(data){
                if(($.trim(data))==="Registered")
                {
                    $(location).attr('href',"/Library-Management-System-JSP/index.jsp");                    
                }
                else
                {
                    alert("Registration Error: "+data);
                    $(location).attr('href',"/Library-Management-System-JSP/register.jsp");
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

        console.log("Submitting...");


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
                    $(location).attr('href',"/Library-Management-System-JSP/index.jsp");
                }
                else
                {
                    alert("Login Error!"+data);
                    $(location).attr('href',"/Library-Management-System-JSP/login.jsp");
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
                $(location).attr('href',"/Library-Management-System-JSP/login.jsp");
           }
        });        
    });
    
    //Redirect to register
    $("#click-register").on('click',function(){
        $(location).attr('href',"register.jsp");
    });    

    //Event Handler to retrieve the data select in the combobox at top left
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
    
     //Event handler to load the name of book after filtering according to the value entered   
    $("#bookname").keyup(function(){
        var val=$("#bookname").val();
        $.ajax({
            url:"server.jsp",
            data: {val:val},
            success:function(data){
                $("#booklist").html(data);
            }
        });
    });

    //Event Handler to load all the booknames
    $("#bookname").click(function(){
        var table="books";
        $.ajax({
            url:"server.jsp",
            data: {table:table},
            success:function(data){
                $("#booklist").html(data);
            }
        });
    });

    //Event handler to add new books in library
    $("#submit-book").on('submit',function(event){
        event.preventDefault();

        var formdata=new FormData(this);
        formdata.append("submit","submit-book");

        $.ajax({
            url:"server.jsp",
            contentType: false,       
            cache: false,            
            processData:false,   
            data: formdata,
            success:function(data){
                alert("Books Added Successfully");
                $("#book").modal("hide");
                $(".category")
                    .val("books")
                    .trigger('change');
            }
        });
    });	

    //Event Handler to get the available quantities of book
    $("#QButton").click(function(){
        var bkname=$("#bookname").val();
        $.ajax({
            url:"server.jsp",
            data:{bkname:bkname},
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
        var oid=$("#ownerid").val();
        var oidtype=$("#ownerid").val();
        var count,otype,limit;
        $.ajax({
            url:"server.jsp",
            data:{oid:oid},
            success:function(data){
                count=data;
                //console.log(data);
            }
        }); //count the transactions of issuing the book

        $.ajax({
            url:"server.jsp",
            data:{oidtype:oidtype},
            success:function(data){
                otype=data;
                //console.log(data);
            }
        }); //get the limit of issuing the book according to the type of candidate

        if(otype.equals("Student"))
        {
            limit=4;
        }
        else if(otype.equals("Teacher"))
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
                var owner=$("#ownerid").val();								
                if(owner[0].equals('T') || owner[0].equals('S'))//Validate the Owner ID
                {
                    $.ajax({
                        url:"server.jsp",
                        contentType: false,       
                        cache: false,            
                        processData:false,   
                        data: formdata,
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

        var formdata=new FormData(this);
        formdata.append("submit","submit-return");

        $.ajax({
            url:"server.jsp",
            contentType: false,       
            cache: false,            
            processData:false,   
            data: formdata,
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
        var FINEoid=$("#ownerId").val();
        var FINEbkid=$("#bookid").val();

        $.ajax({
            url:"server.jsp",
            data:{FINEoid:FINEoid,FINEbkid:FINEbkid},
            success:function(data){
                $("#FLabel").html(data);
            }
        });
    });
    //Event handler to collect fine on any transaction of book
    $("#submit-fine").on('submit',function(event){
        event.preventDefault();

        var formdata=new FormData(this);
        formdata.append("submit","submit-fine");

        $.ajax({
            url:"server.jsp",
            contentType: false,       
            cache: false,            
            processData:false,   
            data: formdata,
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