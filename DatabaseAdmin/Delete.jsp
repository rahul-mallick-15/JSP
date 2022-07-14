<%@ page import="java.sql.*" %>
<%  
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
    }
    catch(ClassNotFoundException cnf){
        out.print(cnf);
    }
    Connection con = null ;
    try{
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "system" , "Rahul@456");
        Statement st = con.createStatement();
        int id = Integer.valueOf(request.getParameter("id"));
        PreparedStatement pst = con.prepareStatement("Delete from Student where id = ? ");
        pst.setInt(1,id);
        pst.executeUpdate();
        out.print("<h4 style='color:green'>Successfully Deleted student record.</h4>");
    }
    catch(SQLException e){
        out.print(e);
        out.print("<h4 style='color:red'>Failed to Delete Student Record</h4>");
    }
    finally{
        con.close();
    }
%>