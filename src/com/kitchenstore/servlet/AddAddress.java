package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.bean.Area;
import com.kitchenstore.bean.City;
import com.kitchenstore.service.AddressService;
import com.kitchenstore.service.impl.AddressServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class AddAddress
 */
public class AddAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddAddress() {
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
		List<City> cityList = addressService.getCityList();
		List<Area> areaList = addressService.getAreaList();
		String errorMessage = request.getParameter("added");
		String enAddressId = request.getParameter("id");
		if (enAddressId != null) {
			String addressId = Encryption.decode(enAddressId);
			com.kitchenstore.bean.Address address = addressService.getAddress(Long.parseLong(addressId));
			request.setAttribute("id", enAddressId);
			request.setAttribute("address", address);
		}

		request.setAttribute("cityList", cityList);
		request.setAttribute("areaList", areaList);
		request.setAttribute("added", errorMessage);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("add-address.jsp");
		requestDispatcher.forward(request, response);

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
