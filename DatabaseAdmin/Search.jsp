<%@ page import="java.sql.*,java.util.*" %>
<% 
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
    }
    catch(ClassNotFoundException cnf){
        out.print(cnf);
    }
%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
          input::-webkit-outer-spin-button,
          input::-webkit-inner-spin-button {
              -webkit-appearance: none;
              margin: 0;
          }
        </style>
    </head>
    <body>
        <div class="container-xl p-5 m-5 shadow">
            <h3 class="fw-bold p-3">Student Details</h3>
            <table class="table table-striped table-hover">
            <%
                Connection con = null;
                try{
                    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "system" , "Rahul@456");
                    Statement st = con.createStatement();
                    String query = "Select * from student where name='" +request.getParameter("name")+"'";
                    ResultSet rs = st.executeQuery(query);
                    ResultSetMetaData metadata = rs.getMetaData();
                    int no_of_column = metadata.getColumnCount();
            %>
            <%
                    for(int i = 1 ; i <= no_of_column ; ++i){
                        out.print("<th>" + metadata.getColumnName(i) + "</th>");
                    }
                    out.print("<th></th>");
                    while(rs.next()){
            %>                        
                        <tr>
                            <td><%=rs.getInt(1)%>   </td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getDate(4)%>  </td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td>
                                <a href="Modify.jsp?id=<%= rs.getInt(1)%>">Modify</a> /
                                <a href="Delete.jsp?id=<%= rs.getInt(1)%>">Delete</a>
                            </td>
                        </tr>
            <%
                    }
                }
                catch(SQLException e){
                    e.printStackTrace();
                }
                finally{
                    con.close();
                }
            %>
            </table>
        </div>
    </body>
</html>