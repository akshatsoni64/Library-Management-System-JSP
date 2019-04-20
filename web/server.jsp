<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.google.gson.Gson"%>
<%@include file="DB_Server.jsp"%>

<%
    //out.println("<script>console.log('server.jsp begins...');</script>");
    String a=request.getParameter("submit");
    //out.println("<script>console.log('"+a+"');</script>");
    HttpSession session_lms=request.getSession(true);
    if((request.getParameter("submit"))!=null)
    {
        String action = request.getParameter("submit");
        //out.println("<script>console.log('server.jsp- "+action+"');</script>");

        //Login
        if (action.equals("submit-login"))
        {
            try {
                String un = request.getParameter("username");
                String pwd = request.getParameter("password");

                sqlQuery = "select * from user where username='" + un + "' AND password='" + pwd + "'";
                //out.println("<script>console.log('"+sqlQuery+"');</script>");
                rs = stmt.executeQuery(sqlQuery);
                rs.next();
                sqlQuery="select ctype from candidate where cid='"+rs.getString("cid")+"'";
                //out.println("<script>console.log('"+sqlQuery+"');</script>");
                session_lms.setAttribute("username", rs.getString("username"));
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                session_lms.setAttribute("usertype", rs.getString("ctype"));
                out.println("Logged In Successfully");

            } catch (Exception e) {
                out.println("Error in login " + e.toString());
            }
        }

        //Logout
        if (action.equals("submit-logout")) {
            session_lms.setAttribute("username", null);
            session_lms.setAttribute("usertype", null);
        }

        //Register
        if (action.equals("submit-register")) {
            //out.println("<script>console.log('server.jsp- "+action+"');</script>");
            try {
                int c_row = 1;
                String cname = request.getParameter("cname");
                String deptid = request.getParameter("deptid");
                String ctype = request.getParameter("ctype");
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                if (ctype.equals("Student")) {
                    rs = stmt.executeQuery("select * from candidate where ctype='Student'");
                    while (rs.next()) {
                        c_row++;
                    }
                    String cid = ((c_row < 10) ? ("S0" + c_row) : ("S" + c_row));
                    sqlQuery = "insert into candidate(cid,cname,ctype,deptid) values('" + cid + "','" + cname + "','" + ctype + "','" + deptid + "')";
                    //out.println("<script>console.log('"+sqlQuery+"');</script>");
                    ps = con.prepareStatement(sqlQuery);
                    int p = ps.executeUpdate();
                    sqlQuery = "insert into user(cid,username,password) values('" + cid + "','" + username + "','" + password + "')";
                    ps = con.prepareStatement(sqlQuery);
                    int q = ps.executeUpdate();
                    //out.println("<script>console.log('"+p+" and "+q+"');</script>");
                }
                else if (ctype.equals("Teacher")) {
                    rs = stmt.executeQuery("select * from candidate where ctype='Teacher'");
                    while (rs.next()) {
                        c_row++;
                    }
                    String cid = ((c_row < 10) ? ("T0" + c_row) : ("T" + c_row));
                    sqlQuery = "insert into candidate(cid,cname,ctype,deptid) values('" + cid + "','" + cname + "','" + ctype + "','" + deptid + "')";
                    //out.println("<script>console.log('"+sqlQuery+"');</script>");
                    ps = con.prepareStatement(sqlQuery);
                    int p = ps.executeUpdate();
                    sqlQuery = "insert into user(cid,username,password) values('" + cid + "','" + username + "','" + password + "')";
                    ps = con.prepareStatement(sqlQuery);
                    int q = ps.executeUpdate();
                    //out.println("<script>console.log('"+p+" and "+q+"');</script>");
                }
                out.println("Registered");
                //session_lms.setAttribute("username", username);
            } catch (Exception e) {
                out.println("Error in register " + e.toString());
            }
        }

        //Retrieve Records from database when the value of category changes
        if (action.equals("submit-category")) {
            String table = request.getParameter("category");
            ArrayList<String> colname = new ArrayList<String>();
            String cols=null,condition=null;
            if (table.equals("candidate")) {
                colname.add("cid");
                colname.add("cname");
                colname.add("ctype");
                colname.add("deptid");
                cols="cid,cname,ctype,deptid";
                condition="";
            } else if (table.equals("books")) {
                colname.add("bookid");
                colname.add("bookname");
                colname.add("author");
                cols="bookid,bookname,author";
                condition="";
            } else if (table.equals("department")) {
                colname.add("deptid");
                colname.add("dname");
                cols="deptid,dname";
                condition="";
            } else if (table.equals("issue")) {
                //colname.add("tid");
                colname.add("bookid");
                //colname.add("ownerid");
                colname.add("issue_date");
                colname.add("return_date");
                cols="bookid,ownerid,issue_date,return_date";
                try {
                    sqlQuery = "select cid from user where username='" + session_lms.getAttribute("username") + "'";
                    rs = stmt.executeQuery(sqlQuery);
                    rs.next();
                    String uid = rs.getString("cid");
                    condition = " where ownerid='" + uid + "'";
                }catch(Exception e){
                    out.println("Exception in issue data: "+e.toString());
                }
            } else if (table.equals("fine")) {
                colname.add("bookid");
                colname.add("fine_amount");
                colname.add("paid");
                cols="tid,fine_amount,paid";
                try {
                    sqlQuery = "select cid from user where username='" + session_lms.getAttribute("username") + "'";
                    rs = stmt.executeQuery(sqlQuery);
                    rs.next();
                    String uid = rs.getString("cid");
                    condition = " where ownerid='" + uid  + "'";
                }catch(Exception e){
                    out.println("Exception in issue data: "+e.toString());
                }
            }
            String tbname=table;
            try {
                sqlQuery = "select " + cols + " from " + table + condition;
                rs = stmt.executeQuery(sqlQuery);
                table = "<table class='w3-table-all'><thead><tr>";
                for (String col : colname) {
                    table += "<th>" + col.toUpperCase() + "</th>";
                }
                table += "</tr></thead><tbody>";

                if (tbname.equals("fine")) {
                    colname.remove(0);
                }
                while (rs.next()) {
                    table += "<tr>";
                    if (tbname.equals("fine")) {
                        sqlQuery="select bookid from issue where tid='"+rs.getString("tid")+"'";
                        Statement stbk=con.createStatement();
                        ResultSet r=stbk.executeQuery(sqlQuery);
                        r.next();
                        table += "<td>" + r.getString("bookid") + "</td>";
                        r.close();
                    }
                    for (String col : colname) {
                        table += "<td>" + rs.getString(col) + "</td>";
                    }
                    table += "</tr>";
                }
                table += "</tbody></table>";
            }
            catch(Exception e) {
                out.println(e.toString());
            }
            out.println(table);
        }

        //Add book in the database and their respective copies's id
        if (action.equals("submit-book")) {
            try {
                out.println("<script>console.log('inserting books..');</script>");
                String bookname = request.getParameter("bookname");
                out.println("Bookname: " + bookname);
                String author = request.getParameter("author");
                out.println("Author " + author);
                String qt = request.getParameter("quantity");
                Integer q = new Integer(qt);
                int quantity = q.intValue();
                out.println("Quantity " + quantity);
                sqlQuery = "select count(*) from books";
                rs = stmt.executeQuery(sqlQuery);

                int count = 0;

                if (rs.next()) {
                    count = rs.getInt(1);
                }

                out.println("Result of Query(Count): " + count);
                String bookid = null;
                if (count < 10) {
                    bookid = "B000" + (count + 1);
                } else if (count < 100 && count >= 10) {
                    bookid = "B00" + (count + 1);
                } else if (count < 1000 && count >= 100) {
                    bookid = "B0" + (count + 1);
                } else if (count == 1000) {
                    bookid = "B" + (count + 1);
                }

                sqlQuery = "insert into books(bookid,bookname,author) values('" + bookid + "','" + bookname + "','" + author + "')";
                ps = con.prepareStatement(sqlQuery);
                int c1 = ps.executeUpdate();
                out.println("Book ID " + c1);
                String copyid = null;
                for (int i = 1; i <= quantity; i++) {
                    if (i < 10) {
                        copyid = bookid + "00" + i;
                    } else if (i < 100 && i >= 10) {
                        copyid = bookid + "0" + i;
                    } else if (i == 100) {
                        copyid = bookid + i;
                    }
                    sqlQuery = "insert into booksid(copyid,bookid) values('" + copyid + "','" + bookid + "')";
                    ps = con.prepareStatement(sqlQuery);
                    int c2 = ps.executeUpdate();
                    out.println("c2 " + c2);
                }
            } catch (Exception e) {
                out.println("Error in adding books: " + e.toString());
            }
        }

        //Event Handler to get the names of the all the books
        if (action.equals("get_books")) {
            try {
                String table = request.getParameter("table");
                sqlQuery = "select bookname from books";
                rs = stmt.executeQuery(sqlQuery);
                while (rs.next()) {
                    String value = rs.getString("bookname");
                    out.println("<option value='" + value + "'>" + value + "</option>");
                }
            } catch (Exception e) {
                out.println("Error in getting the booknames(All): " + e.toString());
            }

        }

        //Event Handler to get the names of book after filtering with the entered value
        if (action.equals("get_filtered_books")) {
            try {
                String val = request.getParameter("val");
                sqlQuery = "select bookname from books where bookname LIKE '" + val + "%'";
                rs = stmt.executeQuery(sqlQuery);
                while (rs.next()) {
                    String value = rs.getString("bookname");
                    out.println("<option value='" + value + "'>" + value + "</option>");
                }
            } catch (Exception e) {
                out.println("Error in getting the booknames(Filtered): " + e.toString());
            }
        }

        //Event handler to check quantity of book
        if (action.equals("get_quantity")) {
            try {
                String bkname = request.getParameter("bkname");
                sqlQuery = "select bookid from books where bookname='" + bkname + "'";
                rs = stmt.executeQuery(sqlQuery);
                while (rs.next()) {
                    sqlQuery = "select count(copyid) from booksid where bookid='" + rs.getString("bookid") + "' AND status=0";
                }
                rs = stmt.executeQuery(sqlQuery);
                while (rs.next()) {
                    out.println(rs.getInt(1));
                }
            }
            catch (Exception e) {
                out.println("Error in counting the copies: "+e.toString());
            }
        }

        if (action.equals("get_oType")) {
            try {
                Gson gsonObj = new Gson();
                Map<String, String> inputMap = new HashMap<String, String>();
                sqlQuery="select cid from user where username='"+session_lms.getAttribute("username")+"'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                String oid=rs.getString("cid");
                sqlQuery="select ctype from candidate where cid='"+oid+"'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                inputMap.put("o_type", rs.getString("ctype"));
                sqlQuery="select count(tid) from issue where ownerid='"+oid+"' AND returned_status=1";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                inputMap.put("Tcount", rs.getInt(1)+"");
                // convert map to JSON String
                String jsonStr = gsonObj.toJson(inputMap);
                out.println(jsonStr);
            }
            catch (Exception e) {
                out.println("Error get_oType: "+e.toString());
            }
        }

        //Event handler to issue a book
        if (action.equals("submit-issue")) {
            try {
                String bookname=request.getParameter("bookname");
                String ownerid;
                sqlQuery="select cid from user where username='"+session_lms.getAttribute("username")+"'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                ownerid=rs.getString("cid");

                sqlQuery="select bookid from books where bookname='"+bookname+"'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                sqlQuery = "select copyid from booksid where bookid='" + rs.getString("bookid") + "' and status=0";

                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                sqlQuery = "insert into issue(bookid,ownerid,issue_date) values('" + rs.getString("copyid") + "','" + ownerid + "','" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "')";

                ps = con.prepareStatement(sqlQuery);
                int p = ps.executeUpdate();

                sqlQuery = "update booksid set status=1 where copyid='" + rs.getString("copyid") + "'";
                ps = con.prepareStatement(sqlQuery);
                ps.executeUpdate();
                out.println("Issued BookID: " + rs.getString("copyid"));

            } catch (Exception e) {
                out.println("Error submit-issue: "+e.toString());
            }
        }

        //Event handler to return a book
        if (action.equals("submit-return")) {
            try {
                sqlQuery="select cid from user where username='"+session_lms.getAttribute("username")+"'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                String ownerID=rs.getString("cid");
                String bookid=request.getParameter("bookid_return");
                sqlQuery="select tid from issue where ownerid='"+ownerID+"' AND bookid='"+bookid+"'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                String tid = rs.getString("tid");
                sqlQuery = "update issue set return_date='"+ new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) +"' where tid='" + tid + "'";
                ps = con.prepareStatement(sqlQuery);
                ps.executeUpdate();
                sqlQuery = "update issue set returned_status=1 where tid='" + tid + "'";
                ps = con.prepareStatement(sqlQuery);
                ps.executeUpdate();
                sqlQuery = "update booksid set status=0 where copyid='" + bookid + "'";
                ps = con.prepareStatement(sqlQuery);
                ps.executeUpdate();
                sqlQuery ="select DATEDIFF(return_date,issue_date) from issue where tid='"+tid+"'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();

                int diff = rs.getInt(1);
                if(diff>7)
                {
                    int day=diff-7;
                    int amount=10*day;
                    sqlQuery="insert into fine(tid,ownerid,fine_amount) values('"+tid+"','"+ownerID+"','"+amount+"')";
                    ps=con.prepareStatement(sqlQuery);
                    ps.executeUpdate();
                }
                out.println("Book Returned");
                //print_r($_POST);
            }
            catch (Exception e) {
                out.println("Error: "+e.toString());
            }
        }

        if(action.equals("submit_get_fine"))
        {
            try{
                sqlQuery="select cid from user where username='"+session_lms.getAttribute("username")+"'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                String FINEoid=rs.getString("cid");
                String FINEbkid=request.getParameter("FINEbkid");
                sqlQuery="select tid from issue where ownerid='"+FINEoid+"' AND bookid='"+FINEbkid+"'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                int FINEtid = rs.getInt("tid");
                sqlQuery = "select fine_amount from fine where tid='" + FINEtid + "'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                out.println(rs.getInt("fine_amount"));
            }
            catch(Exception e){
                out.println("Exception: "+e.toString());
            }
        }

        //Event handler to pay fine for a book
        if (action.equals("submit-fine")) {
            try {
                sqlQuery="select cid from user where username='"+session_lms.getAttribute("username")+"'";
                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                String ownerid_fine=rs.getString("cid");
                String bookid_fine=request.getParameter("bookid_fine");

                sqlQuery="select tid from issue where ownerid='"+ownerid_fine+"' AND bookid='"+bookid_fine+"'";

                rs=stmt.executeQuery(sqlQuery);
                rs.next();
                int tid = rs.getInt("tid");
                sqlQuery="update fine set paid=1 where tid='"+tid+"'";
                ps=con.prepareStatement(sqlQuery);
                ps.executeUpdate();
            }
            catch (Exception e) {
                out.println("Error: "+e.toString());
            }
        }
    }
%>