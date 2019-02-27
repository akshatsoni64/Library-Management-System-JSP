<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
    //Database
    Connection con=null; 
    Statement stmt=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String sqlQuery=null;
    
    Class.forName("com.mysql.jdbc.Driver");
    
    try
    {
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/libmgmt","root","");         
        stmt=con.createStatement();
    }
    catch(Exception e)
    {
        //out.println("Exception: "+e.toString());
    }
%>