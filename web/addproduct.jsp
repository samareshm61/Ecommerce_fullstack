<%-- 
    Document   : index
    Created on : 19-Apr-2022, 4:39:27 pm
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Arbor Shopping-Admin</title>

    <!-- Custom fonts for this template-->
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="admin/css/sb-admin-2.min.css" rel="stylesheet">

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
                    <h1 class="h3 mb-4 text-gray-800">Add Product</h1>
                    <!--<p class="h6 mb-4 text-gray-800">Category Name</p> -->
                    
                    <form action="insproduct" method="post" enctype="multipart/form-data">
                        <p>Category</p>
                        <p><select name="pcat" required="">
                                <option value="">Select Category</option>
                                        <%
                                        
                                       
    ArrayList<HashMap> cats=new ArrayList();
    cats=(ArrayList<HashMap>)request.getAttribute("categories");
    
for(int i=0;i<cats.size();i++){
            
                    %>
                     <option value="<%out.print(cats.get(i).get("cat_id"));%>"><%out.print(cats.get(i).get("cat_name"));%></option>
       <% } %>
                            </select></p>
                        
                        
                        <p>Product Name</p>
                        <p><input type="text" name="pname" required=""/></p>
                        <p>Product Price</p>
                        <p><input type="number" name="pprice" required=""/></p>
                        
                        <p>Product Image</p>
                        <p><input type="file" name="pimg"/></p>

                        <p><input type="submit" value="Add Product" class="btn btn-primary"/></p>
                        
                        
                        
                        
                        
                    </form>
      

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
