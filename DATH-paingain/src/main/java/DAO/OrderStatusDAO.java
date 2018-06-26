package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.PgCategories;
import model.PgOrderStatus;
import util.HibernateUtils;

public class OrderStatusDAO {
	@SuppressWarnings("unchecked")
	public  List<PgOrderStatus> getAllPgOrderStatus(){
		 List<PgOrderStatus> list=null;
	        try
	        {
	        	Session session = HibernateUtils.getSessionFactory().openSession();
				Transaction transaction = session.beginTransaction();
				 String hql ="from PgOrderStatus";
		        Query que = session.createQuery(hql);
		        list = que.list();
		        transaction.commit();
	        }
	        catch  (HibernateException e) {
	        	 e.printStackTrace();
	        }
	        return list;
	}
	public PgOrderStatus getPgOrderStatusByID(int id) {
		PgOrderStatus cl = null;
	       try
	       {
	    	   Session session = HibernateUtils.getSessionFactory().openSession();
				Transaction transaction = session.beginTransaction();
				String hql ="from PgOrderStatus where orderStatusKey="+id;
		        Query que = session.createQuery(hql);
		        cl = (PgOrderStatus) que.uniqueResult();
		        transaction.commit();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }
}
