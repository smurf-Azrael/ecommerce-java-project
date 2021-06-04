package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.Cart;
import com.kitchenstore.bean.Order;
import com.kitchenstore.bean.User;
import com.kitchenstore.service.CartService;
import com.kitchenstore.service.impl.CartServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class BuyProducts
 */
public class BuyProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuyProducts() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_NOT_FOUND);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession loginSession = request.getSession(false);
		if (loginSession != null) {
			User loginUser = (User) loginSession.getAttribute("loginBean");
			String singleProductId = request.getParameter("singleProductId");
			if (loginUser != null) {
				String totalPrice = request.getParameter("price");
				String price = request.getParameter("singleProductPrice");
				String qty = request.getParameter("singleProductQty");

				List<com.kitchenstore.bean.Cart> cartItems = new ArrayList<com.kitchenstore.bean.Cart>();
				// product details get From cart
				CartService cartService = new CartServiceImpl();

				if (singleProductId != null) {
					Cart cart = new Cart();
					cart.setProductId(Long.parseLong(Encryption.decode(singleProductId)));
					cart.setPrice(Float.parseFloat(Encryption.decode(price)));
					cart.setQnty(Integer.parseInt(qty));
					cartItems.add(cart);
				} else {
					cartItems = cartService.getItems(loginUser.getUserId());
					int index = 0;
					while (index < cartItems.size()) {
						Cart tempCart = cartItems.get(index);
						if (tempCart.getQnty() > tempCart.getProductStock()) {
							cartItems.remove(index);
							index = 0;
						} else {
							index++;
						}
					}
				}

				// set Products in Order Bean
				Order order = new Order();
				order.setProductList(cartItems);

				if (singleProductId != null) {
					float tPrice = Float.parseFloat(Encryption.decode(price)) * Integer.parseInt(qty);
					order.setTotalPrice(tPrice);
				} else {
					order.setTotalPrice(Float.parseFloat(Encryption.decode(totalPrice)));
				}

				// Set orderBean into session
				loginSession.setAttribute("orderDetails", order);

				response.sendRedirect("PlaceOrder");
			} else {
				response.sendRedirect("login.jsp");
			}
		} else

		{
			response.sendRedirect("login.jsp");
		}

	}

}
