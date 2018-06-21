/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package site.Views.login;

import database.Hibernate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.UserAuthentication;

/**
 *
 * @author dangt
 */
@WebServlet(name = "Authentication", urlPatterns = {"/auth"})
public class Authentication extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect(request.getContextPath() + "/site/layouts/accessdenied.jsp");
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
        //processRequest(request, response);

        String username = request.getParameter("username");
        String password;
        password = request.getParameter("lgpassword") !=null?request.getParameter("lgpassword"):"";
        Matcher matcher = Pattern.compile("(^([a-zA-Z]+[0-9]*){6,}$)|(^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$)", Pattern.CASE_INSENSITIVE).matcher(username);
        if (matcher.find()) {
            if (password.length() == 0) {
                request.setAttribute("msg", "mat khau qua ngan");
            } else {
                UserAuthentication auth = new UserAuthentication();
                if (auth.login(username, password)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("authentic", auth);
                    Hibernate.getSessionFactory().getCurrentSession().close();
                    response.sendRedirect(request.getContextPath()+"/home");
                    return;
                } else {
                    request.setAttribute("msg", "Password is incorrect");
                    Hibernate.getSessionFactory().getCurrentSession().close();
                }
            }
        } else {
            request.setAttribute("msg", "Username is incorrect");
        }
        request.setAttribute("title", "Login and Signup");
        request.getRequestDispatcher("site/login.jsp").forward(request, response);

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
