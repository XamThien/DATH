package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PgSuppliers;
import DAO.PgSuppliersDAO;

public class SupplierController extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupplierController() {
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
		request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String message = "";
		 try
		 {
			 switch (action) {
			 case "add":
			 //
			 String company =request.getParameter("companyname");
			 String contact = request.getParameter("contactname");
			 String add = request.getParameter("address");
			 String rg = request.getParameter("region");
			 String phone = request.getParameter("phone");
			 String email = request.getParameter("email");
			 int status = 1;
			 if(request.getParameter("status")==null) {
				 status = 0;
			 }
			 response.getWriter().println(status);
			 PgSuppliers sup = new PgSuppliers(company,contact,add,rg,phone,email,status);
			 try 
			 {
				 if (company ==null || contact == null || phone == null || company.equals("") || contact.equals("") || phone.equals(""))
				 {
					 message = "Điền đầy đủ thông tin!";
					 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/suppliers.jsp");
					 request.setAttribute("msg", message);
					 dispatcher.forward(request, response);
				 }
				 else 
				 {
					 if(new PgSuppliersDAO().insert(sup))
					 {
						 message = "Thành công!";
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/suppliers.jsp");
						 request.setAttribute("msg", message);
						 dispatcher.forward(request, response);						 
					 }
					 else
					 {
						 message = "Không thành công!";
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/suppliers.jsp");
						 request.setAttribute("msg", message);
						 dispatcher.forward(request, response);
					 }
				 }
			 } catch (Exception e) {
				response.getWriter().println("Lỗi: " + e.getMessage());
			 }
			 break;
			 case "edit":
				 	int ma = Integer.parseInt(request.getParameter("id"));
					 String companyE =request.getParameter("companynameE");
					 String contactE = request.getParameter("contactE");
					 String addE = request.getParameter("addressE");
					 String rgE = request.getParameter("regionE");
					 String phoneE = request.getParameter("phoneE");
					 String emailE = request.getParameter("emailE");
					 int statusE;
					 if(request.getParameterValues("statusE")==null) {
						 statusE = 0;
					 }else{
						 statusE = 1;
					 }
					try 
					{
						if (companyE !="" || contactE != "")
						 {
								PgSuppliers supE = new PgSuppliers(ma,companyE,contactE,addE,rgE,phoneE,emailE,statusE);
							    new PgSuppliersDAO().edit(supE);
							    message = "Cập nhật thành công!";
								RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/suppliers.jsp");
								request.setAttribute("msg", message );
								dispatcher.forward(request, response);
								
							
						 }
						else
						{
							 message = "Cập nhật không thành công!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/suppliers.jsp");
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);
						}
						
					}
					catch (Exception e)
					{
						 message = "Cập nhật không thành công!";
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/suppliers.jsp");
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
