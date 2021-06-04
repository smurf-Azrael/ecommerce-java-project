package com.kitchenstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.Notification;
import com.kitchenstore.bean.User;
import com.kitchenstore.service.NotificationService;
import com.kitchenstore.service.impl.NotificationServiceImpl;

/**
 * Servlet implementation class NotifyMe
 */
public class NotifyMe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NotifyMe() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	NotificationService notificationService = new NotificationServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession loginSession = request.getSession(false);
		String pId = request.getParameter("productId");
		if (pId != null && pId.length() > 0) {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			if (loginSession != null) {
				User loginUser = (User) loginSession.getAttribute("loginBean");
				if (loginUser != null) {
					boolean isAvailable = false;
					List<Notification> notifications = notificationService.getNotification(loginUser.getUserId());
					if (notifications != null) {
						for (Notification notification : notifications) {
							if (notification.getProductId() == Long.parseLong(pId)) {
								isAvailable = true;
								break;
							}
						}
					}
					if (isAvailable) {
						response.getWriter().write(
								"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>We will send you notification as an email when this product's stock added.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-success float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
					} else {
						boolean isAdded = notificationService.NewNotification(Long.parseLong(pId),
								loginUser.getUserId());
						if (isAdded) {
							response.getWriter().write(
									"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>We will send you notification as an email when this product's stock added.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-success float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
						} else {
							response.getWriter().write(
									"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Opps ! Somthing went wrong. Please try again later.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-danger float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
						}
					}
				} else {
					response.getWriter().write(
							"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>If you want to get notification about product's stock you must have to log in first</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-secondary mr-3' data-dismiss='modal'>Continue</button> <button type='button' class='btn btn-sm btn-primary'> <a href='login.jsp' target='_blank' class='text-white'>login</a> </button></div></div>");
				}

			} else {
				response.getWriter().write(
						"<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>If you want to get notification about product's stock you must have to log in first</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-secondary mr-3' data-dismiss='modal'>Continue</button> <button type='button' class='btn btn-sm btn-primary'> <a href='login.jsp' target='_blank' class='text-white'>login</a> </button></div></div>");
			}
		}
	}
}
