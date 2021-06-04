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
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class Product
 */
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pId = request.getParameter("pid");

		if (pId == null || pId.length() < 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} else {
			ProductService productService = new ProductServiceImpl();

			com.kitchenstore.bean.Product product = productService.getProduct(Integer.parseInt(Encryption.decode(pId)));
			List<ProductImage> productImages = productService.getProductImages(Long.parseLong(Encryption.decode(pId)));
			List<com.kitchenstore.bean.Product> reletedProduct = productService
					.getProductList(product.getSubCategoryId());
			request.setAttribute("product", product);
			request.setAttribute("reletedProduct", reletedProduct);
			request.setAttribute("productImages", productImages);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("single-product.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
