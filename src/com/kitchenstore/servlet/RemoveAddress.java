package com.kitchenstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.service.AddressService;
import com.kitchenstore.service.impl.AddressServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class RemoveAddress
 */
public class RemoveAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveAddress() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AddressService addressService = new AddressServiceImpl();
		String addressId = request.getParameter("id");
		Boolean isdeleted = addressService.removeAddress(addressId);
		if (isdeleted) {
			response.sendRedirect("Address?delete=" + Encryption.encode("true"));
		} else {
			response.sendRedirect("Address?delete=" + Encryption.encode("false"));
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
