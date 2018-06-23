package controler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.RoleDAO;
import model.PgRoles;

public class ListRole extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public ListRole(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<PgRoles> result = new ArrayList<PgRoles>();
		try
		{
			result = new RoleDAO().getAllPgRoles();
			request.setAttribute("result", result);
			request.getRequestDispatcher("/manager/phanquyen.jsp").forward(request, response);
		}
		catch (Exception e)
		{
			response.getWriter().print("Loi: "+ e.getMessage());
		}
	}

}
