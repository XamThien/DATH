/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package site.Views.login;

import database.Hibernate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PgRoles;
import model.PgUsers;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import service.PGValidation;

/**
 *
 * @author dangt
 */
@WebServlet(name = "Signup", urlPatterns = {"/signup"})
public class Signup extends HttpServlet {

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
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String cfpass = request.getParameter("passconfirm");
        PgUsers user = new PgUsers(username, name, name, phone, password, 1);
        user.setAddress(address);
        user.setEmail(email);
        String href = !request.getParameter("href").equals("") ? request.getParameter("href") : "site/login.jsp";
        String valid = new PGValidation().validateUserInformation(user, cfpass);
        if (valid.equals("valid")) {
            Session session = Hibernate.getSessionFactory().openSession();
            session.beginTransaction();
            List rs = session.createCriteria(PgUsers.class)
                    .add(Restrictions.or(Restrictions.eq("userId", username), Restrictions.eq("email", email)))
                    .list();
            if (rs == null) {
                request.setAttribute("spMsg", "Email hoac usernam da ton tai trong he thong");
            } else {
                session.save(user);
                session.getTransaction().commit();
                session.close();
                request.setAttribute("spMsg", "Dang ky thanh cong");
                request.getRequestDispatcher(href).forward(request, response);
            }
        } else {
            request.setAttribute("spMsg", valid);
        }
        request.setAttribute("href", href);
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
