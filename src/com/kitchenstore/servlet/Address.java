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
import com.kitchenstore.service.AddressService;
import com.kitchenstore.service.impl.AddressServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class Address
 */
public class Address extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	AddressService addressService = new AddressServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String enAddedMsg = request.getParameter("add");
		String enUpdateMsg = request.getParameter("update");
		String enDeleteMsg = request.getParameter("delete");
		HttpSession httpSession = request.getSession(false);
		User loginUser = (User) httpSession.getAttribute("loginBean");
		Address address = new Address();
		List<com.kitchenstore.bean.Address> addressList = addressService.getAddressList(loginUser.getUserId());
		request.setAttribute("addrList", addressList);
		request.setAttribute("add", Encryption.decode(enAddedMsg));
		request.setAttribute("update", Encryption.decode(enUpdateMsg));
		request.setAttribute("delete", Encryption.decode(enDeleteMsg));
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("manage-addresses.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String defaultId = request.getParameter("defaultId");
		if (defaultId != null) {
			HttpSession httpSession = request.getSession(false);
			User loginUser = (User) httpSession.getAttribute("loginBean");
			if (loginUser != null) {
				boolean isupdated = addressService.setDefaultAddress(Long.parseLong(Encryption.decode(defaultId)),
						loginUser.getUserId());
				if (isupdated) {
					response.getWriter().write(
							"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>X</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Successfully ! Address Set as Default Address.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-success float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
				} else {
					response.getWriter().write(
							"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>X</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Opps ! Due to Some Problem Address not Set as Default. Please try again later.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-success float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");

				}
			}
		}
	}

}
