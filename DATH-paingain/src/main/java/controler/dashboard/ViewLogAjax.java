/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler.dashboard;

import database.Hibernate;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PgLog;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dangt
 */
@WebServlet(name = "ViewLogAjax", urlPatterns = {"/view-log"})
public class ViewLogAjax extends HttpServlet {

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
            out.println("<title>Servlet ViewLogAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewLogAjax at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        try {
            Date date = request.getParameter("filter") != null ? formatter.parse(request.getParameter("filter"))
                    : new Date(System.currentTimeMillis() - (24 * 60 * 60 * 1000));
            Session session = Hibernate.getSessionFactory().openSession();
            List<PgLog> logs = session.createCriteria(PgLog.class)
                    .add(Restrictions.gt("createdTime", date)).list();
            String content = "<ul>";

            for (PgLog log : logs) {
                long logc = new Date().getTime() - log.getCreatedTime().getTime();
                long diffMinutes = logc / (60 * 1000) % 60;
                long diffHours = logc / (60 * 60 * 1000) % 24;
                long diffDays = logc / (24 * 60 * 60 * 1000);
                String str = diffDays != 0 ? diffDays + " day " : "";
                str += diffHours != 0 ? diffHours + " hours " : "";
                str += diffMinutes != 0 ? diffMinutes + " minutes" : "just now";
                content += "<li><b>- " + log.getPgUsers().getUserId() + " </b> " + log.getDescription()
                        + " " + log.getLogValue() + " "
                        + "<p style='font-size: 11px;'><i>" + str + "</i></p></li>";
            }
            content += "</ul>";
            session.close();
            response.getWriter().print(content);
            return;
        } catch (ParseException ex) {
            response.getWriter().print(ex.getMessage());
            return;
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
