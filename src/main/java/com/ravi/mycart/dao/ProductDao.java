package com.ravi.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ravi.mycart.modal.Product;

public class ProductDao {
	
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product) {
		boolean flag=false;
		try {
			
			Session ses=this.factory.openSession();
			Transaction tx=ses.beginTransaction();
			
			ses.save(product);
			
			tx.commit();
			flag=true;
			System.out.println("Product Added..");
			ses.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
		}
		
		return flag;
	}
	
	//get All Product of given id
		public List<Product> getAllProductById(int cid){
			Session ses=this.factory.openSession();
			
			String hql="from "+Product.class.getName()+" as p where p.category.categoryId=:id";
			Query<Product> query=ses.createQuery(hql);
			query.setParameter("id", cid);
			List<Product> list=query.list();
			
			return list;
		}
	
	//get All Product
	public List<Product> getAllProduct(){
		Session ses=this.factory.openSession();
		
		String hql="from "+Product.class.getName();
		Query<Product> query=ses.createQuery(hql);
		List<Product> list=query.list();
		
		return list;
	}

}
