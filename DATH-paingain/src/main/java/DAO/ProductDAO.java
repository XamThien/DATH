/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import database.Hibernate;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.PgCategories;
import model.PgProductPictures;
import model.PgProducts;
import model.PgSuppliers;
import model.PgUsers;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dangt
 */
public class ProductDAO {

    // phuong thức để hiển thị list sp trên trang client
    public List<PgProducts> getProductforHome() {
        List<PgProducts> productses = new ArrayList<>();
        Session session = Hibernate.getSessionFactory().openSession();
        session.beginTransaction();
        Criteria criteria = session.createCriteria(PgProducts.class)
                .addOrder(Order.desc("isNew"))
                .addOrder(Order.desc("isHot"))
                .setMaxResults(9);
        productses = criteria.list();
        return productses;
    }

    // phương thức do Huy viết để get sp theo thẻ loại
    @SuppressWarnings("unchecked")
    public List<PgProducts> getAllPgProducts(int CATEGORY_ID) {
        List<PgProducts> list = null;
        try {
            Configuration configuration = new Configuration().configure();
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();

            //Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            Transaction transaction = session.beginTransaction();
            String hql = "from PgProducts where CATEGORY_ID =" + CATEGORY_ID + " and productStatus=1";
            Query que = session.createQuery(hql);
            list = que.list();
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return list;
    }

    public PgProducts getPgProductsByID(int id) {
        Session session = Hibernate.getSessionFactory().openSession();
        session.beginTransaction();
        try {
            PgProducts product = (PgProducts) session.createCriteria(PgProducts.class)
                    .add(Restrictions.eq("productId", id))
                    .uniqueResult();
            return product;
        } catch (HibernateException e) {
            session.getTransaction().rollback();
        }
        return null;

    }

    public void insertPgProduct(PgProducts sp) {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session;
        if (sessionFactory.getCurrentSession() != null) {
            session = sessionFactory.getCurrentSession();
        } else {
            session = sessionFactory.openSession();
        }
        Transaction transaction = session.beginTransaction();
        session.save(sp);
        transaction.commit();
        session.close();
    }
     // phuong thuc get nhuwng sp khong co trong bang sale
    @SuppressWarnings("unchecked")
    public List<PgProducts> getPgProductsNotSale(int CATEGORY_ID) {
        List<PgProducts> list = null;
        try {
            Configuration configuration = new Configuration().configure();
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();

            //Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            Transaction transaction = session.beginTransaction();
            String hql = "from PgProducts p where p.pgCategories.categoryId =" + CATEGORY_ID + " and p.productStatus=1 and p not in (from PgProductSales where PRODUCT_ID = p.productId and salesStatus = 1)";
            Query que = session.createQuery(hql);
            list = que.list();
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return list;
    }
    public void updatePgProduct(PgProducts sp) {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session;
        if (sessionFactory.getCurrentSession() != null) {
            session = sessionFactory.getCurrentSession();
        } else {
            session = sessionFactory.openSession();
        }
        Transaction transaction = session.beginTransaction();
        session.update(sp);
        transaction.commit();
        session.close();
    }

    public static void main(String[] args) {
//		 try
//		 {
//			 Date Ngay = new Date();
//		     SimpleDateFormat datefrmat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		     String datestr = datefrmat.format(Ngay);
//		     Date now = datefrmat.parse(datestr);
//			
//		     
//		    PgCategories cate = new CategoryDAO().getCategory(1);
//		    
//		    PgSuppliers su = new PgSuppliersDAO().findByID(1);
//			PgProducts tl = new PgProducts(cate, su, "xax", 12, 12345, 12343, "", now, now, true, true);
//			new ProductDAO().insertPgProduct(tl);
//		 }
//		 catch(Exception e)
//		 {
//			 System.out.println(e);
//		 }
//		 PgSuppliers su = new PgSuppliersDAO().findByID(1);
//		 PgCategories cate = new CategoryDAO().getCategory(1);
//		 PgProducts tl = new ProductDAO().getPgProductsByID(3);
//		 System.out.println(tl.getProductName());
//		 tl.setProductName("Áo thun ngắn tay");
//		 tl.setPgSuppliers(su);
//		 tl.setPgCategories(cate);
//		 new ProductDAO().updatePgProduct(tl);
//		 PgProductPictures prpic = new ProductPictures().getPgProductPicturesByID(1);
// 		prpic.setPath("xxx");
// 		new ProductPictures().updatePgProductPictures(prpic);
// 		PgProductPictures prpic1 = new ProductPictures().getPgProductPicturesByID(1);
// 		System.out.println(prpic1.getPath());
    	PgProducts tll = new ProductDAO().getPgProductsByID(Integer.parseInt("1"));
		
		Integer productId = tll.getProductId();
		PgCategories pgCategories = tll.getPgCategories();
		PgSuppliers pgSuppliers = tll.getPgSuppliers();
		String productName = tll.getProductName();
		int quantity = tll.getQuantity();
		int unitPrice = tll.getUnitPrice();
		int unitOrder = tll.getUnitOrder();
		String description= tll.getDescription();
		int productStatus = tll.getProductStatus();
		Date createTime = tll.getCreateTime();
		Date modifiedTime = tll.getModifiedTime();
		 Boolean isNew = tll.getIsNew();
		 Boolean isHot = tll.getIsHot();
		 PgProducts tl = new PgProducts(productId,pgCategories,pgSuppliers,productName,quantity,unitPrice,unitOrder,description,productStatus,createTime,modifiedTime,isHot,isNew);
		tl.setProductStatus(0);
      new ProductDAO().updatePgProduct(tl);
    }
}
