package com.ravi.mycart.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="order_item_details")
public class OrderDetail {
	@Id
	String orderId;
	String userName;
	String userEmail;
	
	@Column(name="mobile_no")
	String userMobileNumber;
	@Column(name="shipping_addr")
	String userShippingAddr;
	@Column(name="items_price")
	String userItemsPrice;
	

	public OrderDetail() {
		super();
	}

	public OrderDetail(String userName, String userEmail, String userMobileNumber, String userShippingAddr,
			String userItemsPrice, String orderId) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userMobileNumber = userMobileNumber;
		this.userShippingAddr = userShippingAddr;
		this.userItemsPrice = userItemsPrice;
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserMobileNumber() {
		return userMobileNumber;
	}

	public void setUserMobileNumber(String userMobileNumber) {
		this.userMobileNumber = userMobileNumber;
	}

	public String getUserShippingAddr() {
		return userShippingAddr;
	}

	public void setUserShippingAddr(String userShippingAddr) {
		this.userShippingAddr = userShippingAddr;
	}

	public String getUserItemsPrice() {
		return userItemsPrice;
	}

	public void setUserItemsPrice(String userItemsPrice) {
		this.userItemsPrice = userItemsPrice;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	

}
