package com.kitchenstore.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.bean.Order;
import com.kitchenstore.bean.User;
import com.kitchenstore.service.CartService;
import com.kitchenstore.service.OrderService;
import com.kitchenstore.service.ProductService;
import com.kitchenstore.service.impl.CartServiceImpl;
import com.kitchenstore.service.impl.OrderServiceImpl;
import com.kitchenstore.service.impl.ProductServiceImpl;
import com.kitchenstore.utilities.Encryption;
import com.kitchenstore.utilities.SendEmail;

/**
 * Servlet implementation class OrderProcess
 */
public class OrderProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderProcess() {
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
		String pMode = request.getParameter("pmode");
		if (loginSession != null) {
			User loginUser = (User) loginSession.getAttribute("loginBean");
			if (loginUser != null) {
				Order orderDetails = (Order) loginSession.getAttribute("orderDetails");
				if (orderDetails != null) {

					ProductService productService = new ProductServiceImpl();
					boolean outofStock = false;
					for (com.kitchenstore.bean.Cart cart : orderDetails.getProductList()) {
						com.kitchenstore.bean.Product product = productService.getProduct((int) cart.getProductId());
						if (cart.getQnty() > product.getProductStock()) {
							outofStock = true;
							break;
						}
					}
					if (outofStock) {
						loginSession.removeAttribute("orderDetails");
						if (orderDetails.getProductList().size() > 1) {
							response.sendRedirect("Cart?outofStock=" + Encryption.encode("true"));
						} else {
							response.sendRedirect("OutofStock?source=" + Encryption.encode("Product out of stock"));
						}
					} else {

						// Order Actual Business Logic
						OrderService orderService = new OrderServiceImpl();

						// Set More Details in OrderDetails Bean
						LocalDateTime currentDateTime = LocalDateTime.now();
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
						String todayDate = currentDateTime.format(formatter);

						orderDetails.setUserId(loginUser.getUserId());
						orderDetails.setPlaceOrderDate(todayDate);

						if (pMode != null) {
							orderDetails.setPaymentMode("PAYTM");
							orderDetails.setPaymentDate(todayDate);
							orderDetails.setTransactionId(request.getParameter("tId"));
						} else {
							orderDetails.setPaymentMode("COD");
						}
						boolean isComplated = orderService.makeOrder(orderDetails);
						loginSession.removeAttribute("orderDetails");

						if (isComplated) {
							CartService cartService = new CartServiceImpl();
							boolean isDeleted = cartService.removeItemAll(loginUser.getUserId());

							loginSession.setAttribute("orderSuccess", "true");

							// Email Html Content

							StringBuilder htmlCode = new StringBuilder(
									"<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'><html data-editor-version='2' class='sg-campaigns' xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /><meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1' /><meta http-equiv='X-UA-Compatible' content='IE=Edge' /><style type='text/css'>body,p,div{font-family:inherit;font-size:14px}body{color:#000}body a{color:#1188e6;text-decoration:none}p{margin:0;padding:0}table.wrapper{width:100% !important;table-layout:fixed;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:100%;-moz-text-size-adjust:100%;-ms-text-size-adjust:100%}img.max-width{max-width:100% !important}.column.of-2{width:50%}.column.of-3{width:33.333%}.column.of-4{width:25%}@media screen and (max-width: 600px){#Main-Heading{font-size:36px !important}}@media screen and (max-width: 480px){.preheader .rightColumnContent, .footer .rightColumnContent{text-align:left !important}.preheader .rightColumnContent div, .preheader .rightColumnContent span, .footer .rightColumnContent div, .footer .rightColumnContent span{text-align:left !important}.preheader .rightColumnContent, .preheader .leftColumnContent{font-size:80% !important;padding:5px 0}table.wrapper-mobile{width:100% !important;table-layout:fixed}img.max-width{height:auto !important;max-width:100% !important}a.bulletproof-button{display:block !important;width:auto !important;font-size:80%;padding-left:0 !important;padding-right:0 !important}.columns{width:100% !important}.column{display:block !important;width:100% !important;padding-left:0 !important;padding-right:0 !important;margin-left:0 !important;margin-right:0 !important}}</style><style>body{font-family:Helvetica,Arial,sans-serif}</style></head><body><center class='wrapper' data-link-color='#1188E6' data-body-style='font-size:14px; font-family:inherit; color:#000000; background-color:#FFFFFF;' ><div class='webkit'><table cellpadding='0' cellspacing='0' border='0' width='100%' class='wrapper' bgcolor='#FFFFFF'><tbody><tr><td valign='top' bgcolor='#FFFFFF' width='100%'><table width='100%' role='content-container' class='outer' align='center' cellpadding='0' cellspacing='0' border='0' ><tbody><tr><td width='100%'><table width='100%' cellpadding='0' cellspacing='0' border='0'><tbody><tr><td><table width='100%' cellpadding='0' cellspacing='0' border='0' style='width: 100%; max-width: 600px' align='center' ><tbody><tr><td role='modules-container' style='padding: 0px 0px 0px 0px; color: #000000; text-align: left' bgcolor='#FFFFFF' width='100%' align='left' ><table class='module preheader preheader-hide' role='module' data-type='preheader' border='0' cellpadding='0' cellspacing='0' width='100%' style=' display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0; ' ><tbody><tr><td role='module-content'><p></p></td></tr></tbody></table><table border='0' cellpadding='0' cellspacing='0' align='center' width='100%' role='module' data-type='columns' style='padding: 30px 20px 30px 20px' bgcolor='#f6f6f6' ><tbody><tr role='module-content'><td height='100%' valign='top'><table class='column' width='540' style=' width: 540px; border-spacing: 0; border-collapse: collapse; margin: 0px 10px 0px 10px; ' cellpadding='0' cellspacing='0' align='left' border='0' bgcolor='' ><tbody><tr><td style='padding: 0px; margin: 0px; border-spacing: 0'><table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='72aac1ba-9036-4a77-b9d5-9a60d9b05cba' ><tbody><tr><td style=' font-size: 6px; line-height: 10px; padding: 0px 0px 0px 0px; ' valign='top' align='center' ></td></tr></tbody></table><table class='module' role='module' data-type='spacer' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='331cde94-eb45-45dc-8852-b7dbeb9101d7' ><tbody><tr><td style='padding: 0px 0px 20px 0px' role='module-content' bgcolor='' ></td></tr></tbody></table><table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='d8508015-a2cb-488c-9877-d46adf313282' ><tbody><tr><td style=' font-size: 6px; line-height: 10px; padding: 0px 0px 0px 0px; ' valign='top' ></td></tr></tbody></table><table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='948e3f3f-5214-4721-a90e-625a47b1c957' data-mc-module-version='2019-10-22' ><tbody><tr><td style=' padding: 10px 30px 18px 30px; line-height: 36px; text-align: inherit; background-color: #ffffff; ' height='100%' valign='top' bgcolor='#ffffff' role='module-content' ><div style='padding: 0px 0 20px 10px'> <img src='https://images2.imgbox.com/0b/32/qXFWNrZr_o.png' style=' -ms-interpolation-mode: bicubic; border: none; display: block; margin: 0 auto; font-family: Helvetica, Arial, sans-serif; height: 50px; max-height: 100%; max-width: 100%; outline: 0; width: auto; ' /></div><div><div style=' font-family: Helvetica, Arial, sans-serif; text-align: center; ' > <span style='font-size: 44px' id='Main-heading' >Order Successful </span></div><div></div></div></td></tr></tbody></table><table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='a10dcb57-ad22-4f4d-b765-1d427dfddb4e' data-mc-module-version='2019-10-22' ><tbody><tr><td style=' padding: 18px 30px 18px 30px; line-height: 22px; text-align: inherit; background-color: #ffffff; ' height='100%' valign='top' bgcolor='#ffffff' role='module-content' ><div><div> <span style=' font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #050038; font-stretch: normal; font-style: normal; font-weight: 700; letter-spacing: normal; line-height: 1.4; opacity: 0.8; text-align: left; '> Thanks for order,</span ><br/><br/> <span style=' font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #050038; font-stretch: normal; font-style: normal; font-weight: 400; letter-spacing: normal; line-height: 1.4; opacity: 0.8; text-align: center '> Your order details received and we started working on this.</span ></div><div></div></div></td></tr></tbody></table><table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='a265ebb9-ab9c-43e8-9009-54d6151b1600' data-mc-module-version='2019-10-22' ><tbody><tr><td style=' padding: 20px 30px 20px 30px; line-height: 22px; text-align: inherit; background-color: #ffffff; ' height='100%' valign='top' bgcolor='#6e6e6e' role='module-content' ></td></tr></tbody></table><table border='0' cellpadding='0' cellspacing='0' class='module' data-role='module-button' data-type='button' role='module' style='table-layout: fixed' width='100%' data-muid='d050540f-4672-4f31-80d9-b395dc08abe1.1' ><tbody><tr><td align='left' bgcolor='#ffffff' class='outer-td' style='padding: 0px 0px 0px 20px' ><table border='0' cellpadding='0' cellspacing='0' class='wrapper-mobile' style='text-align: left' ><tbody><tr><td><div class='' style=' border-top: 1px solid #d1cccc; font-family: Helvetica, Arial, sans-serif; font-size: 16px; color: #050038; font-stretch: normal; font-style: normal; font-weight: 400; letter-spacing: normal; line-height: 1.4; opacity: 0.7; padding-top: 5px; margin: 7px; ' > Thanks for using our platform. <br/> Team Kitchen Store</div></td></tr></tbody></table></td></tr></tbody></table><table class='module' role='module' data-type='spacer' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='c37cc5b7-79f4-4ac8-b825-9645974c984e' ><tbody><tr><td style='padding: 0px 0px 30px 0px' role='module-content' bgcolor='ffffff' ></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></div></center></body></html>");
							String html = htmlCode.toString();
							String subject = "Order Successful";
							List<String> to = new ArrayList<String>();
							to.add(loginUser.getEmail());

							// Send Email

							Executor executorService = Executors.newFixedThreadPool(2);
							executorService.execute(new Runnable() {
								public void run() {
									SendEmail.sendEmail(to, subject, html);
								}
							});

							response.sendRedirect("OrderSuccess");
						} else {
							loginSession.setAttribute("orderFailed", "true");
							response.sendRedirect("OrderFailed");
						}
					}
				} else {
					response.sendError(HttpServletResponse.SC_NOT_FOUND);
				}

			} else {
				response.sendRedirect("login.jsp");
			}
		} else {
			response.sendRedirect("login.jsp");
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
