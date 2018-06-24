package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.PgOrders;
import util.HibernateUtils;


public class PgOrdersDAO {
	 @SuppressWarnings("unchecked")
		public  List<PgOrders> getAllPgOrders(int stt){
			 List<PgOrders> list=null;
		        try
		        {
		        	Configuration configuration =  new Configuration().configure();
		        	SessionFactory sessionFactory = configuration.buildSessionFactory();
		        	Session session = sessionFactory.openSession();
		        	
		        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			        Transaction transaction = session.beginTransaction();
			        String hql ="from PgOrders where orderStatus="+stt+" order by orderId DESC";
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
		        	Session session = sessionFactory.openSession();
		        	
		        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			        Transaction transaction = session.beginTransaction();
			        String hql ="from PgOrders where orderId="+id;
			        Query que = session.createQuery(hql);
			        cl = (PgOrders) que.uniqueResult();
			        transaction.commit();
					//session.close();
		       }
		       catch  (HibernateException e) {
		    	   e.printStackTrace();
		        }
		        return cl;
		    }
		 
		 public void insertPgOrders(PgOrders sp){
			 	Configuration configuration =  new Configuration().configure();
			 	SessionFactory sessionFactory = configuration.buildSessionFactory();
			 	Session session = sessionFactory.openSession();
		        Transaction transaction = session.beginTransaction();
		        session.save(sp);
		        transaction.commit();
		        session.close();
		    }
		
		 public void updatePgOrders(PgOrders sp){
			 Session session = HibernateUtils.getSessionFactory().openSession();
				try {
					Transaction tx = session.beginTransaction();
					session.update(sp);
					tx.commit();
				}catch (HibernateException e) {
					e.printStackTrace();
				} finally {
					if(session.isOpen()) {
						session.close();
					}
				}
		    }
		 public static void main(String[] args) {
			 PgOrders or = new PgOrdersDAO().getPgOrdersByID(3);
			 System.out.println(or.getOrderStatus());
			 or.setOrderStatus(3);
			 new PgOrdersDAO().updatePgOrders(or);
//			 PgOrders orr = new PgOrdersDAO().getPgOrdersByID(3);
//			 System.out.println(orr.getOrderStatus());
		}
}
