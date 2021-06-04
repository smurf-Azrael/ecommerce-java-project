package com.kitchenstore.deo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Cart;

public interface CartDeo {

	List<Cart> fetchItems(long userId, Connection connection) throws SQLException;

	int setItem(long pId, long userId, Connection connection) throws SQLException;

	int deleteItem(long cId, Connection connection) throws SQLException;

	int updateQnty(long cId, int qty, Connection connection) throws SQLException;

	int deleteAllItem(long userId, Connection connection) throws SQLException;
}
