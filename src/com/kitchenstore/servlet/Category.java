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
import com.kitchenstore.service.CategoryService;
import com.kitchenstore.service.impl.CategoryServiceImpl;
import com.kitchenstore.utilities.Encryption;

/**
 * Servlet implementation class Category
 */
public class Category extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Category() {
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
					List<com.kitchenstore.bean.Category> categoryList = categoryService.getCategoryList();

					// Edit Category
					if (request.getParameter("uid") != null) {
						String categoryId = Encryption.decode(request.getParameter("uid"));
						com.kitchenstore.bean.Category category = categoryService
								.getCategory(Integer.parseInt(categoryId));
						request.setAttribute("editCategory", category);
					}
					// Set Attribute
					request.setAttribute("categoryList", categoryList);
					request.setAttribute("add", Encryption.decode(enAddedMsg));
					request.setAttribute("update", Encryption.decode(enUpdateMsg));
					request.setAttribute("delete", Encryption.decode(enDeleteMsg));
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("category.jsp");
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
		String categoryName = request.getParameter("cname");
		String categoryId = request.getParameter("cid");
		CategoryService categoryService = new CategoryServiceImpl();
		if (categoryId != null) {
			com.kitchenstore.bean.Category category = new com.kitchenstore.bean.Category();
			category.setCategoryId(Integer.parseInt(Encryption.decode(categoryId)));
			category.setCategoryName(categoryName);
			boolean isUpdated = categoryService.editCategory(category);
			if (isUpdated) {
				response.sendRedirect("Category?update=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("Category?update=" + Encryption.encode("false"));
			}
		} else {
			boolean isAdded = categoryService.addCategory(categoryName);
			if (isAdded) {
				response.sendRedirect("Category?add=" + Encryption.encode("true"));
			} else {
				response.sendRedirect("Category?add=" + Encryption.encode("false"));
			}
		}
	}

}
