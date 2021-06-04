package com.kitchenstore.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Notification;
import com.kitchenstore.deo.NotificationDeo;
import com.kitchenstore.deo.impl.NotificationDeoImpl;
import com.kitchenstore.service.NotificationService;
import com.kitchenstore.utilities.JDBCConnection;

public class NotificationServiceImpl implements NotificationService {

	NotificationDeo notificationDeo = new NotificationDeoImpl();

	@Override
	public List<Notification> getNotification(long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<Notification> notifications = notificationDeo.fetchNotification(userId, connection);
			return notifications;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean NewNotification(long pId, long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int insertRow = notificationDeo.setNewNotification(pId, userId, connection);
			if (insertRow == 1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
