/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.mycart.servlets;
import com.mycompany.mycart.entities.Users;
import com.mycompany.mycart.dao.UserDao;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            String email=request.getParameter("email");
            String password= request.getParameter("password");
            UserDao userDao=new UserDao(FactoryProvider.getFactory());
            Users user=userDao.getUserByEmailAndPassword(email, password);
            //System.out.println(user);
            HttpSession httpsession= request.getSession();
            if(user==null)
            {
                //out.println("<h1>Invalid Details</h1>");
                httpsession.setAttribute("message","Invalid Details!! Try again.");
                response.sendRedirect("login.jsp");
               
            }
            else{
                out.println("<h1>WELCOME GODDESS!!</h1>");
                httpsession.setAttribute("current-user",user);
                if(user.getUserType().equals("admin"))
                {
                    response.sendRedirect("admin.jsp");
                }
                else if(user.getUserType().equals("normal"))
                {
                    response.sendRedirect("index.jsp");
                }
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
