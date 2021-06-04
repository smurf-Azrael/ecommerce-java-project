package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.service.SubCategoryService;
import com.kitchenstore.service.impl.SubCategoryServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class ProductCategory
 */
public class ProductCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cId = request.getParameter("cid");

		if (cId == null || cId.length() < 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} else {
			SubCategoryService subCategoryService = new SubCategoryServiceImpl();
			List<com.kitchenstore.bean.SubCategory> subCategoryList = subCategoryService
					.getSubCategoryList(Integer.parseInt(Encryption.decode(cId)));
			request.setAttribute("subCategory", subCategoryList);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("product-category.jsp");
			requestDispatcher.forward(request, response);
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
