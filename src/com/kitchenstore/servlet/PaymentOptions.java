package com.kitchenstore.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.Order;
import com.kitchenstore.bean.User;
import com.kitchenstore.service.AddressService;
import com.kitchenstore.service.ProductService;
import com.kitchenstore.service.impl.AddressServiceImpl;
import com.kitchenstore.service.impl.ProductServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class PaymentOptions
 */
public class PaymentOptions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaymentOptions() {
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
				Order orderDetails = (Order) loginSession.getAttribute("orderDetails");
				if (orderDetails != null) {
					ProductService productService = new ProductServiceImpl();
					boolean outofStock = false;
					for (com.kitchenstore.bean.Cart cart : orderDetails.getProductList()) {
						com.kitchenstore.bean.Product product = productService.getProduct((int) cart.getProductId());
						if (cart.getQnty() > product.getProductStock()) {
							outofStock = true;
							break;
						}
					}
					if (outofStock) {
						loginSession.removeAttribute("orderDetails");

						if (orderDetails.getProductList().size() > 1) {
							response.sendRedirect("Cart?outofStock=" + Encryption.encode("true"));
						} else {
							response.sendRedirect("OutofStock?source=" + Encryption.encode("Product out of stock"));
						}
					} else {

						// get Address
						String addressId = request.getParameter("aid");

						// set AddressId into session

						orderDetails.setAddressId(Long.parseLong(Encryption.decode(addressId)));
						loginSession.setAttribute("orderDetails", orderDetails);

						// get Address
						AddressService addressService = new AddressServiceImpl();
						com.kitchenstore.bean.Address address = addressService
								.getAddress(Long.parseLong(Encryption.decode(addressId)));
						request.setAttribute("totoalProducts", orderDetails.getProductList().size());
						request.setAttribute("totalPrice", orderDetails.getTotalPrice());
						request.setAttribute("DeliveryAddress", address);
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("payment-options.jsp");
						requestDispatcher.forward(request, response);
					}
				} else {
					response.sendRedirect("/KitchenStore/");
				}

			} else {
				response.sendRedirect("login.jsp");
			}
		} else {
			response.sendRedirect("login.jsp");
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
