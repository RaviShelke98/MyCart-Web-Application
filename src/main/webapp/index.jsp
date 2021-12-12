<%@page import="com.ravi.mycart.dao.CategoryDao"%>
<%@page import="com.ravi.mycart.helper.CardDescHelper"%>
<%@page import="com.ravi.mycart.modal.Category"%>
<%@page import="com.ravi.mycart.modal.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ravi.mycart.dao.ProductDao"%>
<%@page import="com.ravi.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyCart | Home</title>

<%@ include file="comm-css-javascript.jsp" %>

</head>
<body>
  <%@ include file="navbar.jsp" %>
  
          <%
               
               CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
               List<Category> catList=categoryDao.getCategories();
               
               
               ProductDao productDao=new ProductDao(FactoryProvider.getFactory());
               List<Product> list=null;
               String catname=request.getParameter("category");
               
               if(catname==null){
            	   list=productDao.getAllProduct();
               }else
               if(catname.trim().equals("all")){
            	   list=productDao.getAllProduct();
               }
               else {
            	   int catId=Integer.parseInt(catname.trim());
            	   list=productDao.getAllProductById(catId);
               }
               
                     
           %>
    <div class="container-fluid">   
   <div class="row mx-2">
    <!-- Show all categories items -->
		<div class="col-md-2 mt-4 text-left">
		
		<div class="list-group">
		       
		       <%
		       // To give color in category section
		        String flag="";
		         if(catname==null){
		        	 flag="active";
		         }
		         else if(catname.trim().equals("all")){
		        	 flag="active";
		         }
		         else flag="";
		       %>
		
			<a href="index.jsp?category=all" class="list-group-item list-group-item-action <%=flag %>"
				aria-current="true">All Products</a>

			<%
			// To give color in category section
              for(Category c: catList){
            	  if(catname==null){
 		        	 flag="";
 		         }else
            	  if(catname.equals(c.getCategoryId()+"")){
            		  flag="active";
            	  }
            	  else{
            		  flag="";
            	  }
            %>
			<a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action <%=flag%>"><%= c.getCategoryTitle() %></a>


			<%	  
            	  
              }
           %>
          </div>

		</div>
		<!-- Show all product item -->
        <div class="col-md-8 ms-3">
        
             <div class="row mt-4 ms-2">
                     
                   <div class="col-md-12">
                       
                      <div class="card-columns">
                           <!-- Traversing Products -->
						   <%
						       if(list.size()==0){
						    	%>
						    	   <h4 class="fst-italic text-center" style="color:#BDBDBD">No Items Available of this Category</h4>
						    	<%
						       }
                               for(Product p: list)
                               {
                           %>
                             
                              <div  class="card mt-2">
                              
                              
                                  <div class="card-body">
                                     <div class="col-md-12">
                                         <img style="max-height: 140px; max-width: 140px "src="img/products/<%=p.getProudctPic() %>" class="card-img-top img-fluid m-2" alt="<%=p.getProductName()%>">  
                                     <h5 class="card-title"><%=p.getProductName() %></h5>
                                     
                                     <p class="card-text">
                                        <%= CardDescHelper.get10Words(p.getProductDesc()).toString() %>
                                     
                                     </p>
                                     
                                     </div>
                                     
                                     
                                  
                                  
                                  </div>   
                                  
                                  <div class="card-footer">
                                    <div class="col-md-6">
                                           <div class="row">
                                              <div class="col-md-12">
                                                  <div class="row">
                                                      <div class="col-md-3">
                                                      <%
                                                         int finalPrice=CardDescHelper.getFinalPrice(p.getProductDiscount(), p.getProductPrice());
                                                      
                                                      %>
                                                          <h5 class="text-left">&#8377;<%=finalPrice %>/-</h5> 
                                                      </div>
                                                      
                                                      
                                                      <div class="col-md-3">
                                                          <strike style="color:#FF3D00"><h5 style="color:#BDBDBD" class="text-left">&#8377;<%=p.getProductPrice()%></h5> </strike>
                                                      </div>
                                                      <div class="col-md-2">
                                                          <h5 class="text-left" style="color:#AD1457; font-size:16px;"><%=p.getProductDiscount()%>%</h5> 
                                                      </div>
                                                      
                                                  </div>
                                                                                                                                                                            
                                              </div>
                                                 
                                           </div>
                                           <div class="text-center ms-5">
                                                   <button class="btn btn-custom ms-2 me-2"  onclick="myFunction(<%=p.getProductId()%>,'<%=p.getProductName()%>',<%=finalPrice%>)"><a href="checkout.jsp" style="text-decoration:none; color:white;">Buy</a></button>
                                                   <button class="btn btn-outline-primary text-center" onclick="myFunction(<%=p.getProductId()%>,'<%=p.getProductName()%>',<%=finalPrice%>)">Add to Cart</button>
                                              </div>  
                                     
                                     </div>
                                      
                                      
                                  
                                  </div>                        
                              </div>


                           <%	            	  
                               }
                            %>
					</div>
                   
                   
                   </div>
             
             </div>
            
      
      
      </div>
   
   </div>
   </div>
   

 
  
  <%@ include file="common_modal.jsp" %>
  
  
</body>
</html>