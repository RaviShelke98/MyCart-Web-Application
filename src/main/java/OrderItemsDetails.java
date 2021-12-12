
public class OrderItemsDetails {
	
	String userName, userEmail, userMobile, userShippinAddr, prices, orderId;

	
	
	public OrderItemsDetails() {
		super();
	}

	public OrderItemsDetails(String userName, String userEmail, String userMobile, String userShippinAddr,
			String prices, String orderId) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userMobile = userMobile;
		this.userShippinAddr = userShippinAddr;
		this.prices = prices;
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

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getUserShippinAddr() {
		return userShippinAddr;
	}

	public void setUserShippinAddr(String userShippinAddr) {
		this.userShippinAddr = userShippinAddr;
	}

	public String getPrices() {
		return prices;
	}

	public void setPrices(String prices) {
		this.prices = prices;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	

}
