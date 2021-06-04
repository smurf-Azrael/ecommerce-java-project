package com.kitchenstore.deo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.kitchenstore.bean.Notification;
import com.kitchenstore.deo.NotificationDeo;

public class NotificationDeoImpl implements NotificationDeo {

	@Override
	public List<Notification> fetchNotification(long userId, Connection connection) throws SQLException {
		List<Notification> notificationItems = new ArrayList<Notification>();
		String selectQuery = "SELECT n.notification_id, n.user_id, n.product_id, p.product_name, u.email, u.first_name, u.last_name FROM kitchenstore.notifiy_product n INNER JOIN kitchenstore.user u ON n.user_id=u.user_id INNER JOIN kitchenstore.product p ON n.product_id=p.product_id WHERE n.user_id=? AND status=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, userId);
			preparedStatement.setInt(2, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Notification notification = new Notification();
					notification.setNotificationId(resultSet.getLong("notification_id"));
					notification.setUserId(resultSet.getLong("user_id"));
					notification.setEmail(resultSet.getString("email"));
					notification.setfName(resultSet.getString("first_name"));
					notification.setlName(resultSet.getString("last_name"));
					notification.setProductId(resultSet.getLong("product_id"));
					notification.setProductName(resultSet.getString("product_name"));
					notificationItems.add(notification);
				}
			}
		}
		return notificationItems;
	}

	@Override
	public int setNewNotification(long pId, long userId, Connection connection) throws SQLException {
		String insertQuery = "Insert into kitchenstore.notifiy_product(user_id, product_id, notification_date, status) VALUES (?,?,?,?)";
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		String insertDate = currentDateTime.format(formatter);
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
			preparedStatement.setLong(1, userId);
			preparedStatement.setLong(2, pId);
			preparedStatement.setString(3, insertDate);
			preparedStatement.setInt(4, 0);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<String> getEmailList(long productId, Connection connection) throws SQLException {
		List<String> emailList = new ArrayList<String>();
		String selectQuery = "SELECT u.email FROM kitchenstore.notifiy_product n INNER JOIN kitchenstore.user u ON n.user_id=u.user_id WHERE n.product_id=? AND status=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, productId);
			preparedStatement.setInt(2, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					String email = resultSet.getString("email");
					emailList.add(email);
				}
			}
		}
		return emailList;
	}

	@Override
	public int updateStatus(long productId, Connection connection) throws SQLException {
		String updateQuery = "update kitchenstore.notifiy_product set status=? where product_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, 1);
			preparedStatement.setLong(2, productId);
			return preparedStatement.executeUpdate();

		}
	}

}
