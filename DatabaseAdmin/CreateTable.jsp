<%@ page import="java.sql.*" %>
<%
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
    }
    catch(ClassNotFoundException cnf){
        out.println(cnf);
    }
    try{
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "system" , "Rahul@456");
        Statement st   = con.createStatement();
        String create_table     = "Create table Student (ID number(9) Primary Key , Name varchar2(100) NOT NULL, Sex char(1) check (Sex in ('M','F')) NOT NULL,DOB date, Phone char(10) NOT NULL , Email varchar2(50))";
        String create_sq        = "CREATE SEQUENCE student_sq START WITH 1000 INCREMENT by 1 MINVALUE 1000 MAXVALUE 9999 CYCLE";
        //st.execute(create_table);
        out.print("<h3 style='color:green'>Table Created Successfully</h3>");
        con.close();
    }   
    catch(SQLException e){
        out.print("<h3 style='color:red'>Error: " + e + "</h3>");
    }
%>