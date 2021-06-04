package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.Category;
import com.kitchenstore.bean.User;
import com.kitchenstore.service.CategoryService;
import com.kitchenstore.service.SubCategoryService;
import com.kitchenstore.service.impl.CategoryServiceImpl;
import com.kitchenstore.service.impl.SubCategoryServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class SubCategory
 */
public class SubCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SubCategory() {
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
					String enAddedMsg = request.getParameter("add");
					String enUpdateMsg = request.getParameter("update");
					String enDeleteMsg = request.getParameter("delete");
					CategoryService categoryService = new CategoryServiceImpl();
					SubCategoryService subCategoryService = new SubCategoryServiceImpl();
					List<Category> categoryList = categoryService.getCategoryList();
					List<com.kitchenstore.bean.SubCategory> subCatagoryList = subCategoryService.getSubCategoryList();
					// Edit Category
					if (request.getParameter("uid") != null) {
						String subCategoryId = Encryption.decode(request.getParameter("uid"));
						com.kitchenstore.bean.SubCategory subCategory = subCategoryService
								.getSubCategory(Integer.parseInt(subCategoryId));
						request.setAttribute("editSubCategory", subCategory);
					}
					// Set Attribute
					request.setAttribute("subCategoryList", subCatagoryList);
					request.setAttribute("categoryList", categoryList);
					request.setAttribute("add", Encryption.decode(enAddedMsg));
					request.setAttribute("update", Encryption.decode(enUpdateMsg));
					request.setAttribute("delete", Encryption.decode(enDeleteMsg));
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("sub-category.jsp");
					requestDispatcher.forward(request, response);
				} else {
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
		String subCategoryName = request.getParameter("sname");
		String subCategoryId = request.getParameter("sid");
		String categoryId = request.getParameter("category");
		SubCategoryService subCategoryService = new SubCategoryServiceImpl();
		if (subCategoryId != null) {
			com.kitchenstore.bean.SubCategory subCategory = new com.kitchenstore.bean.SubCategory();
			subCategory.setSubCategoryId(Integer.parseInt(Encryption.decode(subCategoryId)));
			subCategory.setSubCategoryName(subCategoryName);
			subCategory.setCategoryId(Integer.parseInt(categoryId));
			boolean isUpdated = subCategoryService.editSubCategory(subCategory);
			if (isUpdated) {
				response.sendRedirect("SubCategory?update=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("SubCategory?update=" + Encryption.encode("false"));
			}

		} else {
			com.kitchenstore.bean.SubCategory subCategory = new com.kitchenstore.bean.SubCategory();
			subCategory.setSubCategoryName(subCategoryName);
			subCategory.setCategoryId(Integer.parseInt(categoryId));
			boolean isAdded = subCategoryService.addSubCategory(subCategory);
			if (isAdded) {
				response.sendRedirect("SubCategory?add=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("SubCategory?add=" + Encryption.encode("false"));
			}
		}
	}

}
