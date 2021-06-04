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
 * Servlet implementation class ChangeEmailAddress
 */
public class ChangeEmailAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeEmailAddress() {
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
		User loginUser = (User) httpSession.getAttribute("loginBean");
		String email = (String) httpSession.getAttribute("changeEmail");
		long userId = loginUser.getUserId();
		UserService userService = new UserServiceImpl();
		boolean changeEmail = userService.changeEmail(userId, email);
		if (changeEmail) {
			loginUser.setEmail(email);
			httpSession.setAttribute("LoginBean", loginUser);
			response.sendRedirect("MyAccount?updateemail=" + Encryption.encode("updated"));
		} else {
			response.sendRedirect("MyAccount?updateemail=" + Encryption.encode("notupdated"));
		}
	}

}
