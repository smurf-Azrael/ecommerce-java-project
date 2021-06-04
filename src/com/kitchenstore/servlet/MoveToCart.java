package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.User;
import com.kitchenstore.service.CartService;
import com.kitchenstore.service.WishlistService;
import com.kitchenstore.service.impl.CartServiceImpl;
import com.kitchenstore.service.impl.WishlistServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class MoveToCart
 */
public class MoveToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MoveToCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	CartService cartService = new CartServiceImpl();
	WishlistService wishlistService = new WishlistServiceImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession loginSession = request.getSession(false);
		String pId = request.getParameter("productId");
		String wId = request.getParameter("wishlistId");
		if (pId != null && pId.length() > 0) {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			if (loginSession != null) {
				User loginUser = (User) loginSession.getAttribute("loginBean");
				if (loginUser != null) {
					boolean isAvailable = false;
					List<com.kitchenstore.bean.Cart> items = cartService.getItems(loginUser.getUserId());
					if (items != null) {
						for (com.kitchenstore.bean.Cart getItem : items) {
							if (getItem.getProductId() == Long.parseLong(Encryption.decode(pId))) {
								isAvailable = true;
								break;
							}
						}
					}
					if (isAvailable) {
						response.getWriter().write(
								"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Successfully ! Item moved in to cart.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-secondary mr-3' data-dismiss='modal'>Continue</button> <button type='button' class='btn btn-sm btn-success'> <a href='Cart' target='_blank' class='text-white'>Go to Cart</a> </button></div></div>");
					} else {
						boolean isAdded = cartService.addItem(Long.parseLong(Encryption.decode(pId)),
								loginUser.getUserId());
						if (isAdded) {
							response.getWriter().write(
									"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Successfully ! Item moved into cart.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-secondary mr-3' data-dismiss='modal'>Continue</button> <button type='button' class='btn btn-sm btn-success'> <a href='Cart' target='_blank' class='text-white'>Go to Cart</a> </button></div></div>");
						} else {
							response.getWriter().write(
									"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Opps ! Some problem has occur. Please try again later.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-danger float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
						}
					}
					boolean isDeleted = wishlistService.removeItem(Long.parseLong(Encryption.decode(wId)));
				} else {
					response.getWriter().write(
							"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>If you want to move item into cart you must have to log in first.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-secondary mr-3' data-dismiss='modal'>Continue</button> <button type='button' class='btn btn-sm btn-primary'> <a href='login.jsp' target='_blank' class='text-white'>login</a> </button></div></div>");
				}

			} else {
				response.getWriter().write(
						"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>If you want to move item into cart you must have to log in first</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-secondary mr-3' data-dismiss='modal'>Continue</button> <button type='button' class='btn btn-sm btn-primary'> <a href='login.jsp' class='text-white'>login</a> </button></div></div>");
			}
		}
	}

}
