package com.kitchenstore.service;

import java.util.List;

import com.kitchenstore.bean.Wishlist;

public interface WishlistService {

	List<Wishlist> getItems(long userId);

	boolean addItem(long pId, long userId);

	boolean removeItem(long pId);

	boolean removeAllItem(long userId);

}
