package com.ravi.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ravi.mycart.helper.FactoryProvider;
import com.ravi.mycart.modal.Category;

public class CategoryDao {
	
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public int saveCategory(Category cat) {
		int catId=0;
		try {
			Session ses=this.factory.openSession();
			Transaction tx=ses.beginTransaction();
			
		    catId=(int)ses.save(cat);
			tx.commit();
			
			ses.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return catId;
		
	}
	
	public List<Category> getCategories()
	{
		Session ses=this.factory.openSession();
		Query query=ses.createQuery("from Category");
		List<Category> list=query.list();
		return list;
	}
	
	public Category getCategoryById(int cid) {
		Category category=null;
		try {
			Session ses=FactoryProvider.getFactory().openSession();
			category=ses.get(Category.class, cid);
			ses.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return category;
	}

}
