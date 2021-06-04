package com.kitchenstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.Address;
import com.kitchenstore.bean.Order;
import com.kitchenstore.bean.User;
import com.kitchenstore.service.AddressService;
import com.kitchenstore.service.impl.AddressServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class StoreAddress
 */
public class StoreAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StoreAddress() {
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
		Address address = new Address();
		AddressService addressService = new AddressServiceImpl();
		HttpSession httpSession = request.getSession(false);
		User loginUser = (User) httpSession.getAttribute("loginBean");
		String enAddressId = request.getParameter("id");
		Order orderDetails = (Order) httpSession.getAttribute("orderDetails");

		// Set all form data in Address Bean

		address.setfName(request.getParameter("fName"));
		address.setlName(request.getParameter("lName"));
		address.setAddress(request.getParameter("address"));
		address.setAddressType(request.getParameter("addtype"));
		address.setContactNumber(request.getParameter("contactnumber"));
		address.setAlternateNumber(request.getParameter("alternatenumber"));
		address.setAreaId(Long.parseLong(request.getParameter("area")));
		address.setCityId(Integer.parseInt(request.getParameter("city")));
		address.setUserId(loginUser.getUserId());

		if (enAddressId != null) {
			String addressId = Encryption.decode(enAddressId);
			address.setAddressId(Long.parseLong(addressId));
			boolean isAdded = addressService.editAddress(address);
			if (isAdded) {
				if (orderDetails != null) {
					response.sendRedirect("PlaceOrder?update=" + Encryption.encode("true"));
				} else {
					response.sendRedirect("Address?update=" + Encryption.encode("true"));
				}
			} else {
				if (orderDetails != null) {
					response.sendRedirect("PlaceOrder?update=" + Encryption.encode("false"));
				} else {
					response.sendRedirect("Address?update=" + Encryption.encode("false"));
				}
			}
		} else {
			boolean isAdded = addressService.addAddress(address);
			if (isAdded) {
				if (orderDetails != null) {
					response.sendRedirect("PlaceOrder?add=" + Encryption.encode("true"));
				} else {
					response.sendRedirect("Address?add=" + Encryption.encode("true"));
				}
			} else {
				if (orderDetails != null) {
					response.sendRedirect("PlaceOrder?add=" + Encryption.encode("false"));
				} else {
					response.sendRedirect("Address?add=" + Encryption.encode("false"));
				}
			}
		}

	}

}
