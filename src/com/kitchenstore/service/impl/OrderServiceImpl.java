package com.kitchenstore.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Cart;
import com.kitchenstore.bean.Order;
import com.kitchenstore.bean.Product;
import com.kitchenstore.deo.OrderDeo;
import com.kitchenstore.deo.ProductDeo;
import com.kitchenstore.deo.impl.OrderDeoImpl;
import com.kitchenstore.deo.impl.ProductDeoImpl;
import com.kitchenstore.service.OrderService;
import com.kitchenstore.utilities.JDBCConnection;

public class OrderServiceImpl implements OrderService {

	OrderDeo orderDeo = new OrderDeoImpl();
	ProductDeo productDeo = new ProductDeoImpl();

	@Override
	public boolean makeOrder(Order orderDetails) {

		Connection connection = null;
		connection = JDBCConnection.getConnection();
		boolean isSetted = false;
		try {
			connection.setAutoCommit(false);
			long orderId = orderDeo.setOrderDetails(orderDetails, connection);
			int isInserted = orderDeo.setOrderedProDetails(orderDetails, orderId, connection);

			for (Cart items : orderDetails.getProductList()) {
				Product product = productDeo.fetchProduct((int) items.getProductId(), connection);
				items.setProductStock(product.getProductStock());
			}
			int isDeducted = productDeo.updateStock(orderDetails.getProductList(), connection);
			connection.commit();
			isSetted = true;
		} catch (Exception e) {
			try {
				connection.rollback();
				isSetted = false;
			} catch (SQLException e1) {
				// TODOAuto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSetted;

	}

	@Override
	public List<Order> getItems(long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<Order> orderList = orderDeo.fetchOrderItem(userId, connection);
			return orderList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Order> getAllOrders() {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<Order> orderList = orderDeo.fetchOrders(connection);
			return orderList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Order getOrder(long oId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			Order order = orderDeo.fetchOrder(oId, connection);
			return order;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Order> getProducts(long oId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<Order> orderList = orderDeo.fetchProducts(oId, connection);
			return orderList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean changeDeliveryStatus(long oId, String deliveryStatus) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int updateRow = orderDeo.updateDeliveryStatus(oId, deliveryStatus, connection);
			if (updateRow == 1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
