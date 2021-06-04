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
import com.kitchenstore.utilities.BCrypt;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class ResetPass
 */
public class ResetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResetPass() {
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
		HttpSession httpSession = request.getSession(false);
		String alredyLogin = (String) httpSession.getAttribute("alredyLogin");
		String email = (String) httpSession.getAttribute("email");
		String password = request.getParameter("password");
		UserService userService = new UserServiceImpl();
		String encyptPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
		User user = new User();
		user.setEmail(email);
		user.setPassword(encyptPassword);
		int updateRow = userService.changePassword(user);
		if (updateRow == 1) {
			if (alredyLogin == null) {
				response.sendRedirect("login.jsp?forgetpass=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("MyAccount?forgetpass=" + Encryption.encode("false"));
			}
		} else {
			response.sendRedirect("login.jsp");
		}
	}

}
