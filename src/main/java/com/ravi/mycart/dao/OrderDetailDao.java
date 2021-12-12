package com.ravi.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ravi.mycart.modal.OrderDetail;
import com.ravi.mycart.modal.Product;

public class OrderDetailDao {
	
	private SessionFactory factory;

	public OrderDetailDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public void saveOrder(OrderDetail order) {
		int status=0;
		try {
			Session ses=this.factory.openSession();
			Transaction tx=ses.beginTransaction();
			
		   ses.save(order);
			tx.commit();
			System.out.println("Data inserted");
			ses.close();
			
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
				
	}
	
	//get All Order Details
		public List<OrderDetail> getAllOrderDetails(){
			Session ses=this.factory.openSession();
			
			String hql="from "+OrderDetail.class.getName();
			Query<OrderDetail> query=ses.createQuery(hql);
			List<OrderDetail> list=query.list();
			
			return list;
		}

}
