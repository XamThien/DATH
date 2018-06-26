/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package site.actions.cart;

import DAO.ProductDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.PgOrderDetails;
import model.PgOrderStatus;
import model.PgProducts;

/**
 *
 * @author dangt
 */
@WebServlet(name = "cartajax", urlPatterns = {"/cart-action"})
public class CartAjax extends HttpServlet {

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
        response.getWriter().print("access denied");
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
        String pId = request.getParameter("pId") != null ? request.getParameter("pId") : "";
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        PgProducts product = new ProductDAO().getPgProductsByID(Integer.parseInt(pId));
        PgOrderDetails order = new PgOrderDetails();
        order.setPgProducts(product);
        order.setUnitPrice(product.getUnitPrice());
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("mycart");
        if (cart == null) {
            cart = new Cart();
            cart.setPgOrderStatus(new PgOrderStatus(1, "Dang Tiep nhan"));
        }
        if (!action.equals("delete")) {
            order.setAmount(1);
            cart.addToCart(order);
            session.setAttribute("mycart", cart);
            response.getWriter().print("success");
        } else {
            if (cart.removeFromCart(order)) {
                session.setAttribute("mycart", cart);
                response.getWriter().print("success");
            } else {
                response.getWriter().print("faild");
            }
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
        String data = request.getParameter("products");
        ArrayList list = new Gson().fromJson(data, ArrayList.class);
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("mycart");
        if (cart == null) {
            cart = new Cart();
        }
        try {
            for (Object item : list) {
                JsonObject jsonObject = new JsonParser().parse(item.toString()).getAsJsonObject();
                PgOrderDetails porder = new PgOrderDetails();
                for (PgOrderDetails od : cart.getPgOrderDetailses()) {
                    if (od.getPgProducts().getProductId() == Integer.parseInt(jsonObject.get("id").toString())) {
                        porder = od;
                        break;
                    }
                }
                if (Integer.parseInt(jsonObject.get("value").toString()) < porder.getPgProducts().getQuantity()) {
                    porder.setAmount(Integer.parseInt(jsonObject.get("value").toString()));
                } else {
                    response.getWriter().println("vuot qua so luong trong kho");
                }
            }
            session.setAttribute("mycart", cart);
            response.getWriter().print("success");
        } catch (Exception e) {
            response.getWriter().println("co loi xay ra");
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
