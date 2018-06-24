package controler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ModuleDAO;
import model.PgModules;

public class ModuleAction extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ModuleAction() {
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
    	List<PgModules> result = new ArrayList<PgModules>();
		String action = request.getParameter("action");
		String message = "";
		 try
		 {
			 switch (action) {
			 case "add":
				 String name =request.getParameter("name");
				 int parent = Integer.parseInt(request.getParameter("parent"));
				 PgModules sup = new PgModules(name,parent);
				 try 
				 {
					
					 if(new ModuleDAO().insertPgModules(sup))
					 {
						 message = "Thêm thành công!";
						 result = new ModuleDAO().getAllPgModules();
						 request.setAttribute("result", result);
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/module.jsp");
						 request.setAttribute("msg", message);
						 dispatcher.forward(request, response);						 
					 }
					 else
					 {
						 message = "Không thành công!";
						 result = new ModuleDAO().getAllPgModules();
						 request.setAttribute("result", result);
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/module.jsp");
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
				 	int eparent = Integer.parseInt(request.getParameter("parent"));
					 int statusE = Integer.parseInt(request.getParameter("status"));;
					try 
					{
				 		PgModules mol = new PgModules(ma,ename,eparent,statusE);
					    new ModuleDAO().updatePgModules(mol);
					    message = "Cập nhật thành công!";
					    result = new ModuleDAO().getAllPgModules();
						 request.setAttribute("result", result);
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/module.jsp");
						request.setAttribute("msg", message );
						dispatcher.forward(request, response);
								
						
					}
					catch (Exception e)
					{
						 message = "Cập nhật không thành công!";
						 result = new ModuleDAO().getAllPgModules();
						 request.setAttribute("result", result);
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/module.jsp");
						 request.setAttribute("msg", message );
						 dispatcher.forward(request, response);
					}
				 break;
			 default:
				 result = new ModuleDAO().getAllPgModules();
				 request.setAttribute("result", result);
				 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/module.jsp");
				 dispatcher.forward(request, response);
				 break;
			 }
		 }
		 catch (Exception e)
		 {
			 response.getWriter().println("Lỗi: " + e.getMessage());
		 }
	}
}