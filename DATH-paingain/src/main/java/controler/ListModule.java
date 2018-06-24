package controler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ModuleDAO;
import model.PgModules;

public class ListModule extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public ListModule(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<PgModules> result = new ArrayList<PgModules>();
		try
		{
			result = new ModuleDAO().getAllPgModules();
			request.setAttribute("result", result);
			request.getRequestDispatcher("/manager/module.jsp").forward(request, response);
		}
		catch (Exception e)
		{
			response.getWriter().print("Loi: "+ e.getMessage());
		}
	}
}
