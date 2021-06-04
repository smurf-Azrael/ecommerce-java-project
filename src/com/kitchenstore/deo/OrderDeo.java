package com.kitchenstore.deo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Order;

public interface OrderDeo {

	long setOrderDetails(Order orderDetails, Connection connection) throws SQLException;

	int setOrderedProDetails(Order orderDetails, long orderId, Connection connection) throws SQLException;

	List<Order> fetchOrderItem(long userId, Connection connection) throws SQLException;

	List<Order> fetchOrders(Connection connection) throws SQLException;

	Order fetchOrder(long oId, Connection connection) throws SQLException;

	List<Order> fetchProducts(long oId, Connection connection) throws SQLException;

	int updateDeliveryStatus(long oId, String deliveryStatus, Connection connection) throws SQLException;

}
