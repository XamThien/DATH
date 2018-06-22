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
	 
	 @SuppressWarnings("unchecked")
	    public String getLastPkey() throws Exception {
    	    Configuration configuration =  new Configuration().configure();
        	SessionFactory sessionFactory = configuration.buildSessionFactory();
        	Session session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
			 List<PgUsers> list=null;
			 String value = null;
		        try
		        {
		        	 String hql = "from PgUsers order by userId DESC";
		        	 Query query = session.createQuery(hql);
		             list = query.list();
		             if(list.isEmpty() || list == null) {
		            	 value = "";
		             }else {
		            	 value = list.get(0).getUserId().toString();
		             }
			        transaction.commit();
		        }
		        catch  (HibernateException e) {
		        	 e.printStackTrace();
		        }
	        return value;
	    }
	 
	 public boolean insertPgUsers(PgUsers sp){
		 	Configuration configuration =  new Configuration().configure();
		 	SessionFactory sessionFactory = configuration.buildSessionFactory();
		 	Session session = sessionFactory.openSession();
		 	try {
		        Transaction transaction = session.beginTransaction();
		        session.save(sp);
		        transaction.commit();
		        return true;
		 	} catch(HibernateException e) {
		 		e.printStackTrace();
		 		return false;
		 	} finally {
		        session.close();
			}
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
