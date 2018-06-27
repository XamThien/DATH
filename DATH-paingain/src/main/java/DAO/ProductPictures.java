package DAO;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
	public PgProductPictures getPgProductPicturesByIDxx(int id) {
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
		        cl =  (PgProductPictures)que.list().get(0);
		        transaction.commit();
		        session.close();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }
	public PgProductPictures getPgProductPictures(int id,String path) {
		PgProductPictures cl = null;
	       try
	       {
	    	    Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
	        	
	        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgProductPictures where PRODUCT_ID="+id+" and path='"+path+"'";
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
	public List<String> getLstPhoto(int prid)
	{
		
		List<String> lstpath = null;
    	
    	try {
            Configuration configuration = new Configuration().configure();
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();

            //Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            Transaction transaction = session.beginTransaction();
            String hql = " select pp.path from PgProductPictures pp where pp.pgProducts.productId="+prid+" and pp.pictureStatus=1";
            Query que = session.createQuery(hql);
            lstpath = que.list();
            transaction.commit();
            session.close();
            
           
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    	return lstpath;
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
//	 PgCategories cate = new CategoryDAO().getCategory(1);
//	    //anh===============================
//	    //ncc 
//	 PgProducts pr = new ProductDAO().getPgProductsByID(1);
//	 int lastorderpic = new ProductPictures().getLastOrderIndex(1);
//	 System.out.println(pr);
//	 System.out.println(lastorderpic);
//	 lastorderpic= lastorderpic+1;
//	 PgProductPictures ppic = new PgProductPictures(pr,"/images/"+"xxx",lastorderpic);
////	 System.out.println(ppic.getPgProducts());
////	 System.out.println(ppic.getPath());
////	 System.out.println(ppic.getOrderIndex());
//     new ProductPictures().insertPgProductPictures(ppic);
	 PgProductPictures pic = new ProductPictures().getPgProductPictures(1, "/images/20171110_102506.JPG");
	 System.out.println(pic.getPath());
	 pic.setPictureStatus(0);
	 new  ProductPictures().updatePgProductPictures(pic);
}
}
