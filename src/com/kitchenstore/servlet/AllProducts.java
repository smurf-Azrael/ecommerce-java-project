package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.bean.Product;
import com.kitchenstore.service.ProductService;
import com.kitchenstore.service.impl.ProductServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class AllProducts
 */
public class AllProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AllProducts() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	ProductService productService = new ProductServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sId = request.getParameter("id");

		if (sId == null || sId.length() < 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} else {
			ProductService productService = new ProductServiceImpl();
			List<com.kitchenstore.bean.Product> productList = productService
					.getProductList((Integer.parseInt(Encryption.decode(sId))));
			request.setAttribute("products", productList);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("product-list.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String startingPrice = request.getParameter("startingPrice");
		String endingPrice = request.getParameter("endingPrice");
		String sId = request.getParameter("sid");
		String sName = request.getParameter("sname");

		if (sId == null || sId.length() < 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} else {
			ProductService productService = new ProductServiceImpl();
			List<com.kitchenstore.bean.Product> productList = productService.getProductList(
					Integer.parseInt(Encryption.decode(sId)), Float.parseFloat(startingPrice),
					Float.parseFloat(endingPrice));

			if (productList != null && productList.size() > 0) {
				request.setAttribute("products", productList);
			} else {
				System.out.println("-------------------------");
				System.out.println("---------" + productList + "------------");
				System.out.println("-------------------------");
				com.kitchenstore.bean.Product product = new Product();
				product.setSubCategoryId(Integer.parseInt(Encryption.decode(sId)));
				product.setSubCategoryName(sName);
				request.setAttribute("product", product);
				request.setAttribute("products", productList);
			}

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("product-list.jsp");
			requestDispatcher.forward(request, response);
		}

	}

}
