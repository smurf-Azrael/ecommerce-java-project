package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.Product;
import com.kitchenstore.bean.User;
import com.kitchenstore.service.ProductService;
import com.kitchenstore.service.impl.ProductServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class ProductStock
 */
public class ProductStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductStock() {
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
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("product-stock.jsp");
					requestDispatcher.forward(request, response);
				} else {
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
		long productock = Long.parseLong(request.getParameter("pstock"));
		long productId = Long.parseLong(Encryption.decode(request.getParameter("pid")));
		ProductService productService = new ProductServiceImpl();
		boolean isUpdated = productService.editStock(productId, productock);
		if (isUpdated) {
			response.sendRedirect("ProductStock?update=" + Encryption.encode("true"));
		} else {
			response.sendRedirect("ProductStock?update=" + Encryption.encode("false"));
		}
	}

}
