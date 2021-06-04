package com.kitchenstore.servlet;

import java.io.IOException;

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
 * Servlet implementation class MyAccount
 */
public class MyAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyAccount() {
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

				String updatePInfo = request.getParameter("updatepinfo");
				String updatePass = request.getParameter("updatepass");
				String updateEmail = request.getParameter("updateemail");
				String updateCNumber = request.getParameter("updatecontact");
				String forgetPass = request.getParameter("forgetpass");
				HttpSession httpSession = request.getSession(false);
				User user = (User) httpSession.getAttribute("loginBean");
				UserService userService = new UserServiceImpl();
				String currentPass = userService.getCurrentPassword(user.getUserId());
				request.setAttribute("currentpass", currentPass);
				request.setAttribute("updatepinfo", updatePInfo);
				request.setAttribute("updatepass", updatePass);
				request.setAttribute("updatecontact", updateCNumber);
				request.setAttribute("updateemail", updateEmail);
				request.setAttribute("passwordforgeted", forgetPass);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("my-account.jsp");
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

	}

}
