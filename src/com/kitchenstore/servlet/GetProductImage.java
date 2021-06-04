package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.bean.ProductImage;
import com.kitchenstore.service.ProductService;
import com.kitchenstore.service.impl.ProductServiceImpl;

/**
 * Servlet implementation class GetProductImage
 */
public class GetProductImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetProductImage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long productId = Long.parseLong(request.getParameter("productId"));
		ProductService productService = new ProductServiceImpl();
		List<ProductImage> productImages = productService.getProductImages(productId);
		request.setAttribute("productimages", productImages);
		request.setAttribute("productid", productId);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("ajax/get-product-images.jsp");
		requestDispatcher.forward(request, response);
	}

}
