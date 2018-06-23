package controler;
import DAO.*;
import model.*;

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
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;


/**
 * Servlet implementation class Product
 */
@WebServlet("/product")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class Product extends HttpServlet {
	private static final String UPLOAD_DIR = "images";
	private static final long serialVersionUID = 1L;

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
	private String uploadFile(HttpServletRequest request,String name) throws IOException, ServletException {
        String fileName = "";
        try {
            Part filePart = request.getPart(name);

            //fileName: picture-001.jpg
            fileName = (String) getFileName(filePart);

            //applicationPath: C:\Users\Lonely\Documents\NetBeansProjects\Shop_Bonfire\build\web
            String applicationPath = request.getServletContext().getRealPath("");

            //File.separator: \ 
            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
            if(checkFolderExist(basePath)==false)
            {
            	File f=new File(basePath);
    			f.mkdir();
            }

            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
            	
                File outputFilePath = new File(basePath + fileName);
                fileName = "/images/"+fileName;
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                e.printStackTrace();
                fileName = null;
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }
        } catch (Exception e) {
            fileName = null;
        }
        return fileName;
    }

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("*****partHeader :" + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
    	HttpSession session = request.getSession();
    	int cateid = (int)session.getAttribute("cateid");
    	
		String action = request.getParameter("action");
		String message ="";
		switch(action)
		{
		case "delete":
			try
			{
				String id = request.getParameter("did");
				
				
				PgProducts tll = new ProductDAO().getPgProductsByID(Integer.parseInt(id));
						
				
				tll.setProductStatus(0);
	            
	            try
	            {
	            	new ProductDAO().updatePgProduct(tll);
	            	
	            	message = "Xóa sản phẩm thành công.";
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
	            	
	            }
	            catch(Exception e)
				{
	            	message = "Xóa sản phẩm không thành công .";
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
				}
			}
			catch(Exception e)
			{
				message = "Xóa sản phẩm không thành công .";
            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
				request.setAttribute("msg", message );
				xxx.forward(request, response);
			}
			
			break;
		case "edit":
			try
			{
				int id = Integer.parseInt(request.getParameter("eid"));
				String ten = request.getParameter("eten");
				int categoryid = Integer.parseInt(request.getParameter("edanhmuc"));
				int nccid = Integer.parseInt(request.getParameter("encc"));
				int sl = Integer.parseInt(request.getParameter("esoluong"));
				int gianhap = Integer.parseInt(request.getParameter("egianhap"));
				int giaban = Integer.parseInt(request.getParameter("egiaban"));
				boolean ishot = Boolean.parseBoolean((request.getParameter("ehot")==null || !request.getParameter("ehot").equals("true"))?"false":"true");
				boolean isnew = Boolean.parseBoolean((request.getParameter("enew")==null || !request.getParameter("enew").equals("true"))?"false":"true");
				String mota = request.getParameter("emota");
				
				 Date Ngay = new Date();
			     SimpleDateFormat datefrmat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			     String datestr = datefrmat.format(Ngay);
			     Date now = datefrmat.parse(datestr);
				
			     
			    PgCategories cate = new CategoryDAO().getCategory(categoryid);
			    //anh===============================
			    //ncc 
			    PgSuppliers su = new PgSuppliersDAO().findByID(nccid);
				PgProducts tl = new ProductDAO().getPgProductsByID(id);//new PgProducts(cate, su, ten, sl, giaban, gianhap, mota, now, now, ishot, isnew);
				tl.setPgCategories(cate);
				tl.setPgSuppliers(su);
				tl.setProductName(ten);
				tl.setQuantity(sl);
				tl.setUnitPrice(giaban);
				tl.setUnitOrder(gianhap);
				tl.setDescription(mota);
				tl.setModifiedTime(now);
				tl.setIsHot(ishot);
				tl.setIsNew(isnew);
	            try
	            {
	            	new ProductDAO().updatePgProduct(tl);
	            	
	            	String img_photo = uploadFile(request,"ephoto");
	            	if(img_photo== null || img_photo.equals(""))
	            	{
	            		
	            	}
	            	else
	            	{
	            		PgProductPictures prpic = new ProductPictures().getPgProductPicturesByID(id);
	            		prpic.setPath(request.getContextPath()+img_photo);
	            		new ProductPictures().updatePgProductPictures(prpic);
	            	}
	            	
	            	
	            	message = "Sửa thông tin sản phẩm thành công.";
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
	            	
	            }
	            catch(Exception e)
				{
	            	message = "Sửa thông tin sản phẩm không thành công.1";
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
				}
			}
			catch(Exception e)
			{
				message = "Sửa thông tin sản phẩm không thành công.2"+e;
	        	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
				request.setAttribute("msg", message );
				xxx.forward(request, response);
			}
			break;
		case "add":
			try
			{
				String ten = request.getParameter("ten");
				int categoryid = Integer.parseInt(request.getParameter("danhmuc"));
				int nccid = Integer.parseInt(request.getParameter("ncc"));
				int sl = Integer.parseInt(request.getParameter("soluong"));
				int gianhap = Integer.parseInt(request.getParameter("gianhap"));
				int giaban = Integer.parseInt(request.getParameter("giaban"));
				boolean ishot = Boolean.parseBoolean((request.getParameter("hot")==null || !request.getParameter("hot").equals("true"))?"false":"true");
				boolean isnew = Boolean.parseBoolean((request.getParameter("new")==null || !request.getParameter("new").equals("true"))?"false":"true");
				String mota = request.getParameter("mota");
				
				 Date Ngay = new Date();
			     SimpleDateFormat datefrmat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			     String datestr = datefrmat.format(Ngay);
			     Date now = datefrmat.parse(datestr);
				
			     
			    PgCategories cate = new CategoryDAO().getCategory(categoryid);
			    //anh===============================
			    //ncc 
			    PgSuppliers su = new PgSuppliersDAO().findByID(nccid);
				PgProducts tl = new PgProducts(cate, su, ten, sl, giaban, gianhap, mota, now, now, ishot, isnew);
				
	            try
	            {
	            	new ProductDAO().insertPgProduct(tl);
	            	PgProductPictures prpic = new PgProductPictures(tl,request.getContextPath()+uploadFile(request,"photo"),1); 
	            	new ProductPictures().insertPgProductPictures(prpic);
	            	message = "Thêm sản phẩm thành công.";
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
	            	
	            }
	            catch(Exception e)
				{
	            	message = "Thêm sản phẩm không thành công.1";
	            	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
					request.setAttribute("msg", message );
					xxx.forward(request, response);
				}
			}
			catch(Exception e)
			{
				message = "Thêm sản phẩm không thành công.2";
	        	RequestDispatcher xxx = request.getRequestDispatcher(request.getContextPath()+"/manager/sanpham.jsp?id="+cateid);
				request.setAttribute("msg", message );
				xxx.forward(request, response);
			}
			break;
		default:
			break;
		}
	}

}
