package com.kitchenstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.User;
import com.kitchenstore.service.UserService;
import com.kitchenstore.service.impl.UserServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class Registration
 */
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService userService = new UserServiceImpl();
		HttpSession httpSession = request.getSession(false);
		User user = (User) httpSession.getAttribute("userBean");
		long dbUserId = userService.doRegister(user);
		if (dbUserId != 0) {
			user.setUserId(dbUserId);
			httpSession.setAttribute("loginBean", user);
			response.sendRedirect("http://localhost:8080/KitchenStore/");
		} else {
			response.sendRedirect("register.jsp?message="
					+ Encryption.encode("registration unsuccessfull !! please try again later"));
		}
	}

}
