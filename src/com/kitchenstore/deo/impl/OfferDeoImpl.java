package com.kitchenstore.deo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kitchenstore.bean.Offer;
import com.kitchenstore.deo.OfferDeo;

public class OfferDeoImpl implements OfferDeo {

	@Override
	public int setOffer(Offer offer, Connection connection) throws SQLException {
		String insertQuery = "Insert into offer(product_id, discount, discount_price, start_date, end_date, status) VALUES (?,?,?,?,?,?)";
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
			preparedStatement.setLong(1, offer.getProductId());
			preparedStatement.setFloat(2, offer.getDiscountRate());
			preparedStatement.setFloat(3, offer.getDiscountPrice());
			preparedStatement.setString(4, offer.getStartDate());
			preparedStatement.setString(5, offer.getEndDate());
			preparedStatement.setInt(6, 0);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<Offer> fetchOfferList(Connection connection) throws SQLException {
		List<Offer> offerList = new ArrayList<Offer>();
		String selectQuery = "SELECT p.product_id, product_name, offer_id, discount, o.discount_price, start_date, end_date, status FROM offer o INNER JOIN product p ON o.product_id=p.product_id where status=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Offer offer = new Offer();
					offer.setProductId(resultSet.getLong("product_id"));
					offer.setProductName(resultSet.getString("product_name"));
					offer.setOfferId(resultSet.getLong("offer_id"));
					offer.setDiscountPrice(resultSet.getFloat("discount_price"));
					offer.setDiscountRate(resultSet.getFloat("discount"));
					offer.setStartDate(resultSet.getString("start_date"));
					offer.setEndDate(resultSet.getString("end_date"));
					offerList.add(offer);
				}
			}
		}
		return offerList;
	}

	@Override
	public Offer fetchOffer(long offerId, Connection connection) throws SQLException {
		Offer offer = new Offer();
		String selectQuery = "SELECT p.product_id, product_name, offer_id, discount, o.discount_price, start_date, end_date, status FROM offer o INNER JOIN product p ON o.product_id=p.product_id where offer_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, offerId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					offer.setProductId(resultSet.getLong("product_id"));
					offer.setProductName(resultSet.getString("product_name"));
					offer.setOfferId(resultSet.getLong("offer_id"));
					offer.setDiscountPrice(resultSet.getFloat("discount_price"));
					offer.setDiscountRate(resultSet.getFloat("discount"));
					offer.setStartDate(resultSet.getString("start_date"));
					offer.setEndDate(resultSet.getString("end_date"));
				}
			}
		}
		return offer;
	}

	@Override
	public int updateOffer(Offer offer, Connection connection) throws SQLException {
		String updateQuery = "UPDATE offer SET discount=?, discount_price=?, start_date=?, end_date=? where offer_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setFloat(1, offer.getDiscountRate());
			preparedStatement.setFloat(2, offer.getDiscountPrice());
			preparedStatement.setString(3, offer.getStartDate());
			preparedStatement.setString(4, offer.getEndDate());
			preparedStatement.setLong(5, offer.getOfferId());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int deleteOffer(long offerId, Connection connection) throws SQLException {
		String deleteQuery = "DELETE FROM offer where offer_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setLong(1, offerId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public Offer fetchProductOffer(long productId, Connection connection) throws SQLException {
		Offer offer = new Offer();
		String selectQuery = "SELECT offer_id, discount, discount_price, start_date, end_date FROM offer where product_id=? AND status=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, productId);
			preparedStatement.setInt(2, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					offer.setOfferId(resultSet.getLong("offer_id"));
					offer.setDiscountPrice(resultSet.getFloat("discount_price"));
					offer.setDiscountRate(resultSet.getFloat("discount"));
					offer.setStartDate(resultSet.getString("start_date"));
					offer.setEndDate(resultSet.getString("end_date"));
				}
			}
		}
		return offer;
	}

}
