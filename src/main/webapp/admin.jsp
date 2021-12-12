<%@page import="com.ravi.mycart.modal.OrderDetail"%>
<%@page import="com.ravi.mycart.dao.OrderDetailDao"%>
<%@page import="com.ravi.mycart.modal.Product"%>
<%@page import="com.ravi.mycart.dao.ProductDao"%>
<%@page import="com.ravi.mycart.dao.UserDao"%>
<%@page import="com.ravi.mycart.modal.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ravi.mycart.helper.FactoryProvider"%>
<%@page import="com.ravi.mycart.dao.CategoryDao"%>
<%@page import="com.ravi.mycart.modal.User"%>
<%
   User user=(User)session.getAttribute("current_user");
   if(user==null){
	    HttpSession  httpSession=request.getSession();
    	httpSession.setAttribute("message", "Yor are not Logged in!!..Please Login!");
		httpSession.setAttribute("msgStatus", "error");
		response.sendRedirect("login.jsp");
		return; 
   }else{
	   if(user.getUserType().equals("normal")){
		    HttpSession  httpSession=request.getSession();
	    	httpSession.setAttribute("message", "Access Denied ! Your are not Admin");
			httpSession.setAttribute("msgStatus", "error");
			response.sendRedirect("login.jsp");
			return;  
		   
	   }
   }
%>

<!-- product Categories select -->

<%
    UserDao userDao=new UserDao(FactoryProvider.getFactory());
    List<User> userList=userDao.getAllData();
    int userSize=userList.size();
    
	CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
	List<Category> list = categoryDao.getCategories();
	int catSize=list.size();
	
	ProductDao productDao=new ProductDao(FactoryProvider.getFactory());
	List<Product> plist=productDao.getAllProduct();
	int prodSize=plist.size();
	
	OrderDetailDao orderDao=new OrderDetailDao(FactoryProvider.getFactory());
	List<OrderDetail> orderList=orderDao.getAllOrderDetails();
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Login</title>

<%@ include file="comm-css-javascript.jsp"%>

</head>
<body>
	<%@ include file="navbar.jsp"%>
	<h2 class="text-center mt-4 admin-head-css">Administration Panel</h2>
				
	<div class="container admin">
	
	<!-- Show message -->
	<div class="row container text-center">
	   <!-- Success message -->
		<div class="col-md-12 text-center">
			<%@ include file="message.jsp"%>

		</div>
	
	</div>
	
		<!-- First row -->
		<div class="row mt-3 m-1">
			<!-- First row of first Column -->
			<div class="col-md-4 mt-2">
				<div class="border border-primary text-center shadow hover-card ">
					<div class="container">
						<img alt="Number of users" src="img/about-us.png"
							style="max-height: 90px;">
					</div>

					<h3><%=userSize %></h3>
					<h4 style="color: #BDBDBD">Number of Users</h4>

				</div>
			</div>


			<!-- First row of Second Column -->
			<div class="col-md-4 mt-2">
				<div class="border border-primary text-center shadow hover-card">
					<div class="container mt-3">
						<img alt="Number of categories" src="img/list.png"
							style="max-height: 58px;">
					</div>

					<h3 class="mt-3"><%=catSize %></h3>
					<h4 style="color: #BDBDBD">Number of Categories</h4>

				</div>

			</div>


			<!-- First row of third Column -->
			<div class="col-md-4 mt-2">
				<div class="border border-primary text-center shadow hover-card">
					<div class="container mt-3">
						<img alt="Number of product" src="img/box.png"
							style="max-height: 66px;">
					</div>

					<h3 class="mt-2"><%=prodSize %></h3>
					<h4 style="color: #BDBDBD">Number of Products</h4>

				</div>

			</div>

		</div>


		<!-- Second Row -->
		<div class="row mt-4 m-1">
		
			<!-- Second row of first Column -->
			<div class="col-md-4 mt-2">
				<div class="border border-primary text-center shadow hover-card" data-bs-toggle="modal"
		                                                                         data-bs-target="#add-category">
					<div class="container mt-3">
						<img alt="Add the Categories" src="img/add-file.png"
							style="max-height: 90px;">
					</div>

					<h4 class="mt-2" style="color: #BDBDBD">Add The New Categories</h4>

				</div>
			</div>


			<!-- Second row of Second Column -->
			<div class="col-md-4 mt-2">
				<div class="border border-primary text-center shadow hover-card " data-bs-toggle="modal"
		                                                                          data-bs-target="#add-product">
					<div class="container mt-3">
						<img alt="Add the product" src="img/add_product.png"
							style="max-height: 73px;">
					</div>

					<h4 class="mt-4" style="color: #BDBDBD">Add The New Products</h4>

				</div>
			</div>
			
			<!-- Second row of Third Column -->
			<div class="col-md-4 mt-2">
				<div class="border border-primary text-center shadow hover-card " data-bs-toggle="modal"
		                                                                          data-bs-target="#fetch-order-details">
					<div class="container mt-3">
						<img alt="Order Details" src="img/online-order.png"
							style="max-height: 73px;">
					</div>

					<h4 class="mt-4" style="color: #BDBDBD">Get the Order Details</h4>

				</div>
			</div>
		</div>

	</div>

	<!-- Add The categories modal -->
