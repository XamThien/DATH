/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler.dashboard;

import database.Hibernate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PgOrderDetails;
import model.PgOrderStatus;
import model.PgOrders;
import model.PgRoles;
import model.PgUsers;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dangt
 */
@WebServlet(name = "Dashboard", urlPatterns = {"/dashboard"})
public class Dashboard extends HttpServlet {

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
            out.println("<title>Servlet Dashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Dashboard at " + request.getContextPath() + "</h1>");
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
        Session session = Hibernate.getSessionFactory().openSession();
        session.beginTransaction();
        List<PgOrders> orders = session.createCriteria(PgOrders.class)
                .add(Restrictions.and(Restrictions.eq("pgOrderStatus", new PgOrderStatus(3, "Hoan thanh")),
                        Restrictions.lt("orderDate", new Date(System.currentTimeMillis() + (24 * 60 * 60 * 1000))),
                        Restrictions.gt("orderDate", new Date(System.currentTimeMillis() - (24 * 60 * 60 * 1000)))
                )).list();
        session.getTransaction().commit();
        session.beginTransaction();
        PgRoles role = new PgRoles();
        role.setRoleId(3);
        List<PgUsers> users = session.createCriteria(PgUsers.class)
                .add(Restrictions.and(Restrictions.eq("userStatus", 1),
                        Restrictions.lt("createTime", new Date(System.currentTimeMillis() + (24 * 60 * 60 * 1000))),
                        Restrictions.gt("createTime", new Date(System.currentTimeMillis() - (24 * 60 * 60 * 1000)))
                )
                        .add(Restrictions.eq("pgRoles", role))
                ).list();
        session.getTransaction().commit();
        long revenueDay = 0;
        for (PgOrders order : orders) {
            for (PgOrderDetails ors : order.getPgOrderDetailses()) {
                revenueDay += ors.getAmount() * (ors.getUnitPrice() - ors.getUnitSale());
            }
        }
        int numOrder = orders != null ? orders.size() : 0;
        int numUser = users != null ? users.size() : 0;
        session.close();
        request.setAttribute("revenueday", revenueDay);
        request.setAttribute("order", numOrder);
        request.setAttribute("user", numUser);
        response.getWriter().print(numOrder + "@" + numUser + " @ " + revenueDay);
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
