package com.kitchenstore.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Offer;
import com.kitchenstore.deo.OfferDeo;
import com.kitchenstore.deo.impl.OfferDeoImpl;
import com.kitchenstore.service.OfferService;
import com.kitchenstore.utilities.JDBCConnection;

public class OfferServiceImpl implements OfferService {

	OfferDeo offerDeo = new OfferDeoImpl();

	@Override
	public boolean addOffer(Offer offer) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int insertRow = offerDeo.setOffer(offer, connection);
			if (insertRow == 1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Offer> getOfferList() {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<Offer> offerList = offerDeo.fetchOfferList(connection);
			return offerList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Offer getOffer(long offerId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			Offer offer = offerDeo.fetchOffer(offerId, connection);
			return offer;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean editOffer(Offer offer) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int updateRow = offerDeo.updateOffer(offer, connection);
			if (updateRow == 1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public int removeOffer(long offerId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int deleteRow = offerDeo.deleteOffer(offerId, connection);
			return deleteRow;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
