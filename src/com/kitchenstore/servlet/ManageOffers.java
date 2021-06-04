package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.Offer;
import com.kitchenstore.bean.Product;
import com.kitchenstore.bean.User;
import com.kitchenstore.service.OfferService;
import com.kitchenstore.service.ProductService;
import com.kitchenstore.service.impl.OfferServiceImpl;
import com.kitchenstore.service.impl.ProductServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class ManageOffers
 */
public class ManageOffers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageOffers() {
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
				if (loginUser.getIsAdmin() == 1) {
					String enUpdateMsg = request.getParameter("update");
					String enDeleteMsg = request.getParameter("delete");
					String addMsg = request.getParameter("add");
					ProductService productService = new ProductServiceImpl();
					OfferService offerService = new OfferServiceImpl();
					List<Offer> offerList = offerService.getOfferList();
					List<Product> prodList = productService.getProductList();

					if (request.getParameter("uid") != null) {
						String offerId = Encryption.decode(request.getParameter("uid"));
						Offer offer = offerService.getOffer(Long.parseLong(offerId));
						request.setAttribute("editOffer", offer);
					}

					request.setAttribute("productList", prodList);
					request.setAttribute("offerList", offerList);
					request.setAttribute("update", Encryption.decode(enUpdateMsg));
					request.setAttribute("delete", Encryption.decode(enDeleteMsg));
					request.setAttribute("add", Encryption.decode(addMsg));
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("manage-offer.jsp");
					requestDispatcher.forward(request, response);
				} else

				{
					response.sendError(HttpServletResponse.SC_NOT_FOUND);
				}
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productId = request.getParameter("product");
		String price = request.getParameter("price");
		String rate = request.getParameter("rate");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String offerUpdateId = request.getParameter("oid");
		Offer offer = new Offer();
		offer.setStartDate(startDate);
		offer.setEndDate(endDate);
		if (price.length() > 0 && price != null) {
			offer.setDiscountPrice(Float.parseFloat(price));
		}
		if (rate.length() > 0 && rate != null) {
			offer.setDiscountRate(Float.parseFloat(rate));
		}
		OfferService offerService = new OfferServiceImpl();

		if (offerUpdateId != null && offerUpdateId.length() > 0) {
			offer.setOfferId(Long.parseLong(Encryption.decode(offerUpdateId)));
			boolean isUpdated = offerService.editOffer(offer);
			if (isUpdated) {
				response.sendRedirect("ManageOffers?update=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("ManageOffers?update=" + Encryption.encode("false"));
			}

		} else {
			offer.setProductId(Long.parseLong(productId));
			boolean isAdded = offerService.addOffer(offer);
			if (isAdded) {
				response.sendRedirect("ManageOffers?add=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("ManageOffers?add=" + Encryption.encode("false"));
			}
		}
	}

}
