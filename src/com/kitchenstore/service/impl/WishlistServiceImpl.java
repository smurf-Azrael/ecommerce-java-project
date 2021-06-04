package com.kitchenstore.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import com.kitchenstore.bean.Offer;
import com.kitchenstore.bean.Wishlist;
import com.kitchenstore.deo.OfferDeo;
import com.kitchenstore.deo.WishlistDeo;
import com.kitchenstore.deo.impl.OfferDeoImpl;
import com.kitchenstore.deo.impl.WishlistDeoImpl;
import com.kitchenstore.service.WishlistService;
import com.kitchenstore.utilities.JDBCConnection;

public class WishlistServiceImpl implements WishlistService {

	WishlistDeo wishlistDeo = new WishlistDeoImpl();
	OfferDeo offerDeo = new OfferDeoImpl();

	@Override
	public List<Wishlist> getItems(long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<Wishlist> itemList = wishlistDeo.fetchItems(userId, connection);
			if (itemList.size() > 0 && itemList != null) {
				for (Wishlist wishlistItem : itemList) {
					Offer offer = offerDeo.fetchProductOffer(wishlistItem.getProductId(), connection);
					if (offer.getOfferId() != 0) {
						if (offer.getStartDate().isEmpty() && offer.getEndDate().isEmpty()) {
							if (offer.getDiscountPrice() > 0) {
								wishlistItem.setDiscountPrice(offer.getDiscountPrice());
							} else {
								float rate = offer.getDiscountRate();
								float orinalPrice = wishlistItem.getPrice();
								float discountPrice = (orinalPrice * rate) / 100;
								discountPrice = orinalPrice - Math.round(discountPrice);
								wishlistItem.setDiscountPrice(discountPrice);
								wishlistItem.setDiscount(rate);
							}

						} else {

							// Initialize date
							LocalDate todayDate = LocalDate.now();
							LocalDate startDate = LocalDate.parse(offer.getStartDate());
							LocalDate endDate = LocalDate.parse(offer.getEndDate());

							// Offer Validation
							long startDiff = ChronoUnit.DAYS.between(startDate, todayDate);
							long endDiff = ChronoUnit.DAYS.between(todayDate, endDate);

							if (startDiff >= 0 && endDiff >= 0) {
								if (offer.getDiscountPrice() > 0) {
									wishlistItem.setDiscountPrice(offer.getDiscountPrice());
								} else {
									float rate = offer.getDiscountRate();
									float orinalPrice = wishlistItem.getPrice();
									float discountPrice = (orinalPrice * rate) / 100;
									discountPrice = orinalPrice - Math.round(discountPrice);
									wishlistItem.setDiscountPrice(discountPrice);
									wishlistItem.setDiscount(rate);
								}
							}
						}
					}
				}
				return itemList;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean addItem(long pId, long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int insertRow = wishlistDeo.setItem(pId, userId, connection);
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
	public boolean removeItem(long pId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int deleteRow = wishlistDeo.deleteItem(pId, connection);
			if (deleteRow == 1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean removeAllItem(long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int deleteRow = wishlistDeo.deleteAllItem(userId, connection);
			if (deleteRow == 1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
