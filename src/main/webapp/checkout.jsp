
<%
	User user = (User) session.getAttribute("current_user");
	if (user == null) {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("message", "Yor are not Logged in!!..Please Login to access to checkout page...");
		httpSession.setAttribute("msgStatus", "error");
		response.sendRedirect("login.jsp");
		return;
	}
	System.out.println(user.getUserAddress());
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>checkout</title>
<%@ include file="comm-css-javascript.jsp"%>
</head>
<body>
  <%@ include file="navbar.jsp"%>
  
   <div class="container-fluid">
     <div class="row">
      <!-- card details -->
           
           <div class="col-md-5 mt-3">
              <h3 class="text-center">Your cart</h3>
             <div class="shadow ms-3">
                <div class="cart-body1"></div>
             </div>
           
        
        
        </div>
        
        <!-- form details -->
           <div class="col-md-7 mt-3">
              <h3 class="text-center"> Your Details for Order</h3>
             <div class="shadow ms-2">
				         <div class="form-group m-3">	
				          <label for="exampleInputEmail1" class="form-label">Enter your Email address</label>		         
				          <input type="email" class="form-control shadow-sm" id="usermail" placeholder="Enter the Email Name" value='<%=user.getUserEmail() %>' required readonly>			         
				         </div>
				         
				        <div class="form-group m-3">	
				          <label for="exampleInputEmail1" class="form-label">Enter your Name</label>		         
				          <input type="text" class="form-control shadow-sm" id="userName" placeholder="Enter the your Name" value='<%=user.getUserName() %>' required>					          		         
				         </div>
				         
				         <div class="form-group m-3">	
				          <label for="exampleInputEmail1" class="form-label">Enter your Mobile Number</label>		         
				          <input type="number" class="form-control shadow-sm" id="usermobile" placeholder="Enter the your Mobile Number" value='<%=user.getUserPhone() %>' required>					          		         
				         </div>
				         
				         <div class="form-group m-3">	
				          <label for="exampleInputEmail1" class="form-label">Enter your Shipping Address</label>		         
				          <textarea class="form-control shadow-sm" id="useraddr" placeholder="Enter Your Address" required style="height:100px"><%=user.getUserAddress() %></textarea>		         
				          		         
				         </div>
				          
				                   
				         
				         <div class="container text-center mt-3 mb-3">
				            <button type="submit" class="btn btn-outline-success m-2" onclick='paymentStart()'>Order</button>
				            <button type="button" class="btn btn-outline-secondary ms-2 m-2"
						data-bs-dismiss="modal"><a href='index.jsp' style="text-decoration:none">Close</a></button>
				         
				         </div>
    
				   
             </div>
           
        
        
        </div>
        
        
        </div>
     
     </div>
     
   
   </div>
  
   <%@ include file="common_modal.jsp" %>
</body>
</html>