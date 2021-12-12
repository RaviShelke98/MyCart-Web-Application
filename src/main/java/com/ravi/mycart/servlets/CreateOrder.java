package com.ravi.mycart.servlets;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.ravi.mycart.dao.OrderDetailDao;
import com.ravi.mycart.helper.FactoryProvider;
import com.ravi.mycart.modal.OrderDetail;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

public class CreateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8"); 
		
	    StringBuilder sb = new StringBuilder();
	    BufferedReader br = request.getReader();
	    String str;
	    while( (str = br.readLine()) != null ){
	        sb.append(str);
	    }    
	    
	    
	    
		System.out.println("Called createOrder... ");
		//JSONObject jsonObject=new JSONObject(request.getParameter("price"));
		//System.out.println(request.getParameter("price"));
		//int price=Integer.parseInt(request.getParameter("price"));
		
	//	System.out.println("your Price:"+price);
		
		
		
		try {
			
			JSONObject jObj = new JSONObject(sb.toString());
		    String extracted=jObj.getString("price").toString();
		    
		    String uname=(String)jObj.get("uname");
		    String uEmail=(String)jObj.get("uemail");
		    String uMobile=(String)jObj.get("umo");
		    String uShippingAddr=(String)jObj.get("uaddr");
		    
		    System.out.println(uname+" , "+uEmail+" , "+uMobile+" , ");

		    long money=Long.parseLong(jObj.getString("price"));
		    System.out.println("Your price is:"+money);
		    
		    int price=Integer.parseInt(extracted);
			
			var razorpayClient=new RazorpayClient("rzp_test_Ef7CdBS83L4yE0", "lsjw6jGUgJBgzKY7Di5VJoQW");
			
			JSONObject options = new JSONObject();
			options.put("amount", price*100);
			options.put("currency", "INR");
			options.put("receipt", "txn_123456");
			
			//creating a order
			Order order = razorpayClient.Orders.create(options);
			JSONObject jsonObject=new JSONObject(order.toString());
			
			String purchase=price+"";
			//Get the order Id
			String orderId=(String)jsonObject.get("id");
			System.out.println(orderId);
			
			response.getWriter().write(order.toString());
			
			
			//you save the database information  database
			
			OrderDetail orderDetail=new OrderDetail(uname, uEmail, uMobile, uShippingAddr, purchase, orderId);
			System.out.println("-------------------------------------------------------------");
			OrderDetailDao Odao=new OrderDetailDao(FactoryProvider.getFactory());
			Odao.saveOrder(orderDetail);
			System.out.println("Order Inserted..");
			
			
			System.out.println("your data successfully save==>order");
			
		} catch (RazorpayException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
