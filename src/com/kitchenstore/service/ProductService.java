package com.kitchenstore.service;

import java.util.List;

import com.kitchenstore.bean.Feedback;
import com.kitchenstore.bean.Product;
import com.kitchenstore.bean.ProductImage;

public interface ProductService {

	Boolean addProduct(Product product);

	List<Product> getProductList();

	Product getProduct(int productId);

	int removeProduct(long productId);

	boolean editProduct(Product product);

	boolean editStock(long productId, long productock);

	List<ProductImage> getProductImages(long productId);

	boolean updateImage(ProductImage productImage);

	boolean addImage(ProductImage productImage);

	boolean removeProductImage(long imageId);

	List<Product> getProductList(int subCategoryId);

	boolean giveFeedback(Feedback feedback);

	List<Feedback> getFeedbackList(long pId);

	List<Feedback> getFeedbackList();

	int removeFeedback(long feedbackId);

	List<Product> getSearchItems(String query);

	List<Product> getProductList(int subCategoryId, float startingPrice, float endingPrice);

}
