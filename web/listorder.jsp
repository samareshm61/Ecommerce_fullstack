<%-- 
    Document   : index
    Created on : 19-Apr-2022, 4:39:27 pm
    Author     : user
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Arbor Shopping</title>

    <!-- Custom fonts for this template-->
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="admin/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        
        <jsp:include page="inc/menu.jsp"/>
                <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                
                <jsp:include page="inc/top.jsp"/>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">List Categories</h1>
                    
       <table class="table table-striped">
    <thead>
      <tr>
        <th>Billing Name</th>
        <th>Billing Email</th>
        <th>Billing Phone</th>
        <th>Billing Address</th>
        
        <th>Shipping Name</th>
        <th>Shipping Email</th>
        <th>Shipping Phone</th>
        <th>Shipping Address</th>
         <th>Order Details</th>
      </tr>
      
    </thead>
    <tbody>
   <% 
    ArrayList<HashMap> morder=new ArrayList();
    morder=(ArrayList<HashMap>)request.getAttribute("morder");
    
for(int i=0;i<morder.size();i++){
            %>
            <tr>   
            <td><%out.print(morder.get(i).get("bname"));%></td>
            <td><%out.print(morder.get(i).get("bemail"));%></td>
             <td><%out.print(morder.get(i).get("bphone"));%></td>
              <td><%out.print(morder.get(i).get("baddress"));%></td>
               <td><%out.print(morder.get(i).get("sname"));%></td>
                <td><%out.print(morder.get(i).get("semail"));%></td>
                 <td><%out.print(morder.get(i).get("sphone"));%></td>
                 <td><%out.print(morder.get(i).get("saddress"));%></td>
                 
                 <td>
                     <button data-toggle="modal" data-target="#myModal<%out.print(morder.get(i).get("order_id"));%>" class="btn btn-primary">View Details</button>
                     <!-- The Modal -->
<div class="modal" id="myModal<%out.print(morder.get(i).get("order_id"));%>">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Order Details</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
          <table class="table table-striped">
    <thead>
      <tr>
        <th>Product Name</th>
        <th>Product image</th>
        <th>Product Price</th>
        <th>Product Quantity</th>
         <th>Total Price</th>


      </tr>
    </thead>
    <tbody>
        

      
                     
                     
                     
                     <%
                       Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cemkproject","root","");
        
         Statement stmt=con.createStatement();
         
        
         
       ResultSet rs=stmt.executeQuery("SELECT sorder.*,products.product_name,products.product_image FROM sorder INNER JOIN products ON sorder.pid=products.product_id WHERE sorder.order_id='"+morder.get(i).get("order_id")+"'");
      
       while(rs.next()){ 
       
       %>
       <tr>
          <td><%out.print(rs.getString("product_name"));%></td>
          <td><img src="product_img/<%out.print(rs.getString("product_image"));%>" alt=" " style="width:80px"/></td>
          <td><%out.print(rs.getString("price"));%></td>
          <td><%out.print(rs.getString("qty"));%></td>
          <td><%out.print(rs.getString("total"));%></td>
        
      </tr>
       
       <%
       }
       


                %>
                 <tr>
          
    </tbody>
  </table>
                     
      </div>
                     <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

                     
                 </td>
            
            
            </tr>
            
        <%}%>
    </tbody>
     </table>
      

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
        
          
    <!-- Bootstrap core JavaScript-->
    <script src="admin/vendor/jquery/jquery.min.js"></script>
    <script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="admin/js/sb-admin-2.min.js"></script>

</body>

</html>
