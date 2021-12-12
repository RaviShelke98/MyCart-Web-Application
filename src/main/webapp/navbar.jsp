<%@page import="com.ravi.mycart.modal.User"%>
<%
   User userNav=(User)session.getAttribute("current_user");
   String user3=null;
   String userLink=null;
   if(userNav==null){}
   else{
	   user3=userNav.getUserType();
	   if(user3.equals("admin")){
		   userLink="admin.jsp";
	   }else
		   userLink="user.jsp";
	   
   }
   


%>



<div class="border shadow  mb-3 bg-white rounded">
	<nav class="navbar navbar-expand-lg navbar-light ">

    <div class="container2">
      <div> 
          <img class="mycart-logo ms-3" alt="MyCart" src="img/logo.png">
       </div>
		 <div >
			<a class="navbar-brand fs-1 ms-3 fontMycart" href="index.jsp">MyCart</a>
		</div>
    
    </div>
		 
			
			
		<div class="container-fluid">
			<div class="container me-4 ms-4 ml-auto">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse " id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index.jsp">Home</a></li>
						
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Categories </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">Laptop</a></li>
								<li><a class="dropdown-item" href="#">Wears</a></li>
								<li><a class="dropdown-item" href="#">Bags</a></li>
								<li><a class="dropdown-item" href="#">Toys</a></li>
								
							</ul></li>
					</ul>
					<ul class="navbar-nav ml-auto">
					
				      <li class="nav-item"><a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#cartId"><i class="fa fa-cart-plus me-1" style="font-size:20px"><span style="font-size:18px" class="cart-items ms-1 fw-normal">(0)</span></i></a></li>
					  
					   <%
					      if(userNav==null){
					    %>	  
					    	<li class="nav-item active"><a class="nav-link" href="login.jsp">Login</a></li>
						    <li class="nav-item active"><a class="nav-link" href="Register.jsp">Register</a></li>  
					    
					    <%	  
					      }else{
					    %>	  			    	
					    	<li class="nav-item"><a class="nav-link" href="<%=userLink%>"><%=userNav.getUserName() %></a></li>
						    <li class="nav-item"><a class="nav-link" href="LogOutServlet">LogOut</a></li>  
					    
					    <%	  
					      }
					   
					   %>
						
					</ul>
				</div>
			</div>
		</div>
	</nav>
</div>

