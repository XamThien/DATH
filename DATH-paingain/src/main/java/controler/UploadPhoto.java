package controler;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import DAO.LogDAO;
import DAO.ProductDAO;
import DAO.ProductPictures;
import model.PgLog;
import model.PgProductPictures;
import model.PgProducts;
import model.PgUsers;

/**
 * Servlet implementation class UploadPhoto
 */
@WebServlet("/uploadphoto")
public class UploadPhoto extends HttpServlet {
	private static final String UPLOAD_DIR = "images";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPhoto() {
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
	 public static boolean checkFolderExist(String fileName) {
	    	File file = new File(fileName);
	        return file.exists();
	    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		int spid = (int)session.getAttribute("spidx");
		HttpSession sesion = request.getSession();
		PgUsers u = (PgUsers) sesion.getAttribute("login");
		Date Ngay = new Date();
    	SimpleDateFormat datefrmats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String datestr = datefrmats.format(Ngay);
		switch(action)
		{
		case "add":
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
			
			PgProducts pr = new ProductDAO().getPgProductsByID(spid);
			int lastorderpic = new ProductPictures().getLastOrderIndex(spid);
			
	        if (!isMultipart) 
	        {
	        } 
	        else 
	        {
	            FileItemFactory factory = new DiskFileItemFactory();
	            ServletFileUpload upload = new ServletFileUpload(factory);
	            List items = null;
	            try 
	            {
	                items = upload.parseRequest(request);
	            } 
	            catch (FileUploadException e) 
	            {
	                 e.printStackTrace();
	            }
	            Iterator itr = items.iterator();
	          //applicationPath: C:\Users\Lonely\Documents\NetBeansProjects\Shop_Bonfire\build\web
	            String applicationPath = request.getServletContext().getRealPath("");
	          //File.separator: \ 
	            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
	            if(checkFolderExist(basePath)==false)
	            {
	            	File f=new File(basePath);
	    			f.mkdir();
	            }
	            boolean ckk = true;
	            String message="";
	            while (itr.hasNext()) 
	            {
	                FileItem item = (FileItem) itr.next();
	                if (item.isFormField()) 
	                {
	                } 
	                else 
	                {
	                    try 
	                    {
		                    String itemName = item.getName();
		                    File savedFile = new File(basePath+itemName);
		                    item.write(savedFile);
		                    
		                    lastorderpic= lastorderpic+1;
		                    PgProductPictures ppic = new PgProductPictures(pr,"/images/"+itemName,lastorderpic);
		                    ppic.setPictureType("2");
		                    new ProductPictures().insertPgProductPictures(ppic);
	                    } 
	                    catch (Exception e) 
	                    {
	                    	message = e.toString();
	                    	ckk=false;
	                    	break;
	                    }
	                }
	            }
	            
	            if(ckk)
	            {
	            	message = "Upload ảnh sản phẩm thành công.";
	            	try {
	            		Date now = datefrmats.parse(datestr);
	            		String ms = "Thêm ảnh cho sản phẩm "+pr.getProductName();
						 PgLog log = new PgLog(u,now,ms,"");
						 new LogDAO().insertPgLog(log);
					} catch (Exception e) {
						// TODO: handle exception
					}
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/uploadphoto.jsp?id="+spid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
	            }
	            else
	            {
	            	//message = "Upload ảnh sản phẩm thành công.";
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/uploadphoto.jsp?id="+spid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
	            }
	        }
		
			break;
		case "delete":
			String path = request.getParameter("path");
			int did = Integer.parseInt(request.getParameter("did"));
			try
			{
				PgProductPictures ppic = new ProductPictures().getPgProductPictures(did, path);
				ppic.setPictureStatus(0);
				new ProductPictures().updatePgProductPictures(ppic);
				Date now = datefrmats.parse(datestr);
				PgProducts s = ppic.getPgProducts();
				String ms = "Xóa ảnh của sản phẩm "+s.getProductName()+" có mã là "+ppic.getPictureSetId();
				 PgLog log = new PgLog(u,now,ms,"");
				 new LogDAO().insertPgLog(log);
				String message = "Xóa ảnh sản phẩm thành công.";
            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/uploadphoto.jsp?id="+spid);
				request.setAttribute("msg", message );
				xxx.forward(request, response);
			}
			catch(Exception e)
			{
				String message = "Xóa ảnh sản phẩm không thành công."+e;
            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/uploadphoto.jsp?id="+spid);
				request.setAttribute("msg", message );
				xxx.forward(request, response);
			}
			break;
		default:
				break;
		}
	}
}
