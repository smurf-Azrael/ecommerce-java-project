package com.kitchenstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.service.ProductService;
import com.kitchenstore.service.impl.ProductServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class RemoveFeedback
 */
public class RemoveFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveFeedback() {
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
		if (id != null) {
			ProductService productService = new ProductServiceImpl();
			long feedbackId = Long.parseLong(id);
			int isDeleted = productService.removeFeedback(feedbackId);
			if (isDeleted == 1) {
				response.sendRedirect("ManageFeedback?deleted=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("ManageFeedback?deleted=" + Encryption.encode("false"));
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
