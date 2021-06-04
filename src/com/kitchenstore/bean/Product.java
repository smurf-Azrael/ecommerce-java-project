package com.kitchenstore.bean;

import java.io.InputStream;
import java.util.List;

public class Product extends SubCategory {
	private long productId, productStock;
	private String productName, des, moreIndfo, productThumbString;
	private float price, discount, discountPrice;
	private InputStream productThumb;
	private List<Feedback> feedbackList;

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getMoreIndfo() {
		return moreIndfo;
	}

	public void setMoreIndfo(String moreIndfo) {
		this.moreIndfo = moreIndfo;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public long getProductStock() {
		return productStock;
	}

	public void setProductStock(long productStock) {
		this.productStock = productStock;
	}

	public String getProductThumbString() {
		return productThumbString;
	}

	public void setProductThumbString(String productThumbString) {
		this.productThumbString = productThumbString;
	}

	public InputStream getProductThumb() {
		return productThumb;
	}

	public void setProductThumb(InputStream productThumb) {
		this.productThumb = productThumb;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(float discountPrice) {
		this.discountPrice = discountPrice;
	}

	public List<Feedback> getFeedbackList() {
		return feedbackList;
	}

	public void setFeedbackList(List<Feedback> feedbackList) {
		this.feedbackList = feedbackList;
	}

}
