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
import com.kitchenstore.bean.User;
import com.kitchenstore.service.ProductService;
import com.kitchenstore.service.impl.ProductServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class Products
 */
public class Products extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Products() {
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
					String enAddedMsg = request.getParameter("add");
					String enUpdateMsg = request.getParameter("update");
					String enDeleteMsg = request.getParameter("delete");
					ProductService productService = new ProductServiceImpl();
					List<Product> prodList = productService.getProductList();
					// Edit Category
					if (request.getParameter("uid") != null) {
						String productId = Encryption.decode(request.getParameter("uid"));
						Product product = productService.getProduct(Integer.parseInt(productId));
						request.setAttribute("editProduct", product);
					}

					request.setAttribute("productList", prodList);
					request.setAttribute("add", Encryption.decode(enAddedMsg));
					request.setAttribute("update", Encryption.decode(enUpdateMsg));
					request.setAttribute("delete", Encryption.decode(enDeleteMsg));
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("product-details.jsp");
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
		Product product = new Product();
		ProductService productService = new ProductServiceImpl();
		String productName = request.getParameter("name");
		String desc = request.getParameter("des");
		String moreInfo = request.getParameter("moreinfo");
		float price = Float.parseFloat(request.getParameter("price"));
		Part part = request.getPart("productthumb");
		int categoryId = Integer.parseInt(request.getParameter("category"));
		int subcategoryId = 0;
		if (request.getParameter("subcategory") != null) {
			subcategoryId = Integer.parseInt(request.getParameter("subcategory"));
		}
		String productId = request.getParameter("pid");
		product.setProductName(productName);
		product.setDes(desc);
		product.setMoreIndfo(moreInfo);
		product.setPrice(price);
		product.setCategoryId(categoryId);
		product.setSubCategoryId(subcategoryId);
		if (part.getSize() > 0) {
			product.setProductThumb(part.getInputStream());
		}
		if (productId != null) {
			product.setProductId(Long.parseLong(Encryption.decode(productId)));
			boolean isUpdated = productService.editProduct(product);
			if (isUpdated) {
				response.sendRedirect("Products?update=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("Products?update=" + Encryption.encode("false"));
			}
		} else {
			boolean isAdded = productService.addProduct(product);
			if (isAdded) {
				response.sendRedirect("Products?add=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("Products?add=" + Encryption.encode("false"));
			}
		}

	}

}
