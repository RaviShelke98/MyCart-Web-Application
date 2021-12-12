

let finalPrice=0;
let array;

	
function myFunction(pid,pname,price) {
		
	  let cart=localStorage.getItem("cart");
		if(cart==null){
			//no cart yet
			//alert("card null");
			let products=[];
			let product={productId:pid, ProductName:pname, productQuantity:1, productPrice:price}
			products.push(product);
			localStorage.setItem("cart",JSON.stringify(products));
			//console.log(" product is added for first time")
			//showtoast(" Item is added to cart")
		}else{
			//cart is already available
			//alert(pname);
			
			let pcart=JSON.parse(cart);
			let oldProduct=pcart.find((item)=>item.productId ==pid)
			if(oldProduct){
				//Only we have to increment the quantity
				oldProduct.productQuantity=oldProduct.productQuantity+1;
				pcart.map((item)=>{
					if(item.productId==oldProduct.productId){
						item.productQuantity=oldProduct.productQuantity;
					}
				})
				localStorage.setItem("cart",JSON.stringify(pcart));
				//console.log("product is increase quantity")
				showtoast(oldProduct.ProductName+" : Quantity is incresed, Quantity= "+oldProduct.productQuantity)

				
			}else{
				//we have to add product
				let product={productId:pid, ProductName:pname, productQuantity:1, productPrice:price}
				pcart.push(product);
				localStorage.setItem("cart",JSON.stringify(pcart));
				//console.log("product is added for second time")
				showtoast("Item is added to cart")

			}
		}
		
		updateCartData();
	}

function updateCartData(){
	// console.log("update Cart method run");
	  let cs=localStorage.getItem("cart");
	  let cartData=JSON.parse(cs);
	  if(cartData==null || cartData.length==0){
		// console.log("cart is empty");
		 $(".cart-items").html("(0)")
		 $(".cart-body1").html(`<h5  style='color: #BDBDBD' class='fst-italic text-center'>Cart does not have any item.</h5>`);
		 $(".checkout-btn").addClass('disabled');
	  }else{
		  //there is somethings
		  
		  let len= cartData.length;
		  let final="("+len+")";
		  console.log(len+" available items :"+final);
		  $(".cart-items").html(final);
		  
		  let table=`
		    <table class='table'>
		       <thead class='thead-light'>
		         <tr>
		           <th>Item Name</th>
		           <th>Item Price</th>
		           <th>Quantity</th>
		           <th>Total Price</th>
		           <th>Action</th>
		         		         
		         </tr>
		       
		       </thead>
		  
		  `;	  
			finalPrice=0;
		   cartData.map((item)=>{
			   
			   table+=`
			      <tr>
			        <td>${item.ProductName}</td>
			        <td>${item.productPrice}</td>
			        <td>${item.productQuantity}</td>
			        <td>${item.productQuantity*item.productPrice}</td>
			        <td><button class='btn btn-danger' onclick='deleteItemFromCart(${item.productId})'>Remove</button></td>
			      
			      </tr>`
				   finalPrice+=item.productPrice*item.productQuantity;
		   })
		 
			  
			table=table+`
			<tr><td colspan='5' class='text-center fw-bold ms-4'>Total Price: ${finalPrice}</td></tr>
			</table>`;  
			 $(".cart-body1").html(table);  
		     $(".final-price").html(finalPrice);
			 $(".checkout-btn").removeClass('disabled');
			 
		  
	  }
}

//delete item
function deleteItemFromCart(pid){
	let cart=JSON.parse(localStorage.getItem('cart'));
	let newCart=cart.filter((item)=>item.productId!=pid)
	localStorage.setItem('cart', JSON.stringify(newCart))
	showtoast("Item is removed form cart")
	updateCartData();
}

//every time load update data when reload page
$(document).ready(function(){
	updateCartData();
})

//create a order from javascripts
const paymentStart=()=>{
	//console.log("payment started...");
  //to get value how much payment do
	let amount=finalPrice+"";
	let username=$('#userName').val();
	let usermail=$('#usermail').val();
	let usermobile=$('#usermobile').val();
	let useraddr=$('#useraddr').val();
	console.log(useraddr);
	if(amount==null || amount==''){
		alert("amount is required");
		return;
	}
	
	//to create order
	//we use ajax to send request to server to create order
	
	$.ajax({
		
		url:("./CreateOrder"),
		data:JSON.stringify({price:amount,uname:username, uemail:usermail, umo:usermobile, uaddr:useraddr}),
		dataType: 'json',
        contentType:'application/json',
		type:'POST',
			success:function(data,textStatus, jqXHR){
				//This function is involked when success
			//	console.log(textStatus);
			//	alert("Data inserted..")
			//	console.log(data);
				
				let options={
						key:'rzp_test_Ef7CdBS83L4yE0',
						amount:data.amount,
						currency:'INR',
						name:'MyCart',
						description:'pay your bill',
						image:'img/logo.png',
						order_id:data.id,
						handler:function(response){
//							console.log(response.razorpay_payment_id);
//							console.log(response.razorpay_order_id);
//							console.log(response.razorpay_signature);
//							console.log('payment successfully!!');
							Swal.fire({
								  position: 'top-center',
								  icon: 'success',
								  title: 'Congratulation! Payment Success',
								  showConfirmButton: false,
								  timer: 3000
								})

						},
						"prefill": {
					        "name": username,
					        "email": usermail,
					        "contact": usermobile
					    },
					    "notes": {
					        "address": "MyCart is best plateform"
					    },
					    "theme": {
					        "color": "#FF3D00"
					    }

				};
				let rzp1 = new Razorpay(options);
				rzp1.on('payment.failed', function (response){
				        alert(response.error.code);
				        alert(response.error.description);
				        alert(response.error.source);
				        alert(response.error.step);
				        alert(response.error.reason);
				        alert(response.error.metadata.order_id);
				        alert(response.error.metadata.payment_id);
				        Swal.fire({
				        	  icon: 'error',
				        	  title: 'Oops...',
				        	  text: 'Something went wrong!',
				        	  timer: 6000
				        	})
				});
				rzp1.open();
				
				
			},
			error: function(jqXHR, textStatus, errorThrown){
				//invoked when error created
				console.log("error")
			}
		
	})
};


//show toast message
function showtoast(content){
           
            $('#toast').addClass('display');
            $('#toast').html(content);
            setTimeout(()=>{
                $('#toast').removeClass('display');
            },3000)
}
