package com.kitchenstore.deo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.kitchenstore.bean.Cart;
import com.kitchenstore.bean.Order;
import com.kitchenstore.deo.OrderDeo;

public class OrderDeoImpl implements OrderDeo {

	@Override
	public long setOrderDetails(Order orderDetails, Connection connection) throws SQLException {
		String insertQuery = "Insert into kitchenstore.order (user_id, address_id, order_place_date, payment_mode, payment_date, total_amount, transaction_id) VALUES (?,?,?,?,?,?,?)";
		long orderId = 0;
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,
				Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setLong(1, orderDetails.getUserId());
			preparedStatement.setLong(2, orderDetails.getAddressId());
			preparedStatement.setString(3, orderDetails.getPlaceOrderDate());
			preparedStatement.setString(4, orderDetails.getPaymentMode());
			preparedStatement.setString(5, orderDetails.getPaymentDate());
			preparedStatement.setFloat(6, orderDetails.getTotalPrice());
			preparedStatement.setString(7, orderDetails.getTransactionId());
			int insertRow = preparedStatement.executeUpdate();
			try (ResultSet resultSet = preparedStatement.getGeneratedKeys()) {
				while (resultSet.next()) {
					orderId = resultSet.getInt(1);
				}
			}
		}
		return orderId;
	}

	@Override
	public int setOrderedProDetails(Order orderDetails, long orderId, Connection connection) throws SQLException {
		String insertQuery = "INSERT INTO kitchenstore.order_details (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?);";
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
			for (Cart items : orderDetails.getProductList()) {
				preparedStatement.setLong(1, orderId);
				preparedStatement.setLong(2, items.getProductId());
				preparedStatement.setInt(3, items.getQnty());
				preparedStatement.setFloat(4, (items.getPrice() * items.getQnty()));
				preparedStatement.addBatch();
			}
			int inserted[] = preparedStatement.executeBatch();
			if (inserted.length > 0) {
				return 1;
			} else {
				return 0;
			}
		}
	}

	@Override
	public List<Order> fetchOrderItem(long userId, Connection connection) throws SQLException {
		List<Order> orderList = new ArrayList<Order>();
		String selectQuery = "SELECT od.order_details_id, od.order_id, od.product_id, o.user_id, o.delivery_status, o.order_place_date, o.payment_mode, od.price, p.product_name, p.product_thumb FROM kitchenstore.order_details od INNER JOIN kitchenstore.product p ON od.product_id=p.product_id INNER JOIN kitchenstore.order o ON od.order_id=o.order_id WHERE o.user_id=? ORDER BY od.order_details_id DESC";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, userId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Order order = new Order();
					order.setOrderDetailsId(resultSet.getLong("order_details_id"));
					order.setOrderId(resultSet.getLong("order_id"));
					order.setUserId(resultSet.getLong("user_id"));
					order.setPlaceOrderDate(resultSet.getString("order_place_date"));
					order.setPaymentMode(resultSet.getString("payment_mode"));
					order.setProductId(resultSet.getLong("product_id"));
					order.setProductName(resultSet.getString("product_name"));
					byte image[] = resultSet.getBytes("product_thumb");
					if (image != null && image.length > 0) {
						String imageString = Base64.getEncoder().encodeToString(image);
						order.setProductThumbString(imageString);
					}
					order.setPrice(resultSet.getFloat("price"));
					order.setDeliverStatus(resultSet.getInt("delivery_status"));
					orderList.add(order);
				}
			}
		}
		return orderList;
	}

	@Override
	public List<Order> fetchOrders(Connection connection) throws SQLException {
		List<Order> orderList = new ArrayList<Order>();
		String selectQuery = "SELECT o.order_id, o.user_id, o.order_place_date, o.payment_mode, o.total_amount, o.delivery_status, u.first_name, u.last_name, u.email FROM kitchenstore.order o INNER JOIN kitchenstore.user u ON o.user_id=u.user_id ORDER BY o.order_id DESC";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Order order = new Order();
					order.setOrderId(resultSet.getLong("order_id"));
					order.setUserId(resultSet.getLong("user_id"));
					order.setfName(resultSet.getString("first_name"));
					order.setlName(resultSet.getString("last_name"));
					order.setEmail(resultSet.getString("email"));
					order.setPlaceOrderDate(resultSet.getString("order_place_date"));
					order.setPaymentMode(resultSet.getString("payment_mode"));
					order.setPrice(resultSet.getFloat("total_amount"));
					order.setDeliverStatus(resultSet.getInt("delivery_status"));
					orderList.add(order);
				}
			}
		}
		return orderList;
	}

	@Override
	public Order fetchOrder(long oId, Connection connection) throws SQLException {
		Order order = new Order();
		String selectQuery = "SELECT o.order_id, o.user_id, o.address_id, o.order_place_date, o.payment_mode, o.total_amount, o.transaction_id, o.delivery_status, u.first_name, u.last_name, u.email FROM kitchenstore.order o INNER JOIN kitchenstore.user u ON o.user_id=u.user_id WHERE o.order_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, oId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					order.setOrderId(resultSet.getLong("order_id"));
					order.setUserId(resultSet.getLong("user_id"));
					order.setAddressId(resultSet.getLong("address_id"));
					order.setfName(resultSet.getString("first_name"));
					order.setlName(resultSet.getString("last_name"));
					order.setEmail(resultSet.getString("email"));
					order.setPlaceOrderDate(resultSet.getString("order_place_date"));
					order.setPaymentMode(resultSet.getString("payment_mode"));
					order.setTotalPrice(resultSet.getFloat("total_amount"));
					order.setTransactionId(resultSet.getString("transaction_id"));
					order.setDeliverStatus(resultSet.getInt("delivery_status"));
				}
			}
		}
		return order;
	}

	@Override
	public List<Order> fetchProducts(long oId, Connection connection) throws SQLException {
		List<Order> orderList = new ArrayList<Order>();
		String selectQuery = "SELECT od.order_details_id, od.product_id, od.price, od.quantity, p.product_name, p.product_thumb FROM kitchenstore.order_details od INNER JOIN kitchenstore.product p ON od.product_id=p.product_id WHERE od.order_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, oId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Order order = new Order();
					order.setOrderDetailsId(resultSet.getLong("order_details_id"));
					order.setProductId(resultSet.getLong("product_id"));
					order.setProductName(resultSet.getString("product_name"));
					byte image[] = resultSet.getBytes("product_thumb");
					if (image != null && image.length > 0) {
						String imageString = Base64.getEncoder().encodeToString(image);
						order.setProductThumbString(imageString);
					}
					order.setPrice(resultSet.getFloat("price"));
					order.setQty(resultSet.getInt("quantity"));
					orderList.add(order);
				}
			}
		}
		return orderList;
	}

	@Override
	public int updateDeliveryStatus(long oId, String deliveryStatus, Connection connection) throws SQLException {
		String updateQuery = "UPDATE kitchenstore.order SET delivery_status=? WHERE order_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, Integer.parseInt(deliveryStatus));
			preparedStatement.setLong(2, oId);
			return preparedStatement.executeUpdate();
		}
	}
}
