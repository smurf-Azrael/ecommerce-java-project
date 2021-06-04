package com.kitchenstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.service.UserService;
import com.kitchenstore.service.impl.UserServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class RemoveCustomer
 */
public class RemoveCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveCustomer() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		UserService userService = new UserServiceImpl();
		long userId = Long.parseLong(id);
		int isDeleted = userService.removeCustomer(userId);
		if (isDeleted == 1) {
			response.sendRedirect("Customers?deleted=" + Encryption.encode("true"));
		} else {
			response.sendRedirect("Customers?deleted=" + Encryption.encode("false"));
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
