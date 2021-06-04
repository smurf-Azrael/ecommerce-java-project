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
 * Servlet implementation class EditAccount
 */
public class EditAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditAccount() {
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
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String gender = request.getParameter("gender");
		String password = request.getParameter("password");
		String contactNumber = request.getParameter("contactnumber");
		HttpSession httpSession = request.getSession(false);
		User loginUser = (User) httpSession.getAttribute("loginBean");
		User user = new User();
		UserService userService = new UserServiceImpl();
		if (fName != null) {
			user.setfName(fName);
			user.setlName(lName);
			user.setGender(gender);
			user.setUserId(loginUser.getUserId());
			int updatePInfo = userService.editPersonalInfo(user);
			if (updatePInfo == 1) {
				response.sendRedirect("MyAccount?updatepinfo=" + Encryption.encode("updated"));
				loginUser.setfName(user.getfName());
				loginUser.setlName(user.getlName());
				loginUser.setGender(user.getGender());
				httpSession.setAttribute("loginBean", loginUser);
			} else {
				response.sendRedirect("MyAccount?updatepinfo=" + Encryption.encode("notupdated"));
			}
		} else if (password != null) {
			user.setEmail(loginUser.getEmail());
			String encyptPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
			user.setPassword(encyptPassword);
			int updatePassword = userService.changePassword(user);
			if (updatePassword == 1) {
				response.sendRedirect("MyAccount?updatepass=" + Encryption.encode("updated"));
			} else {
				response.sendRedirect("MyAccount?updatepass=" + Encryption.encode("notupdated"));
			}
		} else if (contactNumber != null) {
			user.setContact(contactNumber);
			user.setUserId(loginUser.getUserId());
			int updateContact = userService.changeContactNumber(user);
			if (updateContact == 1) {
				response.sendRedirect("MyAccount?updatecontact=" + Encryption.encode("updated"));
				loginUser.setContact(user.getContact());
				httpSession.setAttribute("loginBean", loginUser);
			} else {
				response.sendRedirect("MyAccount?updatecontact=" + Encryption.encode("notupdated"));
			}
		}

	}

}
