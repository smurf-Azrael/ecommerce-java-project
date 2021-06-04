package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.User;
import com.kitchenstore.service.UserService;
import com.kitchenstore.service.impl.UserServiceImpl;

/**
 * Servlet implementation class Customers
 */
public class Customers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Customers() {
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
					String isDeleted = request.getParameter("deleted");
					User user = new User();
					UserService userService = new UserServiceImpl();
					List<User> customerList = userService.getCustomerList();
					if (customerList != null) {
						request.setAttribute("customers", customerList);
						request.setAttribute("isdeleted", isDeleted);
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("customers-details.jsp");
						requestDispatcher.forward(request, response);
					} else {
						response.sendRedirect("http://localhost:8080/KitchenStore/");
					}
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
