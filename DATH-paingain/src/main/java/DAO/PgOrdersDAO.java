package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.PgOrders;
import model.PgProducts;

public class PgOrdersDAO {
	 @SuppressWarnings("unchecked")
		public  List<PgOrders> getAllPgOrders(){
			 List<PgOrders> list=null;
		        try
		        {
		        	Configuration configuration =  new Configuration().configure();
		        	SessionFactory sessionFactory = configuration.buildSessionFactory();
		        	Session session = sessionFactory.openSession();
		        	
		        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			        Transaction transaction = session.beginTransaction();
			        String hql ="from PgOrders order by orderId DESC";
			        Query que = session.createQuery(hql);
			        list = que.list();
			        transaction.commit();
			        
		        }
		        catch  (HibernateException e) {
		        	 e.printStackTrace();
		        }
		        return list;
		}
	 public PgOrders getPgOrdersByID(int id) {
		 PgOrders cl = null;
		       try
		       {
		    	    Configuration configuration =  new Configuration().configure();
		        	SessionFactory sessionFactory = configuration.buildSessionFactory();
		        	Session session ;
				 	if(sessionFactory.getCurrentSession() != null)
				 	{
				 		session = sessionFactory.getCurrentSession();
				 	}
				 	else
				 	{
				 		session = sessionFactory.openSession();
				 	}
		        	
		        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			        Transaction transaction = session.beginTransaction();
			        String hql ="from PgOrders where orderId="+id;
			        Query que = session.createQuery(hql);
			        cl = (PgOrders) que.uniqueResult();
			        transaction.commit();

		       }
		       catch  (HibernateException e) {
		    	   e.printStackTrace();
		        }
		        return cl;
		    }
		 
		 public void insertPgOrders(PgOrders sp){
			 	Configuration configuration =  new Configuration().configure();
			 	SessionFactory sessionFactory = configuration.buildSessionFactory();
			 	Session session ;
			 	if(sessionFactory.getCurrentSession() != null)
			 	{
			 		session = sessionFactory.getCurrentSession();
			 	}
			 	else
			 	{
			 		session = sessionFactory.openSession();
			 	}
		        Transaction transaction = session.beginTransaction();
		        session.save(sp);
		        transaction.commit();
		        //session.close();
		    }
		
		 public void updatePgOrders(PgOrders sp){
			 	Configuration configuration =  new Configuration().configure();
		     	SessionFactory sessionFactory = configuration.buildSessionFactory();
		     	Session session ;
			 	if(sessionFactory.getCurrentSession() != null)
			 	{
			 		session = sessionFactory.getCurrentSession();
			 	}
			 	else
			 	{
			 		session = sessionFactory.openSession();
			 	}
		        Transaction transaction = session.beginTransaction();
		        session.update(sp);
		        transaction.commit();
		        //session.close();
		    }
}
