<%@page import="java.sql.*"%>
<%
    //Database
    Connection con=null; 
    Statement stmt=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String sqlQuery=null;
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/libmgmt","root","");         
        stmt=con.createStatement();
    }
    catch(Exception e)
    {
        out.println("<script>console.log('Exception: "+e.toString()+"');</script>");
    }
%>