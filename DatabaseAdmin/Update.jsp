<%@ page import="java.sql.*,java.util.*" %>
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
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        PreparedStatement pst = con.prepareStatement("Update Student set phone = ? , email = ? where id = ? ");
        pst.setString(1,phone);
        pst.setString(2,email);
        pst.setInt(3,id);
        pst.executeUpdate();
        out.print("<h4 style='color:green'>Successfully Updated student details.</h4>");
    }
    catch(SQLException e){
        out.print(e);
        out.print("<h4 style='color:red'>Failed to update Student Details</h4>");
    }
    finally{
        con.close();
    }
%>