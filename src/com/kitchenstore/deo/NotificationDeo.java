package com.kitchenstore.deo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Notification;

public interface NotificationDeo {

	List<Notification> fetchNotification(long userId, Connection connection) throws SQLException;

	int setNewNotification(long pId, long userId, Connection connection) throws SQLException;

	List<String> getEmailList(long productId, Connection connection) throws SQLException;

	int updateStatus(long productId, Connection connection) throws SQLException;

}
