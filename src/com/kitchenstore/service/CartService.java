package com.kitchenstore.service;

import java.util.List;

import com.kitchenstore.bean.Cart;

public interface CartService {

	List<Cart> getItems(long userId);

	boolean addItem(long pId, long userId);

	boolean removeItem(long cId);

	boolean setQnty(long cId, int qty);

	boolean removeItemAll(long userId);

}
