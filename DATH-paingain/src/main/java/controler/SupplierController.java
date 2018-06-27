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

import model.PgLog;
import model.PgSuppliers;
import model.PgUsers;
import service.PGValidation;
import DAO.LogDAO;
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
		HttpSession sesion = request.getSession();
		PgUsers u = (PgUsers) sesion.getAttribute("login");
		Date Ngay = new Date();
    	SimpleDateFormat datefrmats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String datestr = datefrmats.format(Ngay);
		 try
		 {
			 Date now = datefrmats.parse(datestr);
			 switch (action) {
			 case "add":
			 //
			 String company =request.getParameter("companyname");
			 String contact = request.getParameter("contactname");
			 String add = request.getParameter("address");
			 String rg = request.getParameter("region");
			 String phone = request.getParameter("phone");
			 String email = request.getParameter("email");
			 int status = Integer.parseInt(request.getParameter("status"));
			 boolean checkEmail = false;
			 if (email.equals("") || email == null) {
				 checkEmail = true;
			 } else {
				 checkEmail = new PGValidation().checkMail(email);
			 }
			 boolean checkPhone = new PGValidation().checkPhone(phone);
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
				 else if (checkEmail == false || checkPhone == false) {
					 message = "Định dạng Email hoặc số điện thoại không chính xác!";
					 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/suppliers.jsp");
					 request.setAttribute("msg", message);
					 dispatcher.forward(request, response);	
				 } 
				 else
				 {
					 if(new PgSuppliersDAO().insert(sup))
					 {
						 message = "Thành công!";
						 String ms = "Thêm nhà cung cấp "+company;
						 PgLog log = new PgLog(u,now,ms,"");
						 new LogDAO().insertPgLog(log);
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
					 int statusE = Integer.parseInt(request.getParameter("statusE"));
					 boolean checkEmailE = false;
					 if (emailE.equals("") || emailE == null) {
						 checkEmailE = true;
					 } else {
						 checkEmailE = new PGValidation().checkMail(emailE);
					 }
					 boolean checkPhoneE = new PGValidation().checkPhone(phoneE);
					try 
					{
						if (companyE =="" || contactE == "" || phoneE == "" || companyE.equals("") || contactE.equals("") || phoneE.equals(""))
						 {
							message = "Cập nhật không thành công!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/suppliers.jsp");
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);							
						 } else if (checkEmailE == false || checkPhoneE == false) {
							 message = "Định dạng Email hoặc số điện thoại không chính xác!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/suppliers.jsp");
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);	
						 }
						else
						{
							PgSuppliers supE = new PgSuppliers(ma,companyE,contactE,addE,rgE,phoneE,emailE,statusE);
						    new PgSuppliersDAO().edit(supE);
						    message = "Cập nhật thành công!";
						    String ms = "Cập nhật thông tin nhà cung cấp "+companyE+ " có mã là "+ma;
							 PgLog log = new PgLog(u,now,ms,"");
							 new LogDAO().insertPgLog(log);
							RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/suppliers.jsp");
							request.setAttribute("msg", message );
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
