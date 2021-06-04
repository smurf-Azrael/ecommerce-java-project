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

/**
 * Servlet implementation class GetSubcategory
 */
public class GetSubcategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetSubcategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int categproyId = 0;
		if (request.getParameter("id") != null) {
			categproyId = Integer.parseInt(request.getParameter("id"));
		} else {
			categproyId = 0;
		}

		SubCategoryService subCategoryService = new SubCategoryServiceImpl();
		List<com.kitchenstore.bean.SubCategory> subCategoryList = subCategoryService.getSubCategoryList(categproyId);
		request.setAttribute("subCategoryList", subCategoryList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("ajax/get-subcategory.jsp");
		requestDispatcher.forward(request, response);
	}

}
