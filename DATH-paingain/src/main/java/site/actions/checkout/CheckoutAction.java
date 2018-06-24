/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package site.actions.checkout;

import database.Hibernate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.PgOrderDetails;
import model.PgOrders;
import model.PgUsers;
import org.hibernate.Session;
import service.UserAuthentication;

/**
 *
 * @author dangt
 */
@WebServlet(name = "CheckoutAction", urlPatterns = {"/checkout-action"})
public class CheckoutAction extends HttpServlet {

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
            out.println("<title>Servlet CheckoutAction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutAction at " + request.getContextPath() + "</h1>");
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
        HttpSession httpSession = request.getSession();
        PgOrders cartc = (PgOrders) httpSession.getAttribute("mycart");
        UserAuthentication auth = (UserAuthentication) httpSession.getAttribute("authentic");

        if (auth == null) {
            response.sendRedirect(request.getContextPath() + "/site-login");
            return;
        }
        if (cartc == null) {
            cartc = new Cart();
        }
        PgOrders cart = new PgOrders();
        PgUsers user = auth.getUsers();
        if (cartc.getPgOrderDetailses().size() != 0) {
            cart.setPgUsersByCustomerId(user);
            cart.setOrderDate(new Date());
            cart.setOrderStatus(0);
            cart.setShipName(user.getFirstName() + " " + user.getLastName());
            cart.setShipAddress(user.getAddress());
            cart.setShipPhone(user.getPhoneNumber());
            cart.setPgOrderDetailses(cartc.getPgOrderDetailses());
            Session session = Hibernate.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(cart);
            for (PgOrderDetails ord : cart.getPgOrderDetailses()) {
                ord.setPgOrders(cart);
                ord.setUnitPrice(ord.getPgProducts().getUnitPrice());
                session.save(ord);
            }
            session.getTransaction().commit();
            httpSession.setAttribute("mycart", new Cart());
            response.getWriter().print("success");
        } else {
            response.getWriter().print("cart empty");
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
