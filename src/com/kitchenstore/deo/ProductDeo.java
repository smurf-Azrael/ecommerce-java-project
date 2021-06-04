package com.kitchenstore.deo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Cart;
import com.kitchenstore.bean.Feedback;
import com.kitchenstore.bean.Product;
import com.kitchenstore.bean.ProductImage;

public interface ProductDeo {

	int setProduct(Product product, Connection connection) throws SQLException;

	List<Product> fetchProductList(Connection connection) throws SQLException;

	Product fetchProduct(int productId, Connection connection) throws SQLException;

	int deleteProduct(long productId, Connection connection) throws SQLException;

	int updateProduct(Product product, Connection connection) throws SQLException;

	int updateStock(long productId, long productock, Connection connection) throws SQLException;

	int getCurrentStock(long productId, Connection connection) throws SQLException;

	List<ProductImage> fetchProductImage(long productId, Connection connection) throws SQLException;

	int updatePImage(ProductImage productImage, Connection connection) throws SQLException;

	int setImage(ProductImage productImage, Connection connection) throws SQLException;

	int deleteProductImage(long imageId, Connection connection) throws SQLException;

	List<Product> fetchProductList(int subCategoryId, Connection connection) throws SQLException;

	int updateStock(List<Cart> productList, Connection connection) throws SQLException;

	int setFeedback(Feedback feedback, Connection connection) throws SQLException;

	List<Feedback> fetchFeedback(long productId, Connection connection) throws SQLException;

	List<Feedback> fetchFeedback(Connection connection) throws SQLException;

	int deleteFeedback(long feedbackId, Connection connection) throws SQLException;

	List<Product> fetchSerchItems(String query, Connection connection) throws SQLException;

	List<Product> fetchProductList(int subCategoryId, float startingPrice, float endingPrice, Connection connection)
			throws SQLException;

	int deleteProducts(int categoryId, Connection connection) throws SQLException;

	int deleteProducts(long subCategoryId, Connection connection) throws SQLException;

}
