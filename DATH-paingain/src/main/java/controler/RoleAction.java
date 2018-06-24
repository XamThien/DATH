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
import DAO.RoleDAO;
import DAO.RolePermissionDAO;
import model.PgModules;
import model.PgRolePermission;
import model.PgRoles;

public class RoleAction extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RoleAction() {
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
		String action = request.getParameter("action");
		String message = "";
		 try
		 {
			 switch (action) {
			 case "add":
				 int module = Integer.parseInt(request.getParameter("module"));
				 
				 int role = Integer.parseInt(request.getParameter("roleid"));
				 ArrayList<PgRolePermission> per =(ArrayList<PgRolePermission>) new RolePermissionDAO().getPgRolePermissionByRoleIDModuleID(role, module);
				 
				 if(per != null ){
					 message = "Thao tác đã tồn tại!";
					 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/editrole.jsp?roleid="+role);
					 request.setAttribute("msg", message);
					 dispatcher.forward(request, response);	
					 
				 } else {
					 int status =1;
					 Boolean read, inse, update, del;
					 String des = request.getParameter("desc");
					 if(request.getParameter("read") == null || request.getParameter("read") == ""){
						 read = false;
					 } else {
						 read = true;
					}
					 if(request.getParameter("insert") == null || request.getParameter("insert") == ""){
						inse = false;
					 } else {
						 inse = true;
					}
					 if(request.getParameter("update") == null || request.getParameter("update") == ""){
						 update = false;
					 } else {
						  update = true;
					}
					 if(request.getParameter("del") == null || request.getParameter("del") == ""){
						 del = false;
					 } else {
						 del = true;
					}
					 PgModules mol = new ModuleDAO().getPgModulesByID(module);
					 PgRoles rol = new  RoleDAO().getPgRolesByID(role);
					 PgRolePermission sup = new PgRolePermission(mol,rol,inse,update,del,read,status,des);
					 try 
					 {
						
						 if(new RolePermissionDAO().insertPgRolePermission(sup))
						 {
							 message = "Thêm thành công!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/editrole.jsp?roleid="+role);
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);						 
						 }
						 else
						 {
							 message = "Không thành công!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/editrole.jsp?roleid="+role);
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);	
						 }
						 
					 } catch (Exception e) {
						response.getWriter().println("Lỗi: " + e.getMessage());
					 }
				 }
				 
			 
			 break;
			 
			 case "edit":
				 int modulee = Integer.parseInt(request.getParameter("module"));
				 
				 int rolee = Integer.parseInt(request.getParameter("roleid"));
				 ArrayList<PgRolePermission> pere =(ArrayList<PgRolePermission>) new RolePermissionDAO().getPgRolePermissionByRoleIDModuleID(rolee, modulee);
				 if(pere == null ){
					 int status =1;
					 Boolean read, inse, update, del;
					 String des = request.getParameter("desc");
					 if(request.getParameter("read") == null || request.getParameter("read") == ""){
						 read = false;
					 } else {
						 read = true;
					}
					 if(request.getParameter("insert") == null || request.getParameter("insert") == ""){
						inse = false;
					 } else {
						 inse = true;
					}
					 if(request.getParameter("update") == null || request.getParameter("update") == ""){
						 update = false;
					 } else {
						  update = true;
					}
					 if(request.getParameter("del") == null || request.getParameter("del") == ""){
						 del = false;
					 } else {
						 del = true;
					}
					 PgModules mol = new ModuleDAO().getPgModulesByID(modulee);
					 PgRoles rol = new  RoleDAO().getPgRolesByID(rolee);
					 PgRolePermission sup = new PgRolePermission(mol,rol,inse,update,del,read,status,des);
					 try 
					 {
						
						 if(new RolePermissionDAO().insertPgRolePermission(sup))
						 {
							 message = "Thêm thành công!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/editrole.jsp?roleid="+rolee);
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);						 
						 }
						 else
						 {
							 message = "Không thành công!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/editrole.jsp?roleid="+rolee);
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);	
						 }
						 
					 } catch (Exception e) {
						response.getWriter().println("Lỗi: " + e.getMessage());
					 }
				 } else {
					 message = "Thao tác đã tồn tại!";
					 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/editrole.jsp?roleid="+rolee);
					 request.setAttribute("msg", message);
					 dispatcher.forward(request, response);	
				 }
				 break;
			/* default:
				 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/module.jsp");
				 dispatcher.forward(request, response);
				 break;*/
			 }
		 }
		 catch (Exception e)
		 {
			 response.getWriter().println("Lỗi: " + e.getMessage());
		 }
	}
}
