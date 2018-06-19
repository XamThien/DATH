package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


import model.PgUsers;

public class UserDAO {
	@SuppressWarnings("unchecked")
	public  List<PgUsers> getAllPgUsers(){
		 List<PgUsers> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
	        	
	        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgUsers where userStatus=1";
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
	 public PgUsers getPgUsersByName(String name) {
		 PgUsers cl = null;
	       try
	       {
	    	    Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
	        	
	        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgUsers where USER_ID='"+name+"'";
		        Query que = session.createQuery(hql);
		        cl = (PgUsers) que.uniqueResult();
		        transaction.commit();
		        session.close();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }
	 public PgUsers getPgUsersByID(int id) {
		 PgUsers cl = null;
	       try
	       {
	    	    Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
	        	
	        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgUsers where recordId="+id;
		        Query que = session.createQuery(hql);
		        cl = (PgUsers) que.uniqueResult();
		        transaction.commit();
		        session.close();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }
	 
	 public void insertPgUsers(PgUsers sp){
		 	Configuration configuration =  new Configuration().configure();
		 	SessionFactory sessionFactory = configuration.buildSessionFactory();
		 	Session session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
	        session.save(sp);
	        transaction.commit();
	        session.close();
	    }
	
	 public void updatePgUsers(PgUsers sp){
		 	Configuration configuration =  new Configuration().configure();
	     	SessionFactory sessionFactory = configuration.buildSessionFactory();
	     	Session session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
	        session.update(sp);
	        transaction.commit();
	        session.close();
	    }
	 
	 public static void main(String[] args) {

//		 List<PgUsers> lst = new UserDAO().getAllPgUsers();
//		 for(PgUsers us : lst)
//		 {
//			 System.out.println(us.getFirstName());
//		 }
		 PgUsers nv = new UserDAO().getPgUsersByName("admin");
		 System.out.println(nv.getUserPassword());
		 
		 
	}
}
