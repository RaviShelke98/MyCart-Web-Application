package com.ravi.mycart.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ravi.mycart.dao.CategoryDao;
import com.ravi.mycart.dao.ProductDao;
import com.ravi.mycart.helper.FactoryProvider;
import com.ravi.mycart.modal.Category;
import com.ravi.mycart.modal.Product;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			
			String operation=request.getParameter("operation");
			
			//****To check which operation do
			if(operation.trim().equals("addCategory")) 
			{
				
				// To Fetch data from Categories
				String catTitle=request.getParameter("categoryTitle");
				String catDesc=request.getParameter("categoryDesc");
				
				Category category=new Category();
				category.setCategoryTitle(catTitle);
				category.setCategoryDesc(catDesc);
				
				//category database save
				CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
				int catId=categoryDao.saveCategory(category);
				System.out.println("Category Added :"+catId);
				
				HttpSession  httpSession=request.getSession();
				httpSession.setAttribute("message", "New Category Added");
				httpSession.setAttribute("msgStatus", "success");
				
				response.sendRedirect("admin.jsp");
				return;
			}
			else   //Add the product
			if(operation.trim().equals("addProduct"))
			{
				// To fetch data from Product
				String pname=request.getParameter("productName");
				String pDesc=request.getParameter("productDesc");
				int pPrice=Integer.parseInt(request.getParameter("productPrice"));
				System.out.println("Poduct Price:"+pPrice);
				int pDiscount=Integer.parseInt(request.getParameter("productDiscount"));
				System.out.println("Product Discount:"+pDiscount);
				int pQuantity=Integer.parseInt(request.getParameter("productQuantity"));
				System.out.println("Product Quantity:"+pQuantity);
				int categoryId=Integer.parseInt(request.getParameter("catId"));
				
				Part part=request.getPart("productPicture");
				
				Product product=new Product();
				product.setProductName(pname);
				product.setProductDesc(pDesc);
				product.setProductPrice(pPrice);
				product.setProductDiscount(pDiscount);
				product.setProductQuantity(pQuantity);
				product.setProudctPic(part.getSubmittedFileName());
				
				//get category by id
				CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
				Category catObj=cDao.getCategoryById(categoryId);
				
				product.setCategory(catObj);
				
				// Save the Product
				ProductDao productDao=new ProductDao(FactoryProvider.getFactory());
				productDao.saveProduct(product);
				
				try {
					//upload picture in folder
					//find out the path to upload photo
					
					String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
					System.out.println(path);
					
					//uploading code.
					FileOutputStream fos=new FileOutputStream(path);
					InputStream is=part.getInputStream();
					
					//Reading data
					byte[]data=new byte[is.available()];
					
					//read data
					is.read(data);
					
					//writing the data
					fos.write(data);
					fos.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				HttpSession  httpSession=request.getSession();
				httpSession.setAttribute("message", "New Product Added...!");
				httpSession.setAttribute("msgStatus", "success");
				
				response.sendRedirect("admin.jsp");
				return;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
