package com.kitchenstore.servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitchenstore.utilities.SendEmail;

/**
 * Servlet implementation class ChangeEmail
 */
public class ChangeEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeEmail() {
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
		String resend = request.getParameter("resend");
		String email = request.getParameter("email");

		if (email != null) {

			// OTP generation for verify email address

			String otp = new DecimalFormat("000000").format(new Random().nextInt(999999));

			// Email Html Content

			StringBuilder htmlCode = new StringBuilder(
					"<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'><html data-editor-version='2' class='sg-campaigns' xmlns='http://www.w3.org/1999/xhtml'> <head> <meta http-equiv='Content-Type' content='text/html; charset=utf-8'/> <meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1'/> <meta http-equiv='X-UA-Compatible' content='IE=Edge'/> <style type='text/css'> body, p, div{font-family: inherit; font-size: 14px;}body{color: #000000;}body a{color: #1188e6; text-decoration: none;}p{margin: 0; padding: 0;}table.wrapper{width: 100% !important; table-layout: fixed; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: 100%; -moz-text-size-adjust: 100%; -ms-text-size-adjust: 100%;}img.max-width{max-width: 100% !important;}.column.of-2{width: 50%;}.column.of-3{width: 33.333%;}.column.of-4{width: 25%;}@media screen and (max-width: 600px){#Main-Heading{font-size: 36px !important;}}@media screen and (max-width: 480px){.preheader .rightColumnContent, .footer .rightColumnContent{text-align: left !important;}.preheader .rightColumnContent div, .preheader .rightColumnContent span, .footer .rightColumnContent div, .footer .rightColumnContent span{text-align: left !important;}.preheader .rightColumnContent, .preheader .leftColumnContent{font-size: 80% !important; padding: 5px 0;}table.wrapper-mobile{width: 100% !important; table-layout: fixed;}img.max-width{height: auto !important; max-width: 100% !important;}a.bulletproof-button{display: block !important; width: auto !important; font-size: 80%; padding-left: 0 !important; padding-right: 0 !important;}.columns{width: 100% !important;}.column{display: block !important; width: 100% !important; padding-left: 0 !important; padding-right: 0 !important; margin-left: 0 !important; margin-right: 0 !important;}}</style> <style>body{font-family: Helvetica, Arial, sans-serif;}</style> </head> <body> <center class='wrapper' data-link-color='#1188E6' data-body-style='font-size:14px; font-family:inherit; color:#000000; background-color:#FFFFFF;' > <div class='webkit'> <table cellpadding='0' cellspacing='0' border='0' width='100%' class='wrapper' bgcolor='#FFFFFF'> <tbody> <tr> <td valign='top' bgcolor='#FFFFFF' width='100%'> <table width='100%' role='content-container' class='outer' align='center' cellpadding='0' cellspacing='0' border='0' > <tbody> <tr> <td width='100%'> <table width='100%' cellpadding='0' cellspacing='0' border='0'> <tbody> <tr> <td> <table width='100%' cellpadding='0' cellspacing='0' border='0' style='width: 100%; max-width: 600px' align='center' > <tbody> <tr> <td role='modules-container' style='padding: 0px 0px 0px 0px; color: #000000; text-align: left' bgcolor='#FFFFFF' width='100%' align='left' > <table class='module preheader preheader-hide' role='module' data-type='preheader' border='0' cellpadding='0' cellspacing='0' width='100%' style=' display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0; ' > <tbody> <tr> <td role='module-content'> <p></p></td></tr></tbody> </table> <table border='0' cellpadding='0' cellspacing='0' align='center' width='100%' role='module' data-type='columns' style='padding: 30px 20px 30px 20px' bgcolor='#f6f6f6' > <tbody> <tr role='module-content'> <td height='100%' valign='top'> <table class='column' width='540' style=' width: 540px; border-spacing: 0; border-collapse: collapse; margin: 0px 10px 0px 10px; ' cellpadding='0' cellspacing='0' align='left' border='0' bgcolor='' > <tbody> <tr> <td style='padding: 0px; margin: 0px; border-spacing: 0'> <table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='72aac1ba-9036-4a77-b9d5-9a60d9b05cba' > <tbody> <tr> <td style=' font-size: 6px; line-height: 10px; padding: 0px 0px 0px 0px; ' valign='top' align='center' ></td></tr></tbody> </table> <table class='module' role='module' data-type='spacer' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='331cde94-eb45-45dc-8852-b7dbeb9101d7' > <tbody> <tr> <td style='padding: 0px 0px 20px 0px' role='module-content' bgcolor='' ></td></tr></tbody> </table> <table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='d8508015-a2cb-488c-9877-d46adf313282' > <tbody> <tr> <td style=' font-size: 6px; line-height: 10px; padding: 0px 0px 0px 0px; ' valign='top' ></td></tr></tbody> </table> <table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='948e3f3f-5214-4721-a90e-625a47b1c957' data-mc-module-version='2019-10-22' > <tbody> <tr> <td style=' padding: 10px 30px 18px 30px; line-height: 36px; text-align: inherit; background-color: #ffffff; ' height='100%' valign='top' bgcolor='#ffffff' role='module-content' > <div style='padding: 0px 0 20px 10px;'> <img src='https://images2.imgbox.com/0b/32/qXFWNrZr_o.png' style=' -ms-interpolation-mode: bicubic; border: none; display: block; margin: 0 auto; font-family: Helvetica, Arial, sans-serif; height: 50px; max-height: 100%; max-width: 100%; outline: 0; width: auto; '/> </div><div> <div style=' font-family: Helvetica, Arial, sans-serif; text-align: center; ' > <span style='font-size: 44px' id='Main-heading' >Change Email </span> </div><div></div></div></td></tr></tbody> </table> <table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='a10dcb57-ad22-4f4d-b765-1d427dfddb4e' data-mc-module-version='2019-10-22' > <tbody> <tr> <td style=' padding: 18px 30px 18px 30px; line-height: 22px; text-align: inherit; background-color: #ffffff; ' height='100%' valign='top' bgcolor='#ffffff' role='module-content' > <div> <div style='text-align: center'> <span style=' font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #050038; font-stretch: normal; font-style: normal; font-weight: 400; letter-spacing: normal; line-height: 1.4; opacity: 0.8; ' >Your verification code </span > </div><div></div><div style=' background-color: #f3f4f8; border-radius: 4px; color: #050038; font-family: Helvetica, Arial, sans-serif; font-size: 40px; font-stretch: normal; font-style: normal; font-weight: 700; height: 96px; letter-spacing: normal; line-height: 96px; text-align: center; margin-top: 30px; margin-left: 0px; ' >");
			htmlCode.append(otp);
			htmlCode.append(
					"</div></div></td></tr></tbody> </table> <table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='a265ebb9-ab9c-43e8-9009-54d6151b1600' data-mc-module-version='2019-10-22' > <tbody> <tr> <td style=' padding: 20px 30px 40px 30px; line-height: 22px; text-align: inherit; background-color: #ffffff; ' height='100%' valign='top' bgcolor='#6e6e6e' role='module-content' > <div> <div style='text-align: center'> <span style=' font-family: Helvetica, Arial, sans-serif; font-size: 16px; color: #050038; font-stretch: normal; font-style: normal; font-weight: 400; letter-spacing: normal; line-height: 1.4; opacity: 0.7; ' > You can change your email address by just entering the verification code on which device where you logged in.</span > </div><div></div></div></td></tr></tbody> </table> <table border='0' cellpadding='0' cellspacing='0' class='module' data-role='module-button' data-type='button' role='module' style='table-layout: fixed' width='100%' data-muid='d050540f-4672-4f31-80d9-b395dc08abe1.1' > <tbody> <tr> <td align='center' bgcolor='#ffffff' class='outer-td' style='padding: 0px 0px 0px 0px' > <table border='0' cellpadding='0' cellspacing='0' class='wrapper-mobile' style='text-align: center' > <tbody> <tr> <td> <div class='' style=' border-top: 1px solid #444343; font-family: Helvetica, Arial, sans-serif; font-size: 16px; color: #050038; font-stretch: normal; font-style: normal; font-weight: 400; letter-spacing: normal; line-height: 1.4; opacity: 0.7; padding-top: 5px; margin: 7px; ' > If you didn't request to get verification code for change email address in Kitchen Store, please ignore this message. </div></td></tr></tbody> </table> </td></tr></tbody> </table> <table class='module' role='module' data-type='spacer' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='c37cc5b7-79f4-4ac8-b825-9645974c984e' > <tbody> <tr> <td style='padding: 0px 0px 30px 0px' role='module-content' bgcolor='ffffff' ></td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> </div></center> </body></html>");
			String html = htmlCode.toString();
			String subject = otp + " is your verification code";
			List<String> to = new ArrayList<String>();
			to.add(email);
			// Send Email

			Executor executorService = Executors.newFixedThreadPool(2);
			executorService.execute(new Runnable() {
				public void run() {
					SendEmail.sendEmail(to, subject, html);
				}
			});

			HttpSession httpSession = request.getSession(false);
			httpSession.setAttribute("otp", otp);
			httpSession.setAttribute("changeEmail", email);

			RequestDispatcher dispatcher = request.getRequestDispatcher("verify-email.jsp");
			dispatcher.forward(request, response);

		} else if (resend != null) {

			HttpSession httpSession = request.getSession(false);
			email = (String) httpSession.getAttribute("changeEmail");

			// OTP generation for verify email address

			String otp = new DecimalFormat("000000").format(new Random().nextInt(999999));

			// Email Html Content

			StringBuilder htmlCode = new StringBuilder(
					"<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'><html data-editor-version='2' class='sg-campaigns' xmlns='http://www.w3.org/1999/xhtml'> <head> <meta http-equiv='Content-Type' content='text/html; charset=utf-8'/> <meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1'/> <meta http-equiv='X-UA-Compatible' content='IE=Edge'/> <style type='text/css'> body, p, div{font-family: inherit; font-size: 14px;}body{color: #000000;}body a{color: #1188e6; text-decoration: none;}p{margin: 0; padding: 0;}table.wrapper{width: 100% !important; table-layout: fixed; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: 100%; -moz-text-size-adjust: 100%; -ms-text-size-adjust: 100%;}img.max-width{max-width: 100% !important;}.column.of-2{width: 50%;}.column.of-3{width: 33.333%;}.column.of-4{width: 25%;}@media screen and (max-width: 600px){#Main-Heading{font-size: 36px !important;}}@media screen and (max-width: 480px){.preheader .rightColumnContent, .footer .rightColumnContent{text-align: left !important;}.preheader .rightColumnContent div, .preheader .rightColumnContent span, .footer .rightColumnContent div, .footer .rightColumnContent span{text-align: left !important;}.preheader .rightColumnContent, .preheader .leftColumnContent{font-size: 80% !important; padding: 5px 0;}table.wrapper-mobile{width: 100% !important; table-layout: fixed;}img.max-width{height: auto !important; max-width: 100% !important;}a.bulletproof-button{display: block !important; width: auto !important; font-size: 80%; padding-left: 0 !important; padding-right: 0 !important;}.columns{width: 100% !important;}.column{display: block !important; width: 100% !important; padding-left: 0 !important; padding-right: 0 !important; margin-left: 0 !important; margin-right: 0 !important;}}</style> <style>body{font-family: Helvetica, Arial, sans-serif;}</style> </head> <body> <center class='wrapper' data-link-color='#1188E6' data-body-style='font-size:14px; font-family:inherit; color:#000000; background-color:#FFFFFF;' > <div class='webkit'> <table cellpadding='0' cellspacing='0' border='0' width='100%' class='wrapper' bgcolor='#FFFFFF'> <tbody> <tr> <td valign='top' bgcolor='#FFFFFF' width='100%'> <table width='100%' role='content-container' class='outer' align='center' cellpadding='0' cellspacing='0' border='0' > <tbody> <tr> <td width='100%'> <table width='100%' cellpadding='0' cellspacing='0' border='0'> <tbody> <tr> <td> <table width='100%' cellpadding='0' cellspacing='0' border='0' style='width: 100%; max-width: 600px' align='center' > <tbody> <tr> <td role='modules-container' style='padding: 0px 0px 0px 0px; color: #000000; text-align: left' bgcolor='#FFFFFF' width='100%' align='left' > <table class='module preheader preheader-hide' role='module' data-type='preheader' border='0' cellpadding='0' cellspacing='0' width='100%' style=' display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0; ' > <tbody> <tr> <td role='module-content'> <p></p></td></tr></tbody> </table> <table border='0' cellpadding='0' cellspacing='0' align='center' width='100%' role='module' data-type='columns' style='padding: 30px 20px 30px 20px' bgcolor='#f6f6f6' > <tbody> <tr role='module-content'> <td height='100%' valign='top'> <table class='column' width='540' style=' width: 540px; border-spacing: 0; border-collapse: collapse; margin: 0px 10px 0px 10px; ' cellpadding='0' cellspacing='0' align='left' border='0' bgcolor='' > <tbody> <tr> <td style='padding: 0px; margin: 0px; border-spacing: 0'> <table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='72aac1ba-9036-4a77-b9d5-9a60d9b05cba' > <tbody> <tr> <td style=' font-size: 6px; line-height: 10px; padding: 0px 0px 0px 0px; ' valign='top' align='center' ></td></tr></tbody> </table> <table class='module' role='module' data-type='spacer' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='331cde94-eb45-45dc-8852-b7dbeb9101d7' > <tbody> <tr> <td style='padding: 0px 0px 20px 0px' role='module-content' bgcolor='' ></td></tr></tbody> </table> <table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='d8508015-a2cb-488c-9877-d46adf313282' > <tbody> <tr> <td style=' font-size: 6px; line-height: 10px; padding: 0px 0px 0px 0px; ' valign='top' ></td></tr></tbody> </table> <table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='948e3f3f-5214-4721-a90e-625a47b1c957' data-mc-module-version='2019-10-22' > <tbody> <tr> <td style=' padding: 10px 30px 18px 30px; line-height: 36px; text-align: inherit; background-color: #ffffff; ' height='100%' valign='top' bgcolor='#ffffff' role='module-content' > <div style='padding: 0px 0 20px 10px;'> <img src='https://images2.imgbox.com/0b/32/qXFWNrZr_o.png' style=' -ms-interpolation-mode: bicubic; border: none; display: block; margin: 0 auto; font-family: Helvetica, Arial, sans-serif; height: 50px; max-height: 100%; max-width: 100%; outline: 0; width: auto; '/> </div><div> <div style=' font-family: Helvetica, Arial, sans-serif; text-align: center; ' > <span style='font-size: 44px' id='Main-heading' >Complete registration </span> </div><div></div></div></td></tr></tbody> </table> <table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='a10dcb57-ad22-4f4d-b765-1d427dfddb4e' data-mc-module-version='2019-10-22' > <tbody> <tr> <td style=' padding: 18px 30px 18px 30px; line-height: 22px; text-align: inherit; background-color: #ffffff; ' height='100%' valign='top' bgcolor='#ffffff' role='module-content' > <div> <div style='text-align: center'> <span style=' font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #050038; font-stretch: normal; font-style: normal; font-weight: 400; letter-spacing: normal; line-height: 1.4; opacity: 0.8; ' >Please enter this confirmation code in the window where you started creating your account:</span > </div><div></div><div style=' background-color: #f3f4f8; border-radius: 4px; color: #050038; font-family: Helvetica, Arial, sans-serif; font-size: 40px; font-stretch: normal; font-style: normal; font-weight: 700; height: 96px; letter-spacing: normal; line-height: 96px; text-align: center; margin-top: 30px; margin-left: 0px; ' >");
			htmlCode.append(otp);
			htmlCode.append(
					"</div></div></td></tr></tbody> </table> <table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='a265ebb9-ab9c-43e8-9009-54d6151b1600' data-mc-module-version='2019-10-22' > <tbody> <tr> <td style=' padding: 20px 30px 40px 30px; line-height: 22px; text-align: inherit; background-color: #ffffff; ' height='100%' valign='top' bgcolor='#6e6e6e' role='module-content' > <div> <div style='text-align: center'> <span style=' font-family: Helvetica, Arial, sans-serif; font-size: 16px; color: #050038; font-stretch: normal; font-style: normal; font-weight: 400; letter-spacing: normal; line-height: 1.4; opacity: 0.7; ' > You registered an account on Kitchen Store, before being able to use your account you need to verify that this is your email address.</span > </div><div></div></div></td></tr></tbody> </table> <table border='0' cellpadding='0' cellspacing='0' class='module' data-role='module-button' data-type='button' role='module' style='table-layout: fixed' width='100%' data-muid='d050540f-4672-4f31-80d9-b395dc08abe1.1' > <tbody> <tr> <td align='center' bgcolor='#ffffff' class='outer-td' style='padding: 0px 0px 0px 0px' > <table border='0' cellpadding='0' cellspacing='0' class='wrapper-mobile' style='text-align: center' > <tbody> <tr> <td> <div class='' style=' border-top: 1px solid #444343; font-family: Helvetica, Arial, sans-serif; font-size: 16px; color: #050038; font-stretch: normal; font-style: normal; font-weight: 400; letter-spacing: normal; line-height: 1.4; opacity: 0.7; padding-top: 5px; margin: 7px; ' > If you didn't create an account in Kitchen Store, please ignore this message. </div></td></tr></tbody> </table> </td></tr></tbody> </table> <table class='module' role='module' data-type='spacer' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed' data-muid='c37cc5b7-79f4-4ac8-b825-9645974c984e' > <tbody> <tr> <td style='padding: 0px 0px 30px 0px' role='module-content' bgcolor='ffffff' ></td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> </div></center> </body></html>");
			String html = htmlCode.toString();
			String subject = otp + " is your verification code";
			List<String> to = new ArrayList<String>();
			to.add(email);

			// Send Email

			Executor executorService = Executors.newFixedThreadPool(2);
			executorService.execute(new Runnable() {
				public void run() {
					SendEmail.sendEmail(to, subject, html);
				}
			});

			// Set session value again
			httpSession.setAttribute("otp", otp);

			// Forword Request
			request.setAttribute("resendmessage", "resend");
			RequestDispatcher dispatcher = request.getRequestDispatcher("verify-email.jsp");
			dispatcher.forward(request, response);

		}

	}

}
