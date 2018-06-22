package controler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CategoryDAO;
import model.PgCategories;

public class CategoryAction extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CategoryAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	List<PgCategories> result = new ArrayList<PgCategories>();
		String action = request.getParameter("action");
		String message = "";
		 try
		 {
			 switch (action) {
			 case "add":
			 //
			 String name =request.getParameter("name");
			 String descrip = request.getParameter("descrip");
			 int sort = Integer.parseInt(request.getParameter("sort"));
			 int status = 1;
			 PgCategories sup = new PgCategories(name,descrip,sort,status);
			 try 
			 {
				 if(new CategoryDAO().insertPgCategories(sup))
				 {
					 message = "Thêm thành công!";
					 result = new CategoryDAO().getAllPgCategories();
					 request.setAttribute("result", result);
					 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/danhmuc.jsp");
					 request.setAttribute("msg", message);
					 dispatcher.forward(request, response);						 
				 }
				 else
				 {
					 message = "Không thành công!";
					 result = new CategoryDAO().getAllPgCategories();
					 request.setAttribute("result", result);
					 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/danhmuc.jsp");
					 request.setAttribute("msg", message);
					 dispatcher.forward(request, response);
				 }
				 
			 } catch (Exception e) {
				response.getWriter().println("Lỗi: " + e.getMessage());
			 }
			 break;
			 case "edit":
				 	int ma = Integer.parseInt(request.getParameter("id"));
				 	String ename =request.getParameter("name");
					 String edescrip = request.getParameter("descrip");
					 int esort = Integer.parseInt(request.getParameter("sort"));
					 int statusE = Integer.parseInt(request.getParameter("status"));;
					try 
					{
				 		PgCategories cat = new PgCategories(ma,ename,edescrip,esort,statusE);
					    new CategoryDAO().updatePgCategories(cat);
					    message = "Cập nhật thành công!";
					    result = new CategoryDAO().getAllPgCategories();
						 request.setAttribute("result", result);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/danhmuc.jsp");
						request.setAttribute("msg", message );
						dispatcher.forward(request, response);
								
						
					}
					catch (Exception e)
					{
						 message = "Cập nhật không thành công!";
						 result = new CategoryDAO().getAllPgCategories();
						 request.setAttribute("result", result);
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/danhmuc.jsp");
						 request.setAttribute("msg", message );
						 dispatcher.forward(request, response);
					}
				 break;
			 }
		 }
		 catch (Exception e)
		 {
			 response.getWriter().println("Lỗi: " + e.getMessage());
		 }
	}
}
