package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kitchenstore.bean.Product;
import com.kitchenstore.bean.ProductImage;
import com.kitchenstore.bean.User;
import com.kitchenstore.service.ProductService;
import com.kitchenstore.service.impl.ProductServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class ProductGallery
 */
public class ProductGallery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductGallery() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession loginSession = request.getSession(false);
		if (loginSession != null) {
			User loginUser = (User) loginSession.getAttribute("loginBean");
			if (loginUser != null) {
				if (loginUser.getIsAdmin() == 1) {
					String enUpdateMsg = request.getParameter("update");
					String enDeleteMsg = request.getParameter("delete");
					ProductService productService = new ProductServiceImpl();
					List<Product> prodList = productService.getProductList();
					// Edit Category
					if (request.getParameter("uid") != null) {
						String productId = Encryption.decode(request.getParameter("uid"));
						Product product = productService.getProduct(Integer.parseInt(productId));
						request.setAttribute("getProduct", product);
					}
					request.setAttribute("productList", prodList);
					request.setAttribute("update", Encryption.decode(enUpdateMsg));
					request.setAttribute("delete", Encryption.decode(enDeleteMsg));
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("product-gallery.jsp");
					requestDispatcher.forward(request, response);
				} else

				{
					response.sendError(HttpServletResponse.SC_NOT_FOUND);
				}
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean allUpdated = true;
		String imgId1 = request.getParameter("imgid1");
		String imgId2 = request.getParameter("imgid2");
		String imgId3 = request.getParameter("imgid3");
		String imgId4 = request.getParameter("imgid4");
		Part image1 = request.getPart("image1");
		Part image2 = request.getPart("image2");
		Part image3 = request.getPart("image3");
		Part image4 = request.getPart("image4");
		ProductService productService = new ProductServiceImpl();
		long productId = Long.parseLong(Encryption.decode(request.getParameter("productid")));
		if (imgId1 != null && !imgId1.isEmpty()) {
			ProductImage productImage = new ProductImage();
			long pImageId = Long.parseLong(Encryption.decode(imgId1));
			productImage.setpImageId(pImageId);
			if (image1.getSize() > 0) {
				productImage.setProductImage(image1.getInputStream());
			}
			boolean isUpdated = productService.updateImage(productImage);
			if (isUpdated == false)
				allUpdated = false;
		} else if (image1.getSize() > 0) {
			ProductImage productImage = new ProductImage();
			productImage.setProductId(productId);
			productImage.setProductImage(image1.getInputStream());
			boolean isAdded = productService.addImage(productImage);
			if (isAdded == false)
				allUpdated = false;
		}
		if (imgId2 != null && !imgId2.isEmpty()) {
			ProductImage productImage = new ProductImage();
			long pImageId = Long.parseLong(Encryption.decode(imgId2));
			productImage.setpImageId(pImageId);
			if (image2.getSize() > 0) {
				productImage.setProductImage(image2.getInputStream());
			}
			boolean isUpdated = productService.updateImage(productImage);
			if (isUpdated == false)
				allUpdated = false;
		} else if (image2.getSize() > 0) {
			ProductImage productImage = new ProductImage();
			productImage.setProductId(productId);
			productImage.setProductImage(image2.getInputStream());
			boolean isAdded = productService.addImage(productImage);
			if (isAdded == false)
				allUpdated = false;
		}
		if (imgId3 != null && !imgId3.isEmpty()) {
			ProductImage productImage = new ProductImage();
			long pImageId = Long.parseLong(Encryption.decode(imgId3));
			productImage.setpImageId(pImageId);
			if (image3.getSize() > 0) {
				productImage.setProductImage(image3.getInputStream());
			}
			boolean isUpdated = productService.updateImage(productImage);
			if (isUpdated == false)
				allUpdated = false;
		} else if (image3.getSize() > 0) {
			ProductImage productImage = new ProductImage();
			productImage.setProductId(productId);
			productImage.setProductImage(image3.getInputStream());
			boolean isAdded = productService.addImage(productImage);
			if (isAdded == false)
				allUpdated = false;
		}
		if (imgId4 != null && !imgId4.isEmpty()) {
			ProductImage productImage = new ProductImage();
			long pImageId = Long.parseLong(Encryption.decode(imgId4));
			productImage.setpImageId(pImageId);
			if (image4.getSize() > 0) {
				productImage.setProductImage(image4.getInputStream());
			}
			boolean isUpdated = productService.updateImage(productImage);
			if (isUpdated == false)
				allUpdated = false;
		} else if (image4.getSize() > 0) {
			ProductImage productImage = new ProductImage();
			productImage.setProductId(productId);
			productImage.setProductImage(image4.getInputStream());
			boolean isAdded = productService.addImage(productImage);
			if (isAdded == false)
				allUpdated = false;
		}
		if (allUpdated) {
			response.sendRedirect("ProductGallery?update=" + Encryption.encode("true"));
		} else {
			response.sendRedirect("ProductGallery?update=" + Encryption.encode("false"));
		}
	}

}
