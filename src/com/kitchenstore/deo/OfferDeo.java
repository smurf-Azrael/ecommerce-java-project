package com.kitchenstore.deo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Offer;

public interface OfferDeo {

	int setOffer(Offer offer, Connection connection) throws SQLException;

	List<Offer> fetchOfferList(Connection connection) throws SQLException;

	Offer fetchOffer(long offerId, Connection connection) throws SQLException;

	int updateOffer(Offer offer, Connection connection) throws SQLException;

	int deleteOffer(long offerId, Connection connection) throws SQLException;

	Offer fetchProductOffer(long productId, Connection connection) throws SQLException;
}
