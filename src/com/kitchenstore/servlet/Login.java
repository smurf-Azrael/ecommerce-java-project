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
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserService userService = new UserServiceImpl();

		// check Email if registered or not yet
		Boolean registeredEmail = userService.checkEmail(email);

		if (registeredEmail) {
			User user = new User();
			user.setEmail(email);
			user.setPassword(password);
			// Set User Data in user bean from database
			User dbUser = userService.doLogin(user);
			if (dbUser != null) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("loginBean", dbUser);
				response.sendRedirect("http://localhost:8080/KitchenStore/");
			} else {
				response.sendRedirect("login.jsp?invalid=" + Encryption.encode("true"));
			}
		} else {
			response.sendRedirect("login.jsp?registered=" + Encryption.encode("false"));
		}

	}

}
