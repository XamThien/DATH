/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package site.Views.home;

import DAO.CategoryDAO;
import database.Hibernate;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PgCategories;
import model.PgProducts;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dangt
 */
@WebServlet(name = "Shop", urlPatterns = {"/shop"})
public class Shop extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));
        Session session = Hibernate.getSessionFactory().openSession();
        session.beginTransaction();
        List categoriesList = session.createCriteria(PgCategories.class)
                .add(Restrictions.eq("categoryStatus", 1)).list();
        List<PgProducts> products = session.createCriteria(PgProducts.class, "products")
                .createAlias("products.pgCategories", "category")
                .add(Restrictions.and(Restrictions.eq("category.categoryStatus", 1),
                        Restrictions.eq("category.categoryId", id),
                        Restrictions.eq("products.productStatus", 1)
                ))
                .addOrder(Order.desc("products.isNew"))
                .addOrder(Order.desc("products.isHot"))
                .list();
        PgCategories category = (PgCategories) session.get(PgCategories.class, id);
        session.getTransaction().commit();
        request.setAttribute("categories", categoriesList);
        request.setAttribute("title", "Shop| " + category.getCategoryName());
        request.setAttribute("category", category);
        request.setAttribute("items", products);

        request.getRequestDispatcher("site/shop.jsp").forward(request, response);
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
