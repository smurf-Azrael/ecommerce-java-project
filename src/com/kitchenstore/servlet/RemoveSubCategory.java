package com.kitchenstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.service.SubCategoryService;
import com.kitchenstore.service.impl.SubCategoryServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class RemoveSubCategory
 */
public class RemoveSubCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveSubCategory() {
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
		SubCategoryService subCategoryService = new SubCategoryServiceImpl();
		int subCategoryId = Integer.parseInt(id);
		boolean isDeleted = subCategoryService.removeSubCategory(subCategoryId);
		if (isDeleted) {
			response.sendRedirect("SubCategory?delete=" + Encryption.encode("true"));
		} else {
			response.sendRedirect("SubCategory?delete=" + Encryption.encode("false"));
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
