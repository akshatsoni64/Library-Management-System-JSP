<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="DB_Server.jsp"%>
<%@page import="java.sql.*" %>
<%    
    out.println("<script>console.log('server.jsp begins...');</script>");
    String a=request.getParameter("submit");
    out.println("<script>console.log('"+a+"');</script>");
    HttpSession session_lms=request.getSession(true);
    if((request.getParameter("submit"))!=null)
    {
        String action=request.getParameter("submit");
        out.println("<script>console.log('server.jsp- "+action+"');</script>");
        
        //Register
        if(action.equals("submit-register"))
        {
            out.println("<script>console.log('server.jsp- "+action+"');</script>");
            try
            {
                int c_row=0; 
                String cname=request.getParameter("cname");
                String deptid=request.getParameter("deptid");
                String ctype=request.getParameter("ctype");
                String username=request.getParameter("username");
                String password=request.getParameter("password");
                
                if(ctype.equals("Student"))
                {                    
                    rs=stmt.executeQuery("select * from candidate where ctype='Student'");
                    while(rs.next())
                    {
                        ++c_row;
                    }
                    String cid = ((c_row<10) ? ("S0"+c_row) : ("S"+c_row));  
                    sqlQuery="insert into candidate(cid,cname,ctype,deptid) values('"+cid+"','"+cname+"','"+ctype+"','"+deptid+"')";
                    out.println("<script>console.log('"+sqlQuery+"');</script>");
                    ps=con.prepareStatement(sqlQuery);
                    int p=ps.executeUpdate();
                    sqlQuery="insert into user(cid,username,password) values('"+cid+"','"+username+"','"+password+"')";
                    ps=con.prepareStatement(sqlQuery);   
                    int q=ps.executeUpdate();
                    out.println("<script>console.log('"+p+" and "+q+"');</script>");
                }    
                else if(ctype.equals("Teacher"))
                {
                    rs=stmt.executeQuery("select * from candidate where ctype='Student'");
                    while(rs.next())
                    {
                        ++c_row;
                    }
                    String cid = ((c_row<10) ? ("T0"+c_row) : ("T"+c_row));
                    sqlQuery="insert into candidate(cid,cname,ctype,deptid) values('"+cid+"','"+cname+"','"+ctype+"','"+deptid+"')";
                    ps=con.prepareStatement(sqlQuery);
                    int p=ps.executeUpdate();
                    sqlQuery="insert into user(cid,username,password) values('"+cid+"','"+username+"','"+password+"')";
                    ps=con.prepareStatement(sqlQuery);
                    int q=ps.executeUpdate();
                    out.println("<script>console.log('"+p+" and "+q+"');</script>");
                }        
                out.println("Registered");
                session_lms.setAttribute("username",username);
            }
            catch(Exception e)
            {
                out.println("Error in register "+e.toString());
            }
        }
        
        //Retrieve Records from database when the value of category changes
        if(action.equals("submit-category"))
        {
            String table=request.getParameter("category");
            ArrayList<String> colname=new ArrayList<String>();
            if(table.equals("candidate"))
            {
                colname.add("cid");
                colname.add("cname");
                colname.add("ctype");
                colname.add("deptid");
            }
            else if(table.equals("books"))
            {
                colname.add("bookid");
                colname.add("bookname");
                colname.add("author");
            }
            else if(table.equals("department"))
            {
                colname.add("deptid");
                colname.add("dname");
            }
            else if(table.equals("issue"))
            {
                colname.add("tid");
                colname.add("bookid");
                colname.add("ownerid");
                colname.add("issue_date");
                colname.add("return_date");
            }
            else if(table.equals("fine"))
            {
                colname.add("tid");
                colname.add("fine_amount");
                colname.add("paid");
            }

            try
            {
                sqlQuery="select * from "+table;
                rs=stmt.executeQuery(sqlQuery);
                table="<table class='w3-table-all'><thead><tr>";
                for(String col:colname)
                {
                    table+="<th>"+col.toUpperCase()+"</th>";
                }
                table+="</tr></thead><tbody>";

                while(rs.next())
                {
                    table+="<tr>";
                    for(String col:colname)
                    {
                        table+="<td>"+rs.getString(col) +"</td>";
                    }
                    table+="</tr>";
                }
                table+="</tbody></table>";   
            }
            catch(Exception e)
            {
                out.println(e.toString());
            }
            out.println(table);
        }        
        
        //Add book in the database and their respective copies's id
        if(action.equals("submit-book"))
        {
            out.println("<script>console.log('inserting books..');</script>");
            String bookname=request.getParameter("bookname");
            out.println("Bookname: "+bookname);
            String author=request.getParameter("author");
            out.println("Author "+author);
            String qt=request.getParameter("quantity");
            Integer q=new Integer(qt);    
            int quantity=q.intValue();
            out.println("Quantity "+quantity);
            sqlQuery="select count(*) from books";
            rs=stmt.executeQuery(sqlQuery);

            int count=rs.getInt(1);
            out.println("Result of Query(Count): "+count);
            String bookid=null;
            if(count<10)
            {
                bookid="B000"+(count+1);
            }
            else if(count<100 && count>=10)
            {
                bookid="B00"+(count+1);
            }
            else if(count<1000 && count>=100)
            {
                bookid="B0"+(count+1);
            }
            else if(count==1000)
            {
                bookid="B"+(count+1);
            }

            sqlQuery="insert into books(bookid,bookname,author) values('"+bookid+"','"+bookname+"','"+author+"')";
            ps=con.prepareStatement(sqlQuery);
            int c1=ps.executeUpdate();
            out.println("Book ID "+c1);
            String copyid=null;
            for(int i=1;i<=quantity;i++)
            {
                if(i<10)
                {
                    copyid=bookid+"00"+i;
                }
                else if(i<100 && i>=10)
                {
                    copyid=bookid+"0"+i;
                }
                else if(i==100)
                {
                    copyid=bookid+i;
                }
                sqlQuery="insert into booksid(copyid,bookid) values('"+copyid+"','"+bookid+"')";
                ps=con.prepareStatement(sqlQuery);
                int c2=ps.executeUpdate();
                out.println("c2 "+c2);
            }
	}
        
        //Login
        if(action.equals("submit-login"))
        {
            try
            {
                String un=request.getParameter("username");
                String pwd=request.getParameter("password");

                sqlQuery="select * from user where username='"+un+"' AND password='"+pwd+"'";
                
                rs=stmt.executeQuery(sqlQuery);
                while(rs.next())
                {
                    session_lms.setAttribute("username",rs.getString("username"));            
                    out.println("Logged In Successfully");
                }                
            }
            catch(Exception e)
            {
                out.println("Error in login "+e.toString());
            }
        }
        
        //Logout
        if(action.equals("submit-logout"))
        {
            session_lms.setAttribute("username",null);
        }
    }
%>