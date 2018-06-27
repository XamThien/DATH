package DAO;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.PgCategories;
import model.PgProductPictures;
import model.PgProducts;
import model.PgSuppliers;

public class ProductPictures {
	
	public PgProductPictures getPgProductPicturesByID(int id) {
		PgProductPictures cl = null;
	       try
	       {
	    	    Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
	        	
	        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgProductPictures where PRODUCT_ID="+id+" and orderIndex=1";
		        Query que = session.createQuery(hql);
		        cl = (PgProductPictures) que.uniqueResult();
		        transaction.commit();
		        session.close();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }
	public int getLastOrderIndex(int prid)
	{
		PgProductPictures pr = null;
    	
    	try {
            Configuration configuration = new Configuration().configure();
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();

            //Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            Transaction transaction = session.beginTransaction();
            String hql = "from PgProductPictures where PRODUCT_ID="+prid +" order by orderIndex DESC";
            Query que = session.createQuery(hql);
            pr = (PgProductPictures)que.list().get(0);
            transaction.commit();
            session.close();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    	return pr.getOrderIndex();
	}
	public void insertPgProductPictures(PgProductPictures sp){
	 	Configuration configuration =  new Configuration().configure();
	 	SessionFactory sessionFactory = configuration.buildSessionFactory();
	 	Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(sp);
        transaction.commit();
       //session.close();
    }

 public void updatePgProductPictures(PgProductPictures sp){
	 	Configuration configuration =  new Configuration().configure();
     	SessionFactory sessionFactory = configuration.buildSessionFactory();
     	Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(sp);
        transaction.commit();
       //session.close();
    }
 public static void main(String[] args) throws ParseException {

//	 PgProductPictures prpic = new ProductPictures().getPgProductPicturesByID(1);
//		prpic.setPath("xxx");
//		new ProductPictures().updatePgProductPictures(prpic);
//	 System.out.println(prpic.getPath());
	 PgCategories cate = new CategoryDAO().getCategory(1);
	    //anh===============================
	    //ncc 
	 Date Ngay = new Date();
     SimpleDateFormat datefrmat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     String datestr = datefrmat.format(Ngay);
     Date now = datefrmat.parse(datestr);
	    PgSuppliers su = new PgSuppliersDAO().findByID(1);
		PgProducts tl = new PgProducts(cate, su, "ccc", 12, 12345, 12345, "", now, now, true, false);
		new ProductDAO().insertPgProduct(tl);
	 
 	PgProductPictures prpic = new PgProductPictures(tl,"ssdvsdv",1); 
 	new ProductPictures().insertPgProductPictures(prpic);
}
}
