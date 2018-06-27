package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import model.PgUsers;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
        String password = request.getParameter("pass");
        UserDAO nvacess = new UserDAO();
        PgUsers nv;
        try
        {
        	nv = nvacess.getPgUsersByName(username);
        	if(nv == null)
        	{
        		String message = "Không tồn tại tài khoản.";
    			RequestDispatcher xxx = request.getRequestDispatcher("login.jsp");
    			request.setAttribute("msg", message );
    			xxx.forward(request, response);
        	}
        	else
        	{
        		if(nv.getUserPassword().equals(password))
        		{
        			HttpSession session = request.getSession();
                    session.setAttribute("login", nv);
                    if(nv.getPgRoles().getRoleId()==1 || nv.getPgRoles().getRoleId() == 2) {
                    	response.sendRedirect(request.getContextPath()+"/manager/home");
                    } else {
        				request.getRequestDispatcher("/site/layouts/accessdenied.jsp").forward(request, response);
                    }
        		}
        		else
        		{
        			String message = "Sai password.";
        			RequestDispatcher xxx = request.getRequestDispatcher("login.jsp");
        			request.setAttribute("msg", message );
        			xxx.forward(request, response);
        		}
        	}
        }
        catch(Exception e) {
        	String message = "Không thể đăng nhập.";
			RequestDispatcher xxx = request.getRequestDispatcher("login.jsp");
			request.setAttribute("msg", message );
			xxx.forward(request, response);
		}
        
//        if(username.equals("admin") && password.equals("admin"))
//        {
//        	HttpSession session = request.getSession();
//            session.setAttribute("login", "");
//          
//            response.sendRedirect("index.jsp");
//        }
	}

}
