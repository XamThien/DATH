package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PgOrdersDAO;
import DAO.ProductDAO;
import model.PgOrders;
import model.PgProducts;

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
	        String message="";
	        
	        try
			{
				
				PgOrders or = new PgOrdersDAO().getPgOrdersByID(order_id);
						
				or.setOrderStatus(tt);
	            
	            try
	            {
	            	new PgOrdersDAO().updatePgOrders(or);
	            	
	            	message = "Cập nhật đơn hàng thành công.";
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/chitiethoadon.jsp?stt="+tt+"&id="+order_id);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
	            	
	            }
	            catch(Exception e)
				{
	            	message = "Cập nhật đơn hàng không thành công 1."+e;
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
        }

}
