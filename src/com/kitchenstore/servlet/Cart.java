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
import com.kitchenstore.service.CartService;
import com.kitchenstore.service.impl.CartServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class Cart
 */
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	CartService cartService = new CartServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession loginSession = request.getSession(false);
		if (loginSession != null) {
			User loginUser = (User) loginSession.getAttribute("loginBean");
			if (loginUser != null) {
				List<com.kitchenstore.bean.Cart> cartItems = cartService.getItems(loginUser.getUserId());
				request.setAttribute("cartItems", cartItems);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
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
		HttpSession loginSession = request.getSession(false);
		String pId = request.getParameter("productId");
		String cId = request.getParameter("cId");
		String Qty = request.getParameter("qty");
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
								"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Successfully ! Item added in cart.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-secondary mr-3' data-dismiss='modal'>Continue</button> <button type='button' class='btn btn-sm btn-success'> <a href='Cart' target='_blank' class='text-white'>Go to Cart</a> </button></div></div>");
					} else {
						boolean isAdded = cartService.addItem(Long.parseLong(Encryption.decode(pId)),
								loginUser.getUserId());
						if (isAdded) {
							response.getWriter().write(
									"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Successfully ! Item added in cart.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-secondary mr-3' data-dismiss='modal'>Continue</button> <button type='button' class='btn btn-sm btn-success'> <a href='Cart' target='_blank' class='text-white'>Go to Cart</a> </button></div></div>");
						} else {
							response.getWriter().write(
									"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Opps ! Some problem has occur. Please try again later.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-danger float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
						}
					}
				} else {
					response.getWriter().write(
							"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>If you want to add item in cart you must have to log in first.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-secondary mr-3' data-dismiss='modal'>Cancel</button> <button type='button' class='btn btn-sm btn-primary'> <a href='login.jsp' target='_blank' class='text-white'>login</a> </button></div></div>");
				}

			} else {
				response.getWriter().write(
						"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>If you want to add item in cart you must have to log in first</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-secondary mr-3' data-dismiss='modal'>Cancel</button> <button type='button' class='btn btn-sm btn-primary'> <a href='login.jsp' class='text-white'>login</a> </button></div></div>");
			}
		} else if (cId != null && cId.length() > 0) {
			boolean isAdded = cartService.setQnty(Long.parseLong(Encryption.decode(cId)), Integer.parseInt(Qty));
		}
	}

}
