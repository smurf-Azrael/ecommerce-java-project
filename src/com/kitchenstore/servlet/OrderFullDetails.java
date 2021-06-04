package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.bean.Address;
import com.kitchenstore.bean.Order;
import com.kitchenstore.service.AddressService;
import com.kitchenstore.service.OrderService;
import com.kitchenstore.service.impl.AddressServiceImpl;
import com.kitchenstore.service.impl.OrderServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class OrderFullDetails
 */

public class OrderFullDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderFullDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	OrderService orderService = new OrderServiceImpl();
	AddressService addressService = new AddressServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oId = request.getParameter("id");
		String updateMsg = request.getParameter("update");
		if (oId != null) {
			Order order = orderService.getOrder(Long.parseLong(Encryption.decode(oId)));
			List<Order> orderedProducts = orderService.getProducts(Long.parseLong(Encryption.decode(oId)));
			Address address = addressService.getAddress(order.getAddressId());
			request.setAttribute("orderDetails", order);
			request.setAttribute("orderedProduct", orderedProducts);
			request.setAttribute("address", address);
			request.setAttribute("updateMsg", Encryption.decode(updateMsg));
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("order-full-details.jsp");
			requestDispatcher.forward(request, response);
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
		String deliveryStatus = request.getParameter("deliveryStatus");
		String oId = request.getParameter("oid");
		if (oId != null) {
			boolean isUpdated = orderService.changeDeliveryStatus(Long.parseLong(Encryption.decode(oId)),
					deliveryStatus);
			if (isUpdated) {
				response.sendRedirect("OrderFullDetails?update=" + Encryption.encode("true") + "&id=" + oId);
			} else {
				response.sendRedirect("OrderFullDetails?update=" + Encryption.encode("false") + "&id=" + oId);
			}
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
	}

}
