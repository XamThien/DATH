package DAO;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.PgSuppliers;
import util.HibernateUtils;

public class PgSuppliersDAO {

	@SuppressWarnings("unchecked")
	public List<PgSuppliers> getListSupplier(){
		List<PgSuppliers> list = null;
		try {
			Session session = HibernateUtils.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			String hql = "from PgSuppliers";
			Query que = session.createQuery(hql);
			list = que.list();
			transaction.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean insert(PgSuppliers u) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			Transaction tx = session.beginTransaction();
			session.save(u);
			tx.commit();
			return true;
		}catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}finally {
			if(session.isOpen()) {
				session.close();
			}			
		}
	}
	public void edit(PgSuppliers u) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			Transaction tx = session.beginTransaction();
			session.update(u);
			tx.commit();
		}catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			if(session.isOpen()) {
				session.close();
			}
		}
	}
	public void delete(PgSuppliers u) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			Transaction tx = session.beginTransaction();
			session.delete(u);
			tx.commit();
		}catch (HibernateException e) {
			e.printStackTrace();
		}finally {
			if(session.isOpen()) {
				session.close();
			}			
		}
	}
	public PgSuppliers findByID(int id) {
		PgSuppliers supplier = null;
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			Transaction tx = session.beginTransaction();
			supplier = (PgSuppliers)session.load(PgSuppliers.class, id);
			tx.commit();
		}catch (HibernateException e) {
			e.printStackTrace();
		}
		return supplier;
	}
}
