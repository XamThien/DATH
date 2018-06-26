/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package site.actions.login;

import database.Hibernate;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import service.PGValidation;
import service.UserAuthentication;

/**
 *
 * @author dangt
 */
@WebServlet(name = "UserUpdate", urlPatterns = {"/user-update"})
public class UserUpdate extends HttpServlet {

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
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String cardid = request.getParameter("cardid");
        String sex = request.getParameter("sex");
        //System.out.println(fname +" "+lname + " " + email+ " " +address + " " + phone+" " +cardid + " " + sex);
        UserAuthentication auth = (UserAuthentication) request.getSession().getAttribute("authentic");
        if (auth != null) {
            auth.getUsers().setFirstName(fname);
            auth.getUsers().setLastName(lname);
            auth.getUsers().setEmail(email);
            auth.getUsers().setAddress(address);
            auth.getUsers().setPhoneNumber(phone);
            if (cardid != null) {
                auth.getUsers().setCardId(cardid);
            }
            if (sex != null) {
                auth.getUsers().setSex((Integer.parseInt(sex) == 1));
            }
            Session session = Hibernate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            String valid = new PGValidation().validateUserInformation(auth.getUsers(), auth.getUsers().getUserPassword());
            if (valid.equals("valid")) {
                session.merge(auth.getUsers());
                session.getTransaction().commit();
                response.getWriter().print("success");
            } else {
                session.refresh(auth.getUsers());
                session.getTransaction().rollback();
                response.getWriter().print(valid);
            }
        } else {
            response.getWriter().print("faild");
        }
        
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
