package com.kitchenstore.deo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.kitchenstore.bean.Category;
import com.kitchenstore.deo.CategoryDeo;

public class CategoryDeoImpl implements CategoryDeo {

	@Override
	public int setcategory(String categoryName, Connection connection) throws SQLException {
		String insertQuery = "Insert into category(category_name, insertion_date, is_remove) VALUES (?,?,?)";
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		String insertDate = currentDateTime.format(formatter);
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
			preparedStatement.setString(1, categoryName);
			preparedStatement.setString(2, insertDate);
			preparedStatement.setInt(3, 0);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<Category> fetchCategoryList(Connection connection) throws SQLException {
		List<Category> categoryList = new ArrayList<Category>();
		String selectQuery = "SELECT category_id, category_name FROM category WHERE is_remove=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Category category = new Category();
					category.setCategoryId(resultSet.getInt("category_id"));
					category.setCategoryName(resultSet.getString("category_name"));
					categoryList.add(category);
				}
			}
		}
		return categoryList;
	}

	@Override
	public int deleteCategory(int categoryId, Connection connection) throws SQLException {
		String updateQuery = "update category set is_remove=? where category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, 1);
			preparedStatement.setLong(2, categoryId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public Category fetchCategory(int categoryId, Connection connection) throws SQLException {
		Category category = new Category();
		String selectQuery = "SELECT category_id, category_name FROM category WHERE category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, categoryId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					category.setCategoryId(resultSet.getInt("category_id"));
					category.setCategoryName(resultSet.getString("category_name"));
				}
			}
		}
		return category;
	}

	@Override
	public int updateCategory(Category category, Connection connection) throws SQLException {
		String updateQuery = "update category set category_name=? where category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, category.getCategoryName());
			preparedStatement.setLong(2, category.getCategoryId());
			return preparedStatement.executeUpdate();
		}
	}

}
