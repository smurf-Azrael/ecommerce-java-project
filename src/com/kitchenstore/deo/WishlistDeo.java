package com.kitchenstore.deo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Wishlist;

public interface WishlistDeo {

	List<Wishlist> fetchItems(long userId, Connection connection) throws SQLException;

	int setItem(long pId, long uId, Connection connection) throws SQLException;

	int deleteItem(long pId, Connection connection) throws SQLException;

	int deleteAllItem(long userId, Connection connection) throws SQLException;
}
