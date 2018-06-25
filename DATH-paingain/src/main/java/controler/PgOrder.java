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

import DAO.OrderStatusDAO;
import DAO.PgOrdersDAO;
import DAO.UserDAO;
import model.PgOrderStatus;
import model.PgOrders;

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
	        int cus = Integer.parseInt(request.getParameter("cus"));
	        String name = request.getParameter("name");
	        String address = request.getParameter("add");
	        String phone = request.getParameter("phone");
	        PgOrderStatus st = new OrderStatusDAO().getPgOrderStatusByID(tt);
	   /*     */
	        SimpleDateFormat datefrmat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        try {
				Date orderdate = datefrmat.parse(request.getParameter("dateorder"));
			
		        String message="";
		        
		        try
				{
		        	PgOrders ors = new PgOrders(order_id,st,new UserDAO().getPgUsersByID(cus),orderdate,name,address,phone);
			        	
		        	if(tt==3){
			        	Date Ngay = new Date();
			        	SimpleDateFormat datefrmats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			        	String datestr = datefrmats.format(Ngay);
					    
						Date now = datefrmat.parse(datestr);
						ors.setApprovedDate(now);
		        	}
					
		            try
		            {
		            	new PgOrdersDAO().updatePgOrders(ors);
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
