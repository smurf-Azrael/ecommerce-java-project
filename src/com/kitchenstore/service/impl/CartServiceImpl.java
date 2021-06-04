package com.kitchenstore.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import com.kitchenstore.bean.Cart;
import com.kitchenstore.bean.Offer;
import com.kitchenstore.deo.CartDeo;
import com.kitchenstore.deo.OfferDeo;
import com.kitchenstore.deo.impl.CartDeoImpl;
import com.kitchenstore.deo.impl.OfferDeoImpl;
import com.kitchenstore.service.CartService;
import com.kitchenstore.utilities.JDBCConnection;

public class CartServiceImpl implements CartService {

	CartDeo cartDeo = new CartDeoImpl();
	OfferDeo offerDeo = new OfferDeoImpl();

	@Override
	public List<Cart> getItems(long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<Cart> itemList = cartDeo.fetchItems(userId, connection);
			if (itemList.size() > 0 && itemList != null) {
				for (Cart cartItem : itemList) {
					Offer offer = offerDeo.fetchProductOffer(cartItem.getProductId(), connection);
					if (offer.getOfferId() != 0) {
						if (offer.getStartDate().isEmpty() && offer.getEndDate().isEmpty()) {
							if (offer.getDiscountPrice() > 0) {
								cartItem.setDiscountPrice(offer.getDiscountPrice());
							} else {
								float rate = offer.getDiscountRate();
								float orinalPrice = cartItem.getPrice();
								float discountPrice = (orinalPrice * rate) / 100;
								discountPrice = orinalPrice - Math.round(discountPrice);
								cartItem.setDiscountPrice(discountPrice);
								cartItem.setDiscount(rate);
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
									cartItem.setDiscountPrice(offer.getDiscountPrice());
								} else {
									float rate = offer.getDiscountRate();
									float orinalPrice = cartItem.getPrice();
									float discountPrice = (orinalPrice * rate) / 100;
									discountPrice = orinalPrice - Math.round(discountPrice);
									cartItem.setDiscountPrice(discountPrice);
									cartItem.setDiscount(rate);
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
			int insertRow = cartDeo.setItem(pId, userId, connection);
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
	public boolean removeItem(long cId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int deleteRow = cartDeo.deleteItem(cId, connection);
			if (deleteRow == 1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean setQnty(long cId, int qty) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int updateRow = cartDeo.updateQnty(cId, qty, connection);
			if (updateRow == 1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean removeItemAll(long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int deleteRow = cartDeo.deleteAllItem(userId, connection);
			if (deleteRow == 1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
