/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package site.Views.login;

import database.Hibernate;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PgLog;
import model.PgRoles;
import model.PgUsers;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import DAO.LogDAO;
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String cfpass = request.getParameter("passconfirm");
        PgRoles role = new PgRoles();
        role.setRoleId(3);
        role.setRoleName("Customer");
        PgUsers user = new PgUsers();
        user.setFirstName(fname);
        user.setLastName(lname);
        user.setAddress(address);
        user.setEmail(email);
        user.setPhoneNumber(phone);
        user.setUserId(username);
        user.setUserPassword(password);
        user.setPgRoles(role);
        String href = !request.getParameter("href").equals("") ? request.getParameter("href") : "site/login.jsp";
        String valid = new PGValidation().validateUserInformation(user, cfpass);
        if (valid.equals("valid")) {
            Session session = Hibernate.getSessionFactory().openSession();
            session.beginTransaction();
            List rs = session.createCriteria(PgUsers.class)
                    .add(Restrictions.or(Restrictions.eq("userId", username), Restrictions.eq("email", email)))
                    .list();
            if (!rs.isEmpty()) {
                request.setAttribute("spMsg", "Email hoac usernam da ton tai trong he thong");
            } else {
                session.save(user);
                session.getTransaction().commit();
                session.close();
                request.setAttribute("spMsg", "Dang ky thanh cong");
                Date Ngay = new Date();
            	SimpleDateFormat datefrmats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            	String datestr = datefrmats.format(Ngay);
            	try {
            		Date now = datefrmats.parse(datestr);
            		String ms = "Khách hàng vừa đăng kí tài khoản với tên tài khoản "+user.getUserId();
   				 PgLog log = new PgLog(user,now,ms,"");
   				 new LogDAO().insertPgLog(log);
				} catch (Exception e) {
					// TODO: handle exception
				}
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
