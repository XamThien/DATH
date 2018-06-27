package controler;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import DAO.LogDAO;
import DAO.OrderStatusDAO;
import DAO.PgOrdersDAO;
import DAO.ProductDAO;
import DAO.UserDAO;
import database.Hibernate;
import model.PgLog;
import model.PgOrderDetails;
import model.PgOrderStatus;
import model.PgOrders;
import model.PgUsers;

/**
 * Servlet implementation class PgOrder
 */
@WebServlet("/order")
public class PgOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PgOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
	        request.setCharacterEncoding("utf-8");
	        int order_id = Integer.parseInt(request.getParameter("oid").trim());
	        int tt = Integer.parseInt(request.getParameter("tt").trim());
//	        String cus = request.getParameter("cus");
//	        String name = request.getParameter("name");
//	        String address = request.getParameter("add");
//	        String phone = request.getParameter("phone");
	        PgOrderStatus st =  new PgOrderStatus(tt,"xxx"); //new OrderStatusDAO().getPgOrderStatusByID(tt);
	   /*     */
	        SimpleDateFormat datefrmat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        HttpSession sesion = request.getSession();
			PgUsers u = (PgUsers) sesion.getAttribute("login");
	        try {
				Date orderdate = datefrmat.parse(request.getParameter("dateorder"));
			
		        String message="";
		        //PgUsers us = new PgUsers(cus);
		        try
				{
		        	Date Ngay = new Date();
		        	SimpleDateFormat datefrmats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        	String datestr = datefrmats.format(Ngay);
				    
					Date now = datefrmats.parse(datestr);
		        	//PgOrders ors = new PgOrders(order_id,st,us,orderdate,name,address,phone);
			        PgOrders ors = new	PgOrdersDAO().getPgOrdersByIDxx(order_id);
			        ors.setPgOrderStatus(st);
		        	if(tt==3){
			        	
						ors.setApprovedDate(now);
		        	}
					
		            try
		            {
		            	new PgOrdersDAO().updatePgOrders(ors);
		            	
		            	String ms = "Đơn hàng số "+order_id+" được ";
		            	switch (tt) {
						case 0:
							ms +="bị hủy";
							break;
						case 1:
							ms += "đang xử lý tiếp nhận";
							break;
						case 2:
							ms += "đang giao hàng";
							break;
						case 3:
							ms +="đã hoàn thành";
							break;
						default:
							break;
						}
						 PgLog log = new PgLog(u,now,ms,"");
						 new LogDAO().insertPgLog(log);
		            	message = "Cập nhật đơn hàng thành công.";
		            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/chitiethoadon.jsp?stt="+tt+"&id="+order_id);
						request.setAttribute("msg", message );
						xxx.forward(request, response);
		            	
		            }
		            catch(Exception e)
					{
		            	message = "Cập nhật đơn hàng không thành công 1.";
		            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/chitiethoadon.jsp?stt="+tt+"&id="+order_id);
						request.setAttribute("msg", message );
						xxx.forward(request, response);
					}
		        
				}
		        catch(Exception e)
				{
		        	message = "Cập nhật đơn hàng không thành công 2."+e;
		        	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/chitiethoadon.jsp?stt="+tt+"&id="+order_id);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
				}
	        } catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        }
	        

}
