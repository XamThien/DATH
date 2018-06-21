package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.PgProducts;

public class ProductSales {
	
	@SuppressWarnings("unchecked")
	public  List<ProductSales> getAllPgProducts(){
		 List<ProductSales> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
	        	
	        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgProducts where salesStatus=1";
		        Query que = session.createQuery(hql);
		        list = que.list();
		        transaction.commit();
		        session.close();
	        }
	        catch  (HibernateException e) {
	        	 e.printStackTrace();
	        }
	        return list;
	}
	public ProductSales getProductSalesByID(int id) {
		ProductSales cl = null;
	       try
	       {
	    	    Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
	        	
	        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgProductSales where saleId="+id;
		        Query que = session.createQuery(hql);
		        cl = (ProductSales) que.uniqueResult();
		        transaction.commit();
		        session.close();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }
	public void insertPgProduct(ProductSales sp){
	 	Configuration configuration =  new Configuration().configure();
	 	SessionFactory sessionFactory = configuration.buildSessionFactory();
	 	Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(sp);
        transaction.commit();
        session.close();
    }

 public void updatePgProduct(ProductSales sp){
	 	Configuration configuration =  new Configuration().configure();
     	SessionFactory sessionFactory = configuration.buildSessionFactory();
     	Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(sp);
        transaction.commit();
        session.close();
    }
}
