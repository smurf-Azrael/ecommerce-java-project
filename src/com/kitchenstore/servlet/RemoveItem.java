package com.kitchenstore.servlet;

import java.io.IOException;

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
 * Servlet implementation class RemoveItem
 */
public class RemoveItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveItem() {
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
		String cartId = request.getParameter("cartid");
		String clearCart = request.getParameter("clearcart");
		String clearWishlist = request.getParameter("clearwishlist");
		if (cartId != null) {
			CartService cartService = new CartServiceImpl();
			long cId = Long.parseLong(Encryption.decode(cartId));
			boolean isDeleted = cartService.removeItem(cId);
			if (isDeleted) {
				response.sendRedirect("Cart?delete=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("Cart?delete=" + Encryption.encode("false"));
			}
		} else if (id != null) {
			WishlistService wishlistService = new WishlistServiceImpl();
			long pId = Long.parseLong(Encryption.decode(id));
			boolean isDeleted = wishlistService.removeItem(pId);
			if (isDeleted) {
				response.sendRedirect("Wishlist?delete=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("Wishlist?delete=" + Encryption.encode("false"));
			}
		} else if (clearCart != null) {
			HttpSession loginSession = request.getSession(false);
			if (loginSession != null) {
				User loginUser = (User) loginSession.getAttribute("loginBean");
				if (loginUser != null) {
					CartService cartService = new CartServiceImpl();
					boolean isDeleted = cartService.removeItemAll(loginUser.getUserId());
					if (isDeleted) {
						response.sendRedirect("Cart?clearCart=" + Encryption.encode("true"));
					} else {
						response.sendRedirect("Cart?clearCart=" + Encryption.encode("false"));
					}
				} else {
					response.sendRedirect("login.jsp");
				}
			} else {
				response.sendRedirect("login.jsp");
			}
		} else if (clearWishlist != null) {
			HttpSession loginSession = request.getSession(false);
			if (loginSession != null) {
				User loginUser = (User) loginSession.getAttribute("loginBean");
				if (loginUser != null) {
					WishlistService wishlistService = new WishlistServiceImpl();
					boolean isDeleted = wishlistService.removeAllItem(loginUser.getUserId());
					if (isDeleted) {
						response.sendRedirect("Wishlist?clearCart=" + Encryption.encode("true"));
					} else {
						response.sendRedirect("Wishlist?clearCart=" + Encryption.encode("false"));
					}
				} else {
					response.sendRedirect("login.jsp");
				}
			} else {
				response.sendRedirect("login.jsp");
			}
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
