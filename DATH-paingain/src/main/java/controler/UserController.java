package controler;

import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import model.PgRoles;
import model.PgUsers;
import service.PGValidation;
import service.PainAndGainService;

public class UserController extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		PgUsers user = null;
		try {
			user = new UserDAO().getPgUsersByName(username);
			if (user != null) {
				response.getWriter().append("Tên đăng nhập đã tồn tại!!!");
			} else {
				response.getWriter().append("");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
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
			 String ma = request.getParameter("username");
			 String firstname =request.getParameter("firstname");
			 String lastname = request.getParameter("lastname");
			 String address = request.getParameter("address");
			 String phone = request.getParameter("phone");
			 String cardId = request.getParameter("cardid");
			 String email = request.getParameter("email");
			 String sexParam = (request.getParameter("sex"));
			 String userpass = request.getParameter("userpassword");
			 int role = Integer.parseInt(request.getParameter("role"));
			 Boolean sex = false;
			 if(sexParam.equals("man")) {
				 sex = true;
			 }
			 int status = Integer.parseInt(request.getParameter("status"));
			   String date = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss").format(LocalDateTime.now());
			   Date createDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(date);
			   PgRoles pgRoles = new PgRoles();
			   pgRoles.setRoleId(role);
			 boolean checkEmail = false;
			 if (email.equals("") || email == null) {
				 checkEmail = true;
			 } else {
				 checkEmail = new PGValidation().checkMail(email);
			 }
			 boolean checkPhone = new PGValidation().checkPhone(phone);
			 PgUsers user = new PgUsers(ma,firstname,lastname,address,phone,cardId,email,sex,userpass,createDate,createDate,status,pgRoles);
			 try 
			 {
				 if(ma.equals("") || lastname.equals("") || phone.equals("") || userpass.equals("") || ma == null || lastname == null || phone == null || userpass == null)
				 {
					 message = "Điền đầy đủ thông tin!";
					 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
					 request.setAttribute("msg", message);
					 dispatcher.forward(request, response);	
				 } else if (checkEmail == false || checkPhone == false) {
					 message = "Định dạng Email hoặc số điện thoại không chính xác!";
					 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
					 request.setAttribute("msg", message);
					 dispatcher.forward(request, response);	
				 }
				 else 
				 {
					 if(new UserDAO().getPgUsersByName(ma) == null) {
						 if(new UserDAO().insertPgUsers(user))
						 {
							 message = "Thành công!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);						 
						 }
						 else
						 {
							 message = "Không thành công!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);
						 }
					 } else {
						 message = "Tên đăng nhập đã tồn tại!";
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
						 request.setAttribute("msg", message);
						 dispatcher.forward(request, response);	
					 }
				 }
			 } catch (Exception e) {
				response.getWriter().println("Lỗi: " + e.getMessage());
			 }
			 break;
			 case "edit":
				 	 int recordE = Integer.parseInt(request.getParameter("recordE"));
				 	 String maE = request.getParameter("idE");
					 String firstnameE =request.getParameter("firstnameE");
					 String lastnameE = request.getParameter("lastnameE");
					 String addressE = request.getParameter("addressE");
					 String phoneE = request.getParameter("phoneE");
					 String cardidE = request.getParameter("cardidE");
					 String emailE = request.getParameter("emailE");
					 String sexParamE = (request.getParameter("sexE"));
					 String userpassE = request.getParameter("userpasswordE");
					 String dateParam = request.getParameter("createdateE");
					 int roleE = Integer.parseInt(request.getParameter("roleE"));
					 PgRoles pgRolesE = new PgRoles();
					 pgRolesE.setRoleId(roleE);
					 Date createDateE = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateParam);
					 Boolean sexE = false;
					 if(sexParamE.equals("man")) {
						 sexE = true;
					 }
					 int statusE = Integer.parseInt(request.getParameter("statusE"));
					 boolean checkEmailE = false;
					 if (emailE.equals("") || emailE == null) {
						 checkEmailE = true;
					 } else {
						 checkEmailE = new PGValidation().checkMail(emailE);
					 }
					 boolean checkPhoneE = new PGValidation().checkPhone(phoneE);
					 String date1 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss").format(LocalDateTime.now());
					   Date modifiedDateE = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(date1);				   
					
					try 
					{
						if (recordE == 0 || maE == "" || firstnameE =="" || lastnameE == "" || phoneE == "" || userpassE == "" || createDateE == null || maE.equals("") || firstnameE.equals("") || lastnameE.equals("") || phoneE.equals("") || userpassE.equals(""))
						 {
							message = "Cập nhật không thành công!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);
								
						 } else if (checkEmailE == false || checkPhoneE == false) {
							 message = "Định dạng Email hoặc số điện thoại không chính xác!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
							 request.setAttribute("msg", message);
							 dispatcher.forward(request, response);	
						 }
						else
						{
							 PgUsers userE = new PgUsers(recordE,maE,firstnameE,lastnameE,addressE,phoneE,cardidE,emailE,sexE,userpassE,createDateE,modifiedDateE,statusE,pgRolesE);
							    new UserDAO().updatePgUsers(userE);
							    message = "Cập nhật thành công!";
								RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
								request.setAttribute("msg", message );
								dispatcher.forward(request, response);
						}
						
					}
					catch (Exception e)
					{
						 message = "Cập nhật không thành công!";
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
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
