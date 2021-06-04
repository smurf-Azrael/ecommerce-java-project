package com.kitchenstore.deo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.kitchenstore.bean.Cart;
import com.kitchenstore.bean.Feedback;
import com.kitchenstore.bean.Product;
import com.kitchenstore.bean.ProductImage;
import com.kitchenstore.deo.ProductDeo;

public class ProductDeoImpl implements ProductDeo {

	@Override
	public int setProduct(Product product, Connection connection) throws SQLException {
		String insertQuery = "Insert into product(product_name, category_id, sub_category_id, more_info, description, price, product_thumb, insertion_date, product_stock, is_remove) VALUES (?,?,?,?,?,?,?,?,?,?)";
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		String insertDate = currentDateTime.format(formatter);
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
			preparedStatement.setString(1, product.getProductName());
			preparedStatement.setInt(2, product.getCategoryId());
			preparedStatement.setInt(3, product.getSubCategoryId());
			preparedStatement.setString(4, product.getMoreIndfo());
			preparedStatement.setString(5, product.getDes());
			preparedStatement.setFloat(6, product.getPrice());
			preparedStatement.setBlob(7, product.getProductThumb());
			preparedStatement.setString(8, insertDate);
			preparedStatement.setInt(9, 0);
			preparedStatement.setInt(10, 0);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<Product> fetchProductList(Connection connection) throws SQLException {
		List<Product> productList = new ArrayList<Product>();
		String selectQuery = "SELECT product_id, product_name, c.category_id, category_name, s.sub_category_id, sub_category_name, more_info, description, product_stock, price, product_thumb FROM product p INNER JOIN category c ON p.category_id = c.category_id INNER JOIN sub_category s ON p.sub_category_id=s.sub_category_id where p.is_remove=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Product product = new Product();
					product.setProductId(resultSet.getLong("product_id"));
					product.setProductName(resultSet.getString("product_name"));
					product.setDes(resultSet.getString("description"));
					product.setMoreIndfo(resultSet.getString("more_info"));
					byte image[] = resultSet.getBytes("product_thumb");
					if (image != null && image.length > 0) {
						String imageString = Base64.getEncoder().encodeToString(image);
						product.setProductThumbString(imageString);
					}
					product.setProductStock(resultSet.getLong("product_stock"));
					product.setPrice(resultSet.getFloat("price"));
					product.setSubCategoryId(resultSet.getInt("sub_category_id"));
					product.setSubCategoryName(resultSet.getString("sub_category_name"));
					product.setCategoryName(resultSet.getString("category_name"));
					product.setCategoryId(resultSet.getInt("category_id"));
					productList.add(product);
				}
			}
		}
		return productList;

	}

	@Override
	public Product fetchProduct(int productId, Connection connection) throws SQLException {
		Product product = new Product();
		String selectQuery = "SELECT product_id, product_name, c.category_id, category_name, s.sub_category_id, sub_category_name, more_info, description, product_stock, price, product_thumb FROM product p INNER JOIN category c ON p.category_id = c.category_id INNER JOIN sub_category s ON p.sub_category_id=s.sub_category_id where product_id=? AND p.is_remove=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, productId);
			preparedStatement.setInt(2, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					product.setProductId(resultSet.getLong("product_id"));
					product.setProductName(resultSet.getString("product_name"));
					product.setDes(resultSet.getString("description"));
					product.setMoreIndfo(resultSet.getString("more_info"));
					byte image[] = resultSet.getBytes("product_thumb");
					if (image != null && image.length > 0) {
						String imageString = Base64.getEncoder().encodeToString(image);
						product.setProductThumbString(imageString);
					}
					product.setProductStock(resultSet.getLong("product_stock"));
					product.setPrice(resultSet.getFloat("price"));
					product.setSubCategoryId(resultSet.getInt("sub_category_id"));
					product.setSubCategoryName(resultSet.getString("sub_category_name"));
					product.setCategoryName(resultSet.getString("category_name"));
					product.setCategoryId(resultSet.getInt("category_id"));

				}
			}
		}
		return product;
	}

	@Override
	public int deleteProduct(long productId, Connection connection) throws SQLException {
		String updateQuery = "update product set is_remove=? where product_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, 1);
			preparedStatement.setLong(2, productId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int updateProduct(Product product, Connection connection) throws SQLException {
		String updateQuery = "UPDATE product SET product_name=?, category_id=?, sub_category_id=?, more_info=?, description=?, price=?, product_thumb=COALESCE(?,product_thumb) where product_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, product.getProductName());
			preparedStatement.setInt(2, product.getCategoryId());
			preparedStatement.setInt(3, product.getSubCategoryId());
			preparedStatement.setString(4, product.getMoreIndfo());
			preparedStatement.setString(5, product.getDes());
			preparedStatement.setFloat(6, product.getPrice());
			preparedStatement.setBlob(7, product.getProductThumb());
			preparedStatement.setLong(8, product.getProductId());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int updateStock(long productId, long productock, Connection connection) throws SQLException {
		String updateQuery = "update product set product_stock=? where product_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setLong(1, productock);
			preparedStatement.setLong(2, productId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<ProductImage> fetchProductImage(long productId, Connection connection) throws SQLException {
		List<ProductImage> productImages = new ArrayList<ProductImage>();
		String selectQuery = "SELECT gallery_id, images FROM gallery where product_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, productId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					ProductImage productImage = new ProductImage();
					productImage.setpImageId(resultSet.getLong("gallery_id"));
					byte image[] = resultSet.getBytes("images");
					if (image != null && image.length > 0) {
						String imageString = Base64.getEncoder().encodeToString(image);
						productImage.setProductImageString(imageString);
						productImages.add(productImage);
					}
				}
			}
		}
		return productImages;
	}

	@Override
	public int updatePImage(ProductImage productImage, Connection connection) throws SQLException {
		String updateQuery = "UPDATE gallery SET images=COALESCE(?,images) where gallery_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setBlob(1, productImage.getProductImage());
			preparedStatement.setLong(2, productImage.getpImageId());
			return preparedStatement.executeUpdate();
		}

	}

	@Override
	public int setImage(ProductImage productImage, Connection connection) throws SQLException {
		String updateQuery = "Insert into gallery(product_id, images) VALUES (?,?)";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setLong(1, productImage.getProductId());
			preparedStatement.setBlob(2, productImage.getProductImage());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int deleteProductImage(long imageId, Connection connection) throws SQLException {
		String updateQuery = "delete from gallery where gallery_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setLong(1, imageId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<Product> fetchProductList(int subCategoryId, Connection connection) throws SQLException {
		List<Product> productList = new ArrayList<Product>();
		String selectQuery = "SELECT product_id, product_name, c.category_id, category_name, s.sub_category_id, sub_category_name, more_info, description, product_stock, price, product_thumb FROM product p INNER JOIN category c ON p.category_id = c.category_id INNER JOIN sub_category s ON p.sub_category_id=s.sub_category_id where p.is_remove=? AND p.sub_category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setInt(2, subCategoryId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Product product = new Product();
					product.setProductId(resultSet.getLong("product_id"));
					product.setProductName(resultSet.getString("product_name"));
					product.setDes(resultSet.getString("description"));
					product.setMoreIndfo(resultSet.getString("more_info"));
					byte image[] = resultSet.getBytes("product_thumb");
					if (image != null && image.length > 0) {
						String imageString = Base64.getEncoder().encodeToString(image);
						product.setProductThumbString(imageString);
					}
					product.setProductStock(resultSet.getLong("product_stock"));
					product.setPrice(resultSet.getFloat("price"));
					product.setSubCategoryId(resultSet.getInt("sub_category_id"));
					product.setSubCategoryName(resultSet.getString("sub_category_name"));
					product.setCategoryName(resultSet.getString("category_name"));
					product.setCategoryId(resultSet.getInt("category_id"));
					productList.add(product);
				}
			}
		}
		return productList;
	}

	@Override
	public int updateStock(List<Cart> productList, Connection connection) throws SQLException {
		String updateQuery = "update kitchenstore.product set product_stock=? where product_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			for (Cart product : productList) {
				preparedStatement.setLong(1, (product.getProductStock() - product.getQnty()));
				preparedStatement.setLong(2, product.getProductId());
				preparedStatement.addBatch();
			}
			int inserted[] = preparedStatement.executeBatch();
			if (inserted.length > 0) {
				return 1;
			} else {
				return 0;
			}
		}
	}

	@Override
	public int setFeedback(Feedback feedback, Connection connection) throws SQLException {
		String updateQuery = "INSERT INTO kitchenstore.feedback (user_id, product_id, description, rating, feedback_date) VALUES (?, ?, ?, ?, ?)";
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		String insertDate = currentDateTime.format(formatter);
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setLong(1, feedback.getUserId());
			preparedStatement.setLong(2, feedback.getProductId());
			preparedStatement.setString(3, feedback.getDes());
			preparedStatement.setFloat(4, feedback.getRate());
			preparedStatement.setString(5, insertDate);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<Feedback> fetchFeedback(long productId, Connection connection) throws SQLException {
		List<Feedback> feedbacks = new ArrayList<Feedback>();
		String selectQuery = "SELECT f.feedback_id, u.user_id, u.first_name, u.last_name, f.product_id, f.description, f.rating, f.feedback_date FROM kitchenstore.feedback f INNER JOIN  kitchenstore.user u ON f.user_id=u.user_id WHERE f.product_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, productId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Feedback feedback = new Feedback();
					feedback.setFeedbackId(resultSet.getLong("feedback_id"));
					feedback.setUserId(resultSet.getLong("user_id"));
					feedback.setfName(resultSet.getString("first_name"));
					feedback.setlName(resultSet.getString("last_name"));
					feedback.setProductId(resultSet.getLong("product_id"));
					feedback.setDes(resultSet.getString("description"));
					feedback.setRate(resultSet.getFloat("rating"));
					feedback.setFeedbackDate(resultSet.getString("feedback_date"));
					feedbacks.add(feedback);
				}
			}
		}
		return feedbacks;
	}

	@Override
	public int getCurrentStock(long productId, Connection connection) throws SQLException {
		String selectQuery = "SELECT product_stock FROM product where product_id=? AND is_remove=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, productId);
			preparedStatement.setInt(2, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					return resultSet.getInt("product_stock");
				}
			}
		}
		return 0;
	}

	@Override
	public List<Feedback> fetchFeedback(Connection connection) throws SQLException {
		List<Feedback> feedbacks = new ArrayList<Feedback>();
		String selectQuery = "SELECT f.feedback_id, u.user_id, u.first_name, u.last_name, f.product_id, f.description, f.rating, f.feedback_date, p.product_name FROM kitchenstore.feedback f INNER JOIN  kitchenstore.user u ON f.user_id=u.user_id INNER JOIN kitchenstore.product p  ON f.product_id=p.product_id ORDER BY f.feedback_id DESC";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Feedback feedback = new Feedback();
					feedback.setFeedbackId(resultSet.getLong("feedback_id"));
					feedback.setUserId(resultSet.getLong("user_id"));
					feedback.setfName(resultSet.getString("first_name"));
					feedback.setlName(resultSet.getString("last_name"));
					feedback.setProductId(resultSet.getLong("product_id"));
					feedback.setProductName(resultSet.getString("product_name"));
					feedback.setDes(resultSet.getString("description"));
					feedback.setRate(resultSet.getFloat("rating"));
					feedback.setFeedbackDate(resultSet.getString("feedback_date"));
					feedbacks.add(feedback);
				}
			}
		}
		return feedbacks;
	}

	@Override
	public int deleteFeedback(long feedbackId, Connection connection) throws SQLException {
		String deleteQuery = "DELETE FROM kitchenstore.feedback WHERE feedback_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setLong(1, feedbackId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<Product> fetchSerchItems(String query, Connection connection) throws SQLException {
		List<Product> productList = new ArrayList<Product>();
		String selectQuery = "SELECT product_id, product_name, c.category_id, category_name, s.sub_category_id, sub_category_name, more_info, description, product_stock, price, product_thumb FROM product p INNER JOIN category c ON p.category_id = c.category_id INNER JOIN sub_category s ON p.sub_category_id=s.sub_category_id where p.is_remove=? AND p.product_name LIKE '%"
				+ query + "%'";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Product product = new Product();
					product.setProductId(resultSet.getLong("product_id"));
					product.setProductName(resultSet.getString("product_name"));
					product.setDes(resultSet.getString("description"));
					product.setMoreIndfo(resultSet.getString("more_info"));
					byte image[] = resultSet.getBytes("product_thumb");
					if (image != null && image.length > 0) {
						String imageString = Base64.getEncoder().encodeToString(image);
						product.setProductThumbString(imageString);
					}
					product.setProductStock(resultSet.getLong("product_stock"));
					product.setPrice(resultSet.getFloat("price"));
					product.setSubCategoryId(resultSet.getInt("sub_category_id"));
					product.setSubCategoryName(resultSet.getString("sub_category_name"));
					product.setCategoryName(resultSet.getString("category_name"));
					product.setCategoryId(resultSet.getInt("category_id"));
					productList.add(product);
				}
			}
		}
		return productList;
	}

	@Override
	public List<Product> fetchProductList(int subCategoryId, float startingPrice, float endingPrice,
			Connection connection) throws SQLException {
		List<Product> productList = new ArrayList<Product>();
		String selectQuery = "SELECT product_id, product_name, c.category_id, category_name, s.sub_category_id, sub_category_name, more_info, description, product_stock, price, product_thumb FROM product p INNER JOIN category c ON p.category_id = c.category_id INNER JOIN sub_category s ON p.sub_category_id=s.sub_category_id where p.is_remove=? AND p.sub_category_id=? AND (p.price >? AND p.price <?)";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setInt(2, subCategoryId);
			preparedStatement.setFloat(3, startingPrice);
			preparedStatement.setFloat(4, endingPrice);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Product product = new Product();
					product.setProductId(resultSet.getLong("product_id"));
					product.setProductName(resultSet.getString("product_name"));
					product.setDes(resultSet.getString("description"));
					product.setMoreIndfo(resultSet.getString("more_info"));
					byte image[] = resultSet.getBytes("product_thumb");
					if (image != null && image.length > 0) {
						String imageString = Base64.getEncoder().encodeToString(image);
						product.setProductThumbString(imageString);
					}
					product.setProductStock(resultSet.getLong("product_stock"));
					product.setPrice(resultSet.getFloat("price"));
					product.setSubCategoryId(resultSet.getInt("sub_category_id"));
					product.setSubCategoryName(resultSet.getString("sub_category_name"));
					product.setCategoryName(resultSet.getString("category_name"));
					product.setCategoryId(resultSet.getInt("category_id"));
					productList.add(product);
				}
			}
		}
		return productList;
	}

	@Override
	public int deleteProducts(int categoryId, Connection connection) throws SQLException {
		String updateQuery = "update product set is_remove=? where category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, 1);
			preparedStatement.setLong(2, categoryId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int deleteProducts(long subCategoryId, Connection connection) throws SQLException {
		String updateQuery = "update product set is_remove=? where sub_category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, 1);
			preparedStatement.setLong(2, subCategoryId);
			return preparedStatement.executeUpdate();
		}
	}

}
