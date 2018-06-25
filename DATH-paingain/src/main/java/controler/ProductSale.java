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
import DAO.ProductDAO;

import model.PgProducts;
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
		switch(action)
		{
		
		case "edit":
//			try
//			{
//				int id = Integer.parseInt(request.getParameter("eid"));
//				String ten = request.getParameter("eten");
//				int categoryid = Integer.parseInt(request.getParameter("edanhmuc"));
//				int nccid = Integer.parseInt(request.getParameter("encc"));
//				int sl = Integer.parseInt(request.getParameter("esoluong"));
//				int gianhap = Integer.parseInt(request.getParameter("egianhap"));
//				int giaban = Integer.parseInt(request.getParameter("egiaban"));
//				boolean ishot = Boolean.parseBoolean((request.getParameter("ehot")==null || !request.getParameter("ehot").equals("true"))?"false":"true");
//				boolean isnew = Boolean.parseBoolean((request.getParameter("enew")==null || !request.getParameter("enew").equals("true"))?"false":"true");
//				String mota = request.getParameter("emota");
//				
//				 Date Ngay = new Date();
//			     SimpleDateFormat datefrmat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			     String datestr = datefrmat.format(Ngay);
//			     Date now = datefrmat.parse(datestr);
//				
//			     
//			    PgCategories cate = new CategoryDAO().getCategory(categoryid);
//			    //anh===============================
//			    //ncc 
//			    PgSuppliers su = new PgSuppliersDAO().findByID(nccid);
//				PgProducts tl = new ProductDAO().getPgProductsByID(id);//new PgProducts(cate, su, ten, sl, giaban, gianhap, mota, now, now, ishot, isnew);
//				tl.setPgCategories(cate);
//				tl.setPgSuppliers(su);
//				tl.setProductName(ten);
//				tl.setQuantity(sl);
//				tl.setUnitPrice(giaban);
//				tl.setUnitOrder(gianhap);
//				tl.setDescription(mota);
//				tl.setModifiedTime(now);
//				tl.setIsHot(ishot);
//				tl.setIsNew(isnew);
//	            try
//	            {
//	            	new ProductDAO().updatePgProduct(tl);
//	            	
//	            	String img_photo = uploadFile(request,"ephoto");
//	            	if(img_photo== null || img_photo.equals(""))
//	            	{
//	            		
//	            	}
//	            	else
//	            	{
//	            		PgProductPictures prpic = new ProductPictures().getPgProductPicturesByID(id);
//	            		prpic.setPath(request.getContextPath()+img_photo);
//	            		new ProductPictures().updatePgProductPictures(prpic);
//	            	}
//	            	
//	            	
//	            	message = "Sửa thông tin sản phẩm thành công.";
//	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
//					request.setAttribute("msg", message );
//					xxx.forward(request, response);
//	            	
//	            }
//	            catch(Exception e)
//				{
//	            	message = "Sửa thông tin sản phẩm không thành công.1";
//	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
//					request.setAttribute("msg", message );
//					xxx.forward(request, response);
//				}
//			}
//			catch(Exception e)
//			{
//				message = "Sửa thông tin sản phẩm không thành công.2"+e;
//	        	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
//				request.setAttribute("msg", message );
//				xxx.forward(request, response);
//			}
			break;
		case "add":
			int cateidd = Integer.parseInt(request.getParameter("cateid"));
			try
			{
				
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
