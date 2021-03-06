<%@ page import="java.sql.*" %>
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
<%  
    Connection con = null ;
    try{
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "system" , "Rahul@456");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from student where id=" + request.getParameter("id"));
        if(rs.next()){
%>
    <body class="d-flex flex-shrink-1 flex-grow-1 bd-highlight">
        <div class="container-xl shadow p-3 m-5 bg-body rounded bd-highlight">
          <div class="mt-4 p-5 bg-black text-white rounded">
            <h1>Modify Contact Number and Email</h1> 
          </div>
          <form action="Update.jsp"  class="was-validated">
            <div class="my-5 p-4 bd-highlight border border-4">

              <div class="row mb-3 mt-3">
                <div class="col-1">
                  <label for="id" class="fw-bold text-center form-label">ID:</label>
                </div>
                <div class="col-4">
                  <input type="number" class="form-control" id="id" placeholder="Enter id" name="id" value="<%=rs.getInt(1)%>" readonly>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="col-1"></div>
                <div class="col-1">
                  <label for="name" class="fw-bold text-center form-label">Name:</label>
                </div>
                <div class="col-4 ">
                  <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" value="<%=rs.getString(2)%>" readonly>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="col-1"></div>
              </div>

              <div class="row mb-3 mt-3">
                <div class="col-1">
                    <label class="text-center fw-bold">Gender:</label>
                </div>
                <div class="col-5">
                  <div class="form-check">
<%  
            String gender = rs.getString(3);
            if(gender.equals("M")){
%>
                    <input class="form-check-input" type="radio" value="M" id="sex" name="s1" checked>
                    <label class="form-check-label" for="sex">Male  </label>
<%  
            }
            else{
%>
                    <input class="form-check-input" type="radio" value="F" id="sex" name="s1" checked>
                    <label class="form-check-label" for="sex">Female</label>
<%
            }
%>
                  </div>
                </div>
                <div class="col-1">
                    <label class="text-left fw-bold form-label" for="dob">Date of Birth:</label>
                </div>
                <div class="col-4">
                    <input type="date" class="form-control" id="dob" placeholder="Enter Date of Birth" name="dob" value="<%=rs.getDate(4)%>" readonly>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="col-1"></div>
              </div>

              <div class="row mb-3 mt-3">
                <div class="col-1">
                  <label for="phone" class="fw-bold text-center form-label">Phone:</label>
                </div>
                <div class="col-4">
                  <input type="text" pattern="[0-9]{10}" class="form-control" id="phone" placeholder="Enter Phone Number" name="phone" value="<%=rs.getString(5)%>" required>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="col-1"></div>
                <div class="col-1">
                  <label for="email" class="fw-bold text-center form-label">Email:</label>
                </div>
                <div class="col-4">
                  <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="<%=rs.getString(6)%>" required>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="col-1"></div>
              </div>
            </div>

            <div class="row mb-3 mt-3">
              <button type="submit" class="btn btn-success">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>
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