package com.kitchenstore.deo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.kitchenstore.bean.SubCategory;
import com.kitchenstore.deo.SubCategoryDeo;

public class SubCategoryDeoImpl implements SubCategoryDeo {

	@Override
	public int setSubCategory(SubCategory subCategory, Connection connection) throws SQLException {
		String insertQuery = "Insert into sub_category(sub_category_name, category_id, insertion_date, is_remove) VALUES (?,?,?,?)";
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		String insertDate = currentDateTime.format(formatter);
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
			preparedStatement.setString(1, subCategory.getSubCategoryName());
			preparedStatement.setInt(2, subCategory.getCategoryId());
			preparedStatement.setString(3, insertDate);
			preparedStatement.setInt(4, 0);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<SubCategory> fetchSubCategoryList(Connection connection) throws SQLException {
		List<SubCategory> subCategoryList = new ArrayList<SubCategory>();
		String selectQuery = "SELECT sub_category_id, sub_category_name, category_name, s.category_id FROM sub_category s INNER JOIN category c ON c.category_id = s.category_id WHERE s.is_remove=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					SubCategory subCategory = new SubCategory();
					subCategory.setSubCategoryId(resultSet.getInt("sub_category_id"));
					subCategory.setSubCategoryName(resultSet.getString("sub_category_name"));
					subCategory.setCategoryName(resultSet.getString("category_name"));
					subCategory.setCategoryId(resultSet.getInt("category_id"));
					subCategoryList.add(subCategory);
				}
			}
		}
		return subCategoryList;
	}

	@Override
	public int deleteSubCategory(int subCategoryId, Connection connection) throws SQLException {
		String updateQuery = "UPDATE sub_category SET is_remove=? where sub_category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, 1);
			preparedStatement.setInt(2, subCategoryId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public SubCategory fetchSubCategory(int subCategoryId, Connection connection) throws SQLException {
		SubCategory subCategory = new SubCategory();
		String selectQuery = "SELECT sub_category_id, sub_category_name, category_name FROM sub_category s INNER JOIN category c ON c.category_id = s.category_id WHERE sub_category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, subCategoryId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					subCategory.setSubCategoryId(resultSet.getInt("sub_category_id"));
					subCategory.setSubCategoryName(resultSet.getString("sub_category_name"));
					subCategory.setCategoryName(resultSet.getString("category_name"));
				}
			}
		}
		return subCategory;
	}

	@Override
	public int updateSubCategory(SubCategory subCategory, Connection connection) throws SQLException {
		String updateQuery = "update sub_category set sub_category_name=?, category_id=? where sub_category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, subCategory.getSubCategoryName());
			preparedStatement.setInt(2, subCategory.getCategoryId());
			preparedStatement.setInt(3, subCategory.getSubCategoryId());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int deleteSubCategories(int categoryId, Connection connection) throws SQLException {
		String updateQuery = "UPDATE sub_category SET is_remove=? where category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, 1);
			preparedStatement.setInt(2, categoryId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<SubCategory> fetchSubCategoryList(int categproyId, Connection connection) throws SQLException {
		List<SubCategory> subCategoryList = new ArrayList<SubCategory>();
		String selectQuery = "SELECT sub_category_id, sub_category_name, category_name, s.category_id FROM sub_category s INNER JOIN category c ON c.category_id = s.category_id WHERE s.is_remove=? AND s.category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setInt(2, categproyId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					SubCategory subCategory = new SubCategory();
					subCategory.setSubCategoryId(resultSet.getInt("sub_category_id"));
					subCategory.setSubCategoryName(resultSet.getString("sub_category_name"));
					subCategory.setCategoryName(resultSet.getString("category_name"));
					subCategory.setCategoryId(resultSet.getInt("category_id"));
					subCategoryList.add(subCategory);
				}
			}
		}
		return subCategoryList;
	}

}
