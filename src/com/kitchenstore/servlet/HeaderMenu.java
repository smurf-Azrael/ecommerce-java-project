package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitchenstore.bean.Category;
import com.kitchenstore.service.CategoryService;
import com.kitchenstore.service.SubCategoryService;
import com.kitchenstore.service.impl.CategoryServiceImpl;
import com.kitchenstore.service.impl.SubCategoryServiceImpl;

/**
 * Servlet implementation class HeaderMenu
 */
public class HeaderMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HeaderMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryService categoryService = new CategoryServiceImpl();
		SubCategoryService subCategoryService = new SubCategoryServiceImpl();

		List<Category> categoryList = categoryService.getCategoryList();

		List<com.kitchenstore.bean.SubCategory> subCatagoryList = subCategoryService.getSubCategoryList();

		request.setAttribute("categoryMenu", categoryList);
		request.setAttribute("subCategoryMenu", subCatagoryList);
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
