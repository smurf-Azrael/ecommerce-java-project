package com.kitchenstore.service;

import java.util.List;

import com.kitchenstore.bean.Offer;

public interface OfferService {

	boolean addOffer(Offer offer);

	List<Offer> getOfferList();

	Offer getOffer(long offerId);

	boolean editOffer(Offer offer);

	int removeOffer(long offerId);

}
