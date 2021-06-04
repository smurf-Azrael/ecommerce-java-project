package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.Order;
import com.kitchenstore.bean.User;
import com.kitchenstore.service.OrderService;
import com.kitchenstore.service.impl.OrderServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class Orders
 */
public class Orders extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	OrderService orderService = new OrderServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession loginSession = request.getSession(false);
		if (loginSession != null) {
			String review = request.getParameter("review");
			User loginUser = (User) loginSession.getAttribute("loginBean");
			if (loginUser != null) {
				List<Order> orderedItem = orderService.getItems(loginUser.getUserId());
				request.setAttribute("orderedItem", orderedItem);
				request.setAttribute("review", Encryption.decode(review));
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("order.jsp");
				requestDispatcher.forward(request, response);
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