<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-category" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
				<div class="modal-header shadow m-3">
				   <div class="container text-center">
				     <h4 class="modal-title add-category-title" id="exampleModalLabel">Add Categories Details</h4>
				   </div>
				</div>
				
				<div class="modal-body">
				
				    <form action="ProductOperationServlet" method="post">
				         <div class="form-group">
				         <input type="hidden" name="operation" value="addCategory">
				             <input type="text" class="form-control shadow-sm" name="categoryTitle" placeholder="Enter the category title" required>			         
				         </div>
				         
				         <div class="form-group mt-3">
				             <textarea class="form-control shadow-sm" name="categoryDesc" placeholder="Enter Categories Description" required style="height:130px"></textarea>		         
				         </div>
				         
				         <div class="container text-center mt-3">
				            <button class="btn btn-outline-success">Add Category</button>
				            <button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">Close</button>
				         
				         </div>
						    
				    </form>			
				</div>
			</div>
		</div>
	</div>

	<!-- End the Categories modal -->
	
	<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
     
     <!-- Add The Product Details modal -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-product" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
				<div class="modal-header shadow m-3">
				   <div class="container text-center">
				     <h4 class="modal-title add-category-title" id="exampleModalLabel">Add Product Details</h4>
				   </div>
				</div>
				
				<div class="modal-body">
				
				    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
				         <div class="form-group">
				         
				         <input type="hidden" name="operation" value="addProduct">
				         
				             <input type="text" class="form-control shadow-sm" name="productName" placeholder="Enter the product Name" required>			         
				         </div>
				         
				         <div class="form-group mt-3">
				             <textarea class="form-control shadow-sm" name="productDesc" placeholder="Enter product Description" required style="height:100px"></textarea>		         
				         </div>
				         
				         <div class="form-group mt-3">
				         <label id="pPic">Select product picture: </label>
				             <input type="file" class="form-control shadow-sm mt-1" name="productPicture" id="pPic" placeholder="Enter the product Picture" required>			         
				         </div>
				         
				         <div class="form-group mt-3">
				             <input type="number" class="form-control shadow-sm mt-3" name="productPrice" placeholder="Enter the product Price" required>			         
				         </div>
				         
				         <div class="form-group mt-3">
				             <input type="number" class="form-control shadow-sm mt-3" name="productDiscount" placeholder="Enter the product Discount" required>			         
				         </div>
				         
				         <div class="form-group mt-3">
				             <input type="number" class="form-control shadow-sm mt-3" name="productQuantity" placeholder="Enter the product Quantity" required>			         
				         </div>
				         
				        
				         <div class="form-group mt-3">
				             <select name="catId" class="form-control" id="">
				                <%
				                  for(Category c:list){
				                %>	  
				                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle() %></option>
				                <%	  
				                  }
				                %>			             
				             </select>
				         </div>
				         
				         <div class="container text-center mt-3">
				            <button class="btn btn-outline-success">Add New Product</button>
				            <button type="button" class="btn btn-outline-secondary ms-2"
						data-bs-dismiss="modal">Close</button>
				         
				         </div>
						    
				    </form>			
				</div>
			</div>
		</div>
	</div>

	<!-- End the Product modal -->
	
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

 <!-- Add The Product Details modal -->
	
	<!-- Modal -->
	<div class="modal fade" id="fetch-order-details" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
			
				<div class="modal-header shadow m-3">
				   <div class="container text-center">
				     <h4 class="modal-title add-category-title" id="exampleModalLabel">Order Details</h4>
				   </div>
				</div>
				
				<div class="modal-body">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Order Id</th>
								<th scope="col">Customer Name</th>
								<th scope="col">Customer Email</th>
								<th scope="col">Customer Mobile No</th>
								<th scope="col">Customer Shipping Addr</th>
								<th scope="col">Total Price</th>
							</tr>
						</thead>
						<tbody>
						   
						  <%
						    for(OrderDetail order: orderList){
						  %>
							<tr>
								<td><%=order.getOrderId() %></td>
								<td><%=order.getUserName() %></td>
								<td><%=order.getUserEmail() %></td>
								<td><%=order.getUserMobileNumber() %></td>
								<td><%=order.getUserShippingAddr() %></td>
								<td><%=order.getUserItemsPrice() %></td>
							</tr>
							<%
						    }
							%>
							
						</tbody>
					</table>


				</div>
			</div>
		</div>
	</div>

	<!-- End the Product modal -->


<%@ include file="common_modal.jsp" %>
</body>
</html>