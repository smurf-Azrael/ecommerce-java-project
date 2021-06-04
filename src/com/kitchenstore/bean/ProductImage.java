package com.kitchenstore.bean;

import java.io.InputStream;

public class ProductImage extends Product {
	private long pImageId;
	private String productImageString;
	private InputStream productImage;

	public long getpImageId() {
		return pImageId;
	}

	public void setpImageId(long pImageId) {
		this.pImageId = pImageId;
	}

	public String getProductImageString() {
		return productImageString;
	}

	public void setProductImageString(String productImageString) {
		this.productImageString = productImageString;
	}

	public InputStream getProductImage() {
		return productImage;
	}

	public void setProductImage(InputStream productImage) {
		this.productImage = productImage;
	}
}
