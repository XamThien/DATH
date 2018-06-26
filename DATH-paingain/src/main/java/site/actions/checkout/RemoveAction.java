/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package site.actions.checkout;

import database.Hibernate;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PgOrderStatus;
import model.PgOrders;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import DAO.OrderStatusDAO;
import service.UserAuthentication;

/**
 *
 * @author dangt
 */
@WebServlet(name = "RemoveAction", urlPatterns = {"/order-remove"})
public class RemoveAction extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RemoveAction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RemoveAction at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String id = request.getParameter("id");
        HttpSession httpSession = request.getSession();
        UserAuthentication auth = (UserAuthentication) httpSession.getAttribute("authentic");
        if (auth != null) {
            Session session = Hibernate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            PgOrders order = (PgOrders) session.createCriteria(PgOrders.class)
                    .add(Restrictions.and(Restrictions.eq("orderId", Integer.parseInt(id)),
                            Restrictions.eq("pgUsers", auth.getUsers())))
                    .uniqueResult();
            if (order.getPgOrderStatus().getOrderStatusKey() == 1) {
                PgOrderStatus status = new PgOrderStatus();
                status.setOrderStatusKey(0);
            	order.setPgOrderStatus(status);
                session.update(order);
                response.getWriter().print("success");
            } else {
                response.getWriter().print("Don hang dang trong giai doan ban giao. Khong the huy");
            }
            session.refresh(auth.getUsers());
            session.getTransaction().commit();

        }
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
