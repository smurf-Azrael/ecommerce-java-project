package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.service.ProductService;
import com.kitchenstore.service.impl.ProductServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class Feedback
 */
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	ProductService productService = new ProductServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String des = request.getParameter("des");
		String rating = request.getParameter("rating");
		String uId = request.getParameter("uid");
		String pId = request.getParameter("pid");

		List<com.kitchenstore.bean.Feedback> feedbacks = productService
				.getFeedbackList(Long.parseLong(Encryption.decode(pId)));

		com.kitchenstore.bean.Feedback feedback = new com.kitchenstore.bean.Feedback();

		boolean alredy = false;
		if (feedbacks != null) {
			for (com.kitchenstore.bean.Feedback fBack : feedbacks) {
				if (fBack.getUserId() == Long.parseLong(Encryption.decode(uId))) {
					alredy = true;
					break;
				}
			}
		}
		if (alredy) {
			response.sendRedirect("Orders?review=" + Encryption.encode("alredy submitted"));
		} else {
			feedback.setRate(Float.parseFloat(rating));
			feedback.setDes(des);
			feedback.setUserId(Long.parseLong(Encryption.decode(uId)));
			feedback.setProductId(Long.parseLong(Encryption.decode(pId)));

			boolean isAdded = productService.giveFeedback(feedback);

			if (isAdded) {
				response.sendRedirect("Orders?review=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("Orders?review=" + Encryption.encode("false"));
			}
		}
	}

}
