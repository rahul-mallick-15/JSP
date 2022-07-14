<!DOCTYPE html>
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
    <body >
        <div class="container-xl p-5 m-5">
            <div class="container-xl shadow p-3 mb-5 bg-body rounded">
               <div class="row m-3 p-3">
                   <div class="col-6 text-center border border-4 p-3">
                        <form action="Display.jsp">
                            <button class="btn btn-primary shadow rounded-circle p-5" type="submit">View All Student</button>
                        </form>
                   </div>
                   <div class="col-6 text-center border border-4 p-3">
                       <form action="Search.jsp">
                           <button class="btn btn-danger shadow rounded-circle p-5" type="submit">Search By Name</button>
                           <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name"> 
                        </form>
                   </div>
               </div>
               <div class="row m-3 p-3">
                 <div class="col-12 text-center border border-4 p-3">
                    <form action="Form.html">
                        <button class="btn btn-warning shadow rounded-circle p-5" type="submit">Register Multiple Student Records</button>
                    </form> 
                 </div>
                </div>
              </div>
            </div>
        </div>
    </body>
</html>