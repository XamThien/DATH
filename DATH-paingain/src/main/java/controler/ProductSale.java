package controler;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import DAO.ProductSalesDAO;
import DAO.LogDAO;
import DAO.ProductDAO;

import model.PgProducts;
import model.PgUsers;
import model.PgLog;
import model.PgProductSales;

/**
 * Servlet implementation class ProductSale
 */
@WebServlet("/khuyenmai")
public class ProductSale extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSale() {
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
    	
		String action = request.getParameter("action");
		String message ="";
		HttpSession sesion = request.getSession();
		PgUsers u = (PgUsers) sesion.getAttribute("login");
		Date Ngay = new Date();
    	SimpleDateFormat datefrmats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String datestr = datefrmats.format(Ngay);
    	
		switch(action)
		{
		
		case "edit":
			try
			{Date now = datefrmats.parse(datestr);
				int idsale = Integer.parseInt(request.getParameter("did"));
				
			     
				PgProductSales ps = new ProductSalesDAO().getProductSalesByID(idsale);
				if(ps.getSalesStatus() ==1)
				{
					// ttawst
					ps.setSalesStatus(0);
				}
				else
				{
					//baat
					boolean ck = true;
					int prduct_id = ps.getPgProducts().getProductId();
					List<Integer> lst = new ProductSalesDAO().getAllPgProductSalesAvtive();
					
					for (Integer idx : lst)
					 {
						if(idx==idsale)
						{
							ck = false;
							break;
						}
					 }
					if(ck)
					{
						ps.setSalesStatus(1);
					}
					else
					{
							message = "Sản phẩm này đang được khuyến mại.";
			            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/danhsachkhuyenmai.jsp");
							request.setAttribute("msg", message );
							xxx.forward(request, response);
					}
				}
			   
	            try
	            {
	            	
	            	new ProductSalesDAO().updatePgProduct(ps);
	            	
	            	message = "Cật nhật thành công.";
	            	String ms = "Cập nhật khuyến mãi có mã "+idsale;
					 PgLog log = new PgLog(u,now,ms,"");
					 new LogDAO().insertPgLog(log);
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/danhsachkhuyenmai.jsp");
					request.setAttribute("msg", message );
					xxx.forward(request, response);
	            	
	            }
	            catch(Exception e)
				{
	            	message = "Cật nhật không thành công.1";
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/danhsachkhuyenmai.jsp");
					request.setAttribute("msg", message );
					xxx.forward(request, response);
				}
			}
			catch(Exception e)
			{
				message = "Cật nhật không thành công.2"+e;
	        	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/danhsachkhuyenmai.jsp");
				request.setAttribute("msg", message );
				xxx.forward(request, response);
			}
			break;
		case "add":
			
			int cateidd = Integer.parseInt(request.getParameter("cateid"));
			try
			{
				Date now = datefrmats.parse(datestr);
				String[] listid = request.getParameter("lstid").split(",");
				int km = Integer.parseInt(request.getParameter("kmvalue"));
				String bg = request.getParameter("bgtime");
				bg= bg.split("/")[2]+"-"+bg.split("/")[0]+"-"+bg.split("/")[1];
				String ed = request.getParameter("edtime");
				ed= ed.split("/")[2]+"-"+ed.split("/")[0]+"-"+ed.split("/")[1];

	            try
	            {
	            	
	            	for( int i=0;i<listid.length;i++)
	            	{
							String id = listid[i];
	            			PgProducts sp = new PgProducts(Integer.parseInt(id));
	            			
		       			    SimpleDateFormat datefrmat = new SimpleDateFormat("yyyy-MM-dd");
		       			    Date da1 = datefrmat.parse(bg);
		       			    Date da2 = datefrmat.parse(ed);
	            			PgProductSales prsale = new PgProductSales(sp,da1,da2,km);
	            			new ProductSalesDAO().insertPgProduct(prsale);
	            		
	            	}
	            	String ms = "Thêm khuyến mãi cho sản phẩm ";
	            	for( int i=0;i<listid.length;i++)
	            	{
	            		String id = listid[i];
	            		PgProducts s = new ProductDAO().getPgProductsByID(Integer.parseInt(id));
	            		ms +=s.getProductName()+", ";
	            	}
					 PgLog log = new PgLog(u,now,ms,"");
					 new LogDAO().insertPgLog(log);
					 
	            	message = "Thêm khuyến mại thành công.";
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/khuyenmai.jsp?id="+cateidd);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
	            	
	            }
	            catch(Exception e)
				{
	            	message = "Thêm khuyến mại không thành công.1"+e;
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/khuyenmai.jsp?id="+cateidd);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
				}
			}
			catch(Exception e)
			{
				message = "Thêm khuyến mại không thành công.2"+e;
	        	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/khuyenmai.jsp?id="+cateidd);
				request.setAttribute("msg", message );
				xxx.forward(request, response);
			}
			break;
		default:
			break;
		}
	}
}
