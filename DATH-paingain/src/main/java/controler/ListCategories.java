package controler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PgCategories;
import DAO.CategoryDAO;

public class ListCategories  extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ListCategories(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<PgCategories> result = new ArrayList<PgCategories>();
		try
		{
			result = new CategoryDAO().getAllPgCategories();
			request.setAttribute("result", result);
			request.getRequestDispatcher("/manager/danhmuc.jsp").forward(request, response);
		}
		catch (Exception e)
		{
			response.getWriter().print("Loi: "+ e.getMessage());
		}
	}
}
