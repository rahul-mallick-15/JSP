<%@ page import="java.sql.*" %>
<% 
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
    }
    catch(ClassNotFoundException cnf){
        out.print(cnf);
    }
    int counter = 1 ;
    try{
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "system" , "Rahul@456");
        Statement st = con.createStatement();
        int no_of_students = 3 ;
        String id[]    = request.getParameterValues("id");
        String names[] = request.getParameterValues("name");
        String dob[]   = request.getParameterValues("dob");
        String phone[] = request.getParameterValues("phone");
        String email[] = request.getParameterValues("email");
        PreparedStatement pst = con.prepareStatement("Insert into Student values(?,?,?,?,?,?)");

        for(int i = 0 ; i < no_of_students ; ++i){
            ResultSet rs = st.executeQuery("SELECT STUDENT_SQ.nextval from DUAL");
            int sq = 1000 ;
            if(rs.next()){
                sq = rs.getInt(1) * 100000;
            }
            pst.setInt(1,sq + Integer.valueOf(id[i]));
            pst.setString(2,names[i]);
            pst.setString(3,request.getParameter("s"+(i+1)));
            pst.setDate(4,Date.valueOf(dob[i]));
            pst.setString(5,phone[i]);
            pst.setString(6,email[i]);
            pst.executeUpdate();
            ++counter;
        }
        out.print("<h4 style='color:green'>Successfully Registered</h4>");
        con.close();
    }
    catch(SQLException e){
        out.print(e);
        out.print("<h4 style='color:red'>Error with Student " + counter + " Data!</h4>");
        out.print("<h4 style='color:red'>Registration Failed</h4>");
    }
%>