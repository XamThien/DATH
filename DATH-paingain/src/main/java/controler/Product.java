package controler;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import DAO.*;
import model.*;

/**
 * Servlet implementation class Product
 */
@WebServlet("/product")
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");
    	HttpSession session = request.getSession();
    	int cateid = (int)session.getAttribute("cateid");
    	ProductDAO db = new ProductDAO();
		String action = request.getParameter("action");
		String message ="";
		switch(action)
		{
		case "delete":
			try
			{
				String id = request.getParameter("did");
				
				PgProducts tll = db.getPgProductsByID(Integer.parseInt(id));
				
				tll.setProductStatus(0);
	            
	            try
	            {
	            	db.updatePgProduct(tll);
	            	
	            	message = "Xóa sản phẩm thành công.";
	            	RequestDispatcher xxx = request.getRequestDispatcher("sanpham.jsp?id="+cateid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
	            	
	            }
	            catch(Exception e)
				{
	            	message = "Xóa sản phẩm không thành công .";
	            	RequestDispatcher xxx = request.getRequestDispatcher("sanpham.jsp?id="+cateid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
				}
			}
			catch(Exception e)
			{
				message = "Xóa sản phẩm không thành công .";
            	RequestDispatcher xxx = request.getRequestDispatcher("sanpham.jsp?id="+cateid);
				request.setAttribute("msg", message );
				xxx.forward(request, response);
			}
			
			break;
		case "edit":
			try
			{
//				String id = request.getParameter("id");
//				String ten = request.getParameter("name");
//				String sdt = request.getParameter("phone");
//				String tk = request.getParameter("username");
//				String mk = request.getParameter("pass");
//				String dc = request.getParameter("address");
//				
//				
//				PgProducts tll = db.getPgProductsByID(Integer.parseInt(id));
//				tll.setName(ten);
//				tll.setPhone(sdt);
//				tll.setUserName(tk);
//				tll.setPass(mk);
//				tll.setAddress(dc);
//				
//	            
//	            try
//	            {
//	            	db.updateNhanVien(tll);
//	            	
//	            	message = "Sửa thông tin nhân viên thành công.";
//	            	RequestDispatcher xxx = request.getRequestDispatcher("nhanvien.jsp");
//					request.setAttribute("msg", message );
//					xxx.forward(request, response);
//	            	
//	            }
//	            catch(Exception e)
//				{
//	            	message = "Sửa thông tin nhân viên không thành công 1."+e;
//	            	RequestDispatcher xxx = request.getRequestDispatcher("nhanvien.jsp");
//					request.setAttribute("msg", message );
//					xxx.forward(request, response);
//				}
			}
			catch(Exception e)
			{
				message = "Sửa thông tin nhân viên không thành công 2."+e;
	        	RequestDispatcher xxx = request.getRequestDispatcher("sanpham.jsp?id="+cateid);
				request.setAttribute("msg", message );
				xxx.forward(request, response);
			}
			
			break;
		case "add":
			try
			{
				String ten = request.getParameter("ten");
				int categoryid = Integer.parseInt(request.getParameter("danhmuc"));
				int nccid = Integer.parseInt(request.getParameter("ncc"));
				int sl = Integer.parseInt(request.getParameter("soluong"));
				int gianhap = Integer.parseInt(request.getParameter("gianhap"));
				int giaban = Integer.parseInt(request.getParameter("giaban"));
				boolean ishot = Boolean.parseBoolean((request.getParameter("hot")==null || !request.getParameter("hot").equals("true"))?"false":"true");
				boolean isnew = Boolean.parseBoolean((request.getParameter("new")==null || !request.getParameter("new").equals("true"))?"false":"true");
				String mota = request.getParameter("mota");
				
				 Date Ngay = new Date();
			     SimpleDateFormat datefrmat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			     String datestr = datefrmat.format(Ngay);
			     Date now = datefrmat.parse(datestr);
				
			     
			    PgCategories cate = new CategoryDAO().getCategory(categoryid);
			    //anh===============================
			    //ncc 
			    PgSuppliers su = new PgSuppliers();
				PgProducts tl = new PgProducts(cate, su, ten, sl, giaban, gianhap, mota, now, now, isnew, ishot);
				
	            try
	            {
	            	db.insertPgProduct(tl);
	            	
	            	message = "Thêm sản phẩm thành công.";
	            	RequestDispatcher xxx = request.getRequestDispatcher("sanpham.jsp?id="+cateid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
	            	
	            }
	            catch(Exception e)
				{
	            	message = "Thêm sản phẩm không thành công.";
	            	RequestDispatcher xxx = request.getRequestDispatcher("sanpham.jsp?id="+cateid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
				}
			}
			catch(Exception e)
			{
				message = "Thêm sản phẩm không thành công.";
	        	RequestDispatcher xxx = request.getRequestDispatcher("sanpham.jsp?id="+cateid);
				request.setAttribute("msg", message );
				xxx.forward(request, response);
			}
			break;
		default:
			break;
		}
	}

}
