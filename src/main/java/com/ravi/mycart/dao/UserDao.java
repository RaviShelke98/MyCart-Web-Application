package com.ravi.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.ravi.mycart.modal.User;

public class UserDao {
	
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	//Get user by email and password
	public User getUserByEmailAndPassword(String email, String password)
	{
		User user=null;
		try {
			String hql="from "+User.class.getName()+" where userEmail=:e and userPassword=:p";
			Session ses= this.factory.openSession();
			Query query=ses.createQuery(hql);
			query.setParameter("e",email);
			query.setParameter("p", password);
			
		    user=(User)query.uniqueResult();
			
			ses.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return user;
	}
	
	//Get the All Details of Users
	public List<User> getAllData(){
		List<User> list=null;
		try {
			Session ses=this.factory.openSession();
			Query query=ses.createQuery("from "+User.class.getName());
			list=query.getResultList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
