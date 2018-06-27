package controler;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import database.Hibernate;
import model.PgLog;
import model.PgOrderDetails;
import model.PgOrderStatus;
import model.PgOrders;
import model.PgRoles;
import model.PgUsers;

public class Home extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Home(){
		super();
	}
	
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
        //response.getWriter().print(numOrder + "@" + numUser + " @ " + revenueDay);
        response.setContentType("text/html;charset=UTF-8");
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        try {
            Date date = request.getParameter("filter") != null ? formatter.parse(request.getParameter("filter"))
                    : new Date(System.currentTimeMillis() - (24 * 60 * 60 * 1000));
            //Session session = Hibernate.getSessionFactory().openSession();
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
            //response.getWriter().print(content);
            request.getRequestDispatcher("/manager/danhmuc.jsp").forward(request, response);
           
        } catch (ParseException ex) {
            response.getWriter().print(ex.getMessage());
            
        }
    }
}
