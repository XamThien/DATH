package DAO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
			        String hql ="from PgOrders where ORDER_STATUS_KEY="+stt+" order by orderId DESC";
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
		 Configuration configuration =  new Configuration().configure();
     	SessionFactory sessionFactory = configuration.buildSessionFactory();
     	Session session = sessionFactory.openSession();
		       try
		       {
		    	    
		        	
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
	 public PgOrders getPgOrdersByIDxx(int id) {
		 PgOrders cl = null;
		 Configuration configuration =  new Configuration().configure();
     	SessionFactory sessionFactory = configuration.buildSessionFactory();
     	Session session = sessionFactory.openSession();
		       try
		       {
		    	    
		        	
		        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			        Transaction transaction = session.beginTransaction();
			        String hql ="from PgOrders where orderId="+id;
			        Query que = session.createQuery(hql);
			        cl = (PgOrders) que.uniqueResult();
			        transaction.commit();
					session.close();
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
			 /*PgOrders or = new PgOrdersDAO().getPgOrdersByID(3);
			 System.out.println(or.getOrderStatus());
			 or.setOrderStatus(3);*/
			 Date Ngay = new Date();
	        	SimpleDateFormat datefrmats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        	String datestr = datefrmats.format(Ngay);
			    
				Date now;
				try {
					now = datefrmats.parse(datestr);
					PgOrders ors = new PgOrders(1,new OrderStatusDAO().getPgOrderStatusByID(0),new UserDAO().getPgUsersByID(2),now,"Anh khánh","102 Trường CHinh","01662108386");
					 new PgOrdersDAO().updatePgOrders(ors);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 
//			 PgOrders orr = new PgOrdersDAO().getPgOrdersByID(3);
//			 System.out.println(orr.getOrderStatus());
		}
}
