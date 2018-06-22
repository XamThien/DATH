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
import model.PgUsers;
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
			 Boolean sex = false;
			 if(sexParam.equals("man")) {
				 sex = true;
			 }
			 int status = 1;
			 if(request.getParameter("status")==null) {
				 status = 0;
			 }
			   String date = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss").format(LocalDateTime.now());
			   Date createDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(date);
			 PgUsers user = new PgUsers(ma,firstname,lastname,address,phone,cardId,email,sex,userpass,createDate,createDate,status);
			 try 
			 {
				 if (firstname !="" || lastname != "" || phone != "" || userpass != "")
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
				 else 
				 {
					 message = "Điền đầy đủ thông tin!";
					 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
					 request.setAttribute("msg", message);
					 dispatcher.forward(request, response);
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
					 Date createDateE = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateParam);
					 Boolean sexE = false;
					 if(sexParamE.equals("man")) {
						 sexE = true;
					 }
					 int statusE = 1;
					 if(request.getParameter("statusE")==null) {
						 statusE = 0;
					 }
					 String date1 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss").format(LocalDateTime.now());
					   Date modifiedDateE = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(date1);				   
					   System.out.println("-----------------------------------");
					   System.out.println("recordid"+recordE);
					   System.out.println("id "+maE);
					   System.out.println("first "+firstnameE);
					   System.out.println("lastname "+lastnameE);
					   System.out.println("address "+addressE);
					   System.out.println("phone "+phoneE);
					   System.out.println("cardid "+cardidE);
					   System.out.println("email "+emailE);
					   System.out.println("sexparam "+sexParamE);
					   System.out.println("userpass "+userpassE);
					   System.out.println("create date "+createDateE);
					   System.out.println("status "+statusE);
					   System.out.println("Boolean sex "+sexE);
					   System.out.println("-----------------------------------");
					try 
					{
						if (recordE != 0 || maE != "" || firstnameE !="" || lastnameE != "" || phoneE != "" || userpassE != "" || createDateE != null)
						 {
								PgUsers userE = new PgUsers(recordE,maE,firstnameE,lastnameE,addressE,phoneE,cardidE,emailE,sexE,userpassE,createDateE,modifiedDateE,statusE);
							    new UserDAO().updatePgUsers(userE);
							    message = "Cập nhật thành công!";
								RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
								request.setAttribute("msg", message );
								dispatcher.forward(request, response);
								
						 }
						else
						{
							 message = "Cập nhật không thành công!";
							 RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/nhanvien.jsp");
							 request.setAttribute("msg", message);
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
