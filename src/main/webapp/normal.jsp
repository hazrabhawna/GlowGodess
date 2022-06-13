<%@page import="com.mycompany.mycart.entities.Users" %>
<%
    Users user = (Users)session.getAttribute("current-user");
    if(user==null)
    {
    session.setAttribute("message","you are not Logged in!!");
    response.sendRedirect("login.jsp");
    return;
    
}
else
{
if(user.getUserType().equals("admin"))
{
session.setAttribute("message","you are not a normal user");
response.sendRedirect("login.jsp");
return;
}
}

    
    
%>
<%@include file="components/navbar.jsp" %>
<%@include file="components/common_css_js.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="components/common_modals" %>
        <%response.sendRedirect("index.jsp");
        %>
    </body>
</html>
