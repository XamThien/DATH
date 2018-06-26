package DAO;


import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.PgProductPictures;

public class ProductPictures {
	
	public PgProductPictures getPgProductPicturesByID(int id) {
		PgProductPictures cl = null;
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
		        String hql ="from PgProductPictures where PRODUCT_ID="+id;
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
	public void insertPgProductPictures(PgProductPictures sp){
	 	Configuration configuration =  new Configuration().configure();
	 	SessionFactory sessionFactory = configuration.buildSessionFactory();
	 	Session session ;
	 	if(sessionFactory.getCurrentSession().isOpen())
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
       session.close();
    }

 public void updatePgProductPictures(PgProductPictures sp){
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
       session.close();
    }
 public static void main(String[] args) {

	 PgProductPictures prpic = new ProductPictures().getPgProductPicturesByID(1);
		prpic.setPath("");
		new ProductPictures().updatePgProductPictures(prpic);
	 
}
}
