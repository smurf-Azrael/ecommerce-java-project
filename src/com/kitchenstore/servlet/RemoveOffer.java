package com.kitchenstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.service.OfferService;
import com.kitchenstore.service.impl.OfferServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class RemoveOffer
 */
public class RemoveOffer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveOffer() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		OfferService offerService = new OfferServiceImpl();
		long offerId = Long.parseLong(id);
		int isDeleted = offerService.removeOffer(offerId);
		if (isDeleted == 1) {
			response.sendRedirect("ManageOffers?delete=" + Encryption.encode("true"));
		} else

		{
			response.sendRedirect("ManageOffers?delete=" + Encryption.encode("false"));
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
