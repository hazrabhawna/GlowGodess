<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NEW USER</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <%@include file="components/message.jsp" %>
                <div class="card">
                    <div class="card-body px-5">
                        <h2 class="text-center my-3">SIGN UP</h2>
                        <form action="RegisterServlet" method="post">
                            
                    <div class="form-group">
                    <label for="name">User Name</label>
                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter Name" aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                    <label for="email">Email</label>
                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter Email" aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                    <label for="password">User password</label>
                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter Password" aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                    <label for="phone">User phone number</label>
                    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                    <label  for="address">User Address</label>
                    <textarea name="user_address" style="height:200px;
                              " class="form-control" placeholder="Enter your Address"></textarea>
                    
                    </div>
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Register</button>
                        
                    </div>
                </form>
                </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
