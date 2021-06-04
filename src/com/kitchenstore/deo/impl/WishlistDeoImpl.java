package com.kitchenstore.deo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.kitchenstore.bean.Wishlist;
import com.kitchenstore.deo.WishlistDeo;

public class WishlistDeoImpl implements WishlistDeo {

	@Override
	public List<Wishlist> fetchItems(long userId, Connection connection) throws SQLException {
		List<Wishlist> wishlistItems = new ArrayList<Wishlist>();
		String selectQuery = "SELECT w.product_id, product_name, price, product_thumb, wishlist_id, user_id FROM product p INNER JOIN wishlist w ON p.product_id = w.product_id where user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, userId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Wishlist wishlist = new Wishlist();
					wishlist.setWishlistId(resultSet.getLong("wishlist_id"));
					wishlist.setUserId(resultSet.getLong("user_id"));
					wishlist.setProductId(resultSet.getLong("product_id"));
					wishlist.setProductName(resultSet.getString("product_name"));
					byte image[] = resultSet.getBytes("product_thumb");
					if (image != null && image.length > 0) {
						String imageString = Base64.getEncoder().encodeToString(image);
						wishlist.setProductThumbString(imageString);
					}
					wishlist.setPrice(resultSet.getFloat("price"));
					wishlistItems.add(wishlist);
				}
			}
		}
		return wishlistItems;
	}

	@Override
	public int setItem(long pId, long uId, Connection connection) throws SQLException {
		String insertQuery = "Insert into wishlist(product_id,user_id) VALUES (?,?)";
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
			preparedStatement.setLong(1, pId);
			preparedStatement.setLong(2, uId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int deleteItem(long pId, Connection connection) throws SQLException {
		String deleteQuery = "delete from wishlist where wishlist_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setLong(1, pId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int deleteAllItem(long userId, Connection connection) throws SQLException {
		String deleteQuery = "delete from wishlist where user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setLong(1, userId);
			return preparedStatement.executeUpdate();
		}
	}
}
