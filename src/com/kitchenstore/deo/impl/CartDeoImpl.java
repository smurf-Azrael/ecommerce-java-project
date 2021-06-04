package com.kitchenstore.deo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.kitchenstore.bean.Cart;
import com.kitchenstore.deo.CartDeo;

public class CartDeoImpl implements CartDeo {

	@Override
	public List<Cart> fetchItems(long userId, Connection connection) throws SQLException {
		List<Cart> items = new ArrayList<Cart>();
		String selectQuery = "SELECT c.product_id, product_name, price, product_thumb, product_stock, cart_id, user_id, quantity FROM product p INNER JOIN cart c ON p.product_id = c.product_id where user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, userId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Cart cart = new Cart();
					cart.setCartId(resultSet.getLong("cart_id"));
					cart.setUserId(resultSet.getLong("user_id"));
					cart.setProductId(resultSet.getLong("product_id"));
					cart.setProductName(resultSet.getString("product_name"));
					byte image[] = resultSet.getBytes("product_thumb");
					if (image != null && image.length > 0) {
						String imageString = Base64.getEncoder().encodeToString(image);
						cart.setProductThumbString(imageString);
					}
					cart.setPrice(resultSet.getFloat("price"));
					cart.setQnty(resultSet.getInt("quantity"));
					cart.setProductStock(resultSet.getLong("product_stock"));
					items.add(cart);
				}
			}
		}
		return items;
	}

	@Override
	public int setItem(long pId, long userId, Connection connection) throws SQLException {
		String insertQuery = "Insert into cart(product_id,user_id,quantity) VALUES (?,?,?)";
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
			preparedStatement.setLong(1, pId);
			preparedStatement.setLong(2, userId);
			preparedStatement.setInt(3, 1);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int deleteItem(long cId, Connection connection) throws SQLException {
		String deleteQuery = "delete from cart where cart_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setLong(1, cId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int updateQnty(long cId, int qty, Connection connection) throws SQLException {
		String deleteQuery = "UPDATE cart SET quantity=? where cart_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setInt(1, qty);
			preparedStatement.setLong(2, cId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int deleteAllItem(long userId, Connection connection) throws SQLException {
		String deleteQuery = "delete from cart where user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setLong(1, userId);
			return preparedStatement.executeUpdate();
		}
	}

}
