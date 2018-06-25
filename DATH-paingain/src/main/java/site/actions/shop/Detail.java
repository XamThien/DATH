/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package site.actions.shop;

import database.Hibernate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PgCategories;
import model.PgProducts;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dangt
 */
@WebServlet(name = "Detail", urlPatterns = {"/detail"})
public class Detail extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        int pId = Integer.parseInt(request.getParameter("id"));
        Session session = Hibernate.getSessionFactory().openSession();
        session.beginTransaction();
        PgProducts product = (PgProducts) session.get(PgProducts.class, pId);
        if (product != null) {
            request.setAttribute("item", product);
        }
        List<PgCategories> categories = session.createCriteria(PgCategories.class)
                .addOrder(Order.asc("sortIndex")).list();
        List<PgProducts> relproduct = session.createCriteria(PgProducts.class)
                .add(Restrictions.ne("productId", pId))
                .addOrder(Order.desc("isNew"))
                .add(Restrictions.ne("productStatus", 0))
                .setMaxResults(3).list();
        session.getTransaction().commit();
        request.setAttribute("categories", categories);
        request.setAttribute("title", "Product detail");
        request.setAttribute("relp", relproduct);
        request.getRequestDispatcher("site/product-details.jsp").forward(request, response);
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
