<%@page import="com.mycompany.mycart.entities.Users" %>
<%@page import="com.mycompany.mycart.entities.Category" %>
<%@page import="com.mycompany.mycart.dao.CategoryDao" %>
<%@page import ="com.mycompany.mycart.helper.FactoryProvider" %>
<%@page import ="com.mycompany.mycart.helper.Helper" %>
<%@page import="com.mycompany.mycart.servlets.*" %>
<%@page import="java.util.*" %>
<%
    Users user = (Users) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not Logged in!!");
        response.sendRedirect("login.jsp");
        return;

    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are not admin");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>

<%
           CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
           List<Category> list=cdao.getCategories();
           
Map<String,Long> m= Helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container mb-4 mr-4 admin">

            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-3">
                <!-- 1st col -->

                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style ="max-width:100px;" class="img-fluid rounded-circle" src="img/users.png" alt="user_icon">
                            </div>
                            <h1><%= m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>

                        </div>
                    </div>


                </div

                <!-- 2nd col -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style ="max-width:100px;" class="img-fluid" src="img/categories.png" alt="user_icon">
                            </div>
                            <h1><%= list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>  

                </div>



                <!-- 3rd col -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style ="max-width:100px;" class="img-fluid rounded-circle" src="img/products.png" alt="user_icon">
                            </div>
                            <h1><%= m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>

                </div>
            </div>

            <!-- 2nd row -->
            <!-- 1st col -->
            <div class="row mt-2">
                <div class="col-md-5">
                    <div class="card " data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style ="max-width:100px;" class="img-fluid" src="img/add.png" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here.</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div> 

                </div>
                <!-- 2nd col -->
                <div class="col-md-5">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style ="max-width:100px;" class="img-fluid" src="img/apps.png" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here.</p>
                            <h1 class="text-uppercase text-muted">Add Categories</h1>
                        </div>
                    </div> 

                </div>
            </div>
        </div>
        <!-- modal -->



        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control"name="catTitle" placeholder="Enter Category Title" required/>

                            </div>
                            <div class="form-group">
                                <textarea style="height: 250px;" class="form-control" name="catDescription" placeholder="Enter Category Description" required>
                                </textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>



                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!-- end modal -->
        <!-- model2 starts -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct"/>
                            <div class="form-group">
                                <input type="text" class="form-control"name="pName" placeholder="Enter Product Name" required/>


                                <div class="form-group">
                                    <textarea style="height: 150px;" class="form-control" name="pDesc" placeholder="Enter Product Description" required>
                                    </textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control"name="pPrice" placeholder="Enter Product Price" required/>

                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control"name="pDiscount" placeholder="Enter Product Discount" required/>

                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control"name="pQuantity" placeholder="Enter Product Quantity" required/>

                            </div>


                            <div class="form-group">
                                <select name="catId" id="">

                                    <%
                                        for(Category c:list)
                                        {
                                    %>
                                    <option value="<%= c.getCategoryID()%>"><%= c.getCategoryTitle()%></option>
                                    <%}%>

                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pPic">Select picture</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required/>
                            </div>


                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>



                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!-- model2 ends -->
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
