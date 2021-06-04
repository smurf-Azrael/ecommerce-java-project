package com.kitchenstore.service;

import java.util.List;

import com.kitchenstore.bean.Order;

public interface OrderService {

	boolean makeOrder(Order orderDetails);

	List<Order> getItems(long userId);

	List<Order> getAllOrders();

	Order getOrder(long oId);

	List<Order> getProducts(long oId);

	boolean changeDeliveryStatus(long oId, String deliveryStatus);

}
