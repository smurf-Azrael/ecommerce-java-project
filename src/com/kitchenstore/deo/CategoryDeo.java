package com.kitchenstore.deo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Category;

public interface CategoryDeo {

	int setcategory(String categoryName, Connection connection) throws SQLException;

	List<Category> fetchCategoryList(Connection connection) throws SQLException;

	int deleteCategory(int categoryId, Connection connection) throws SQLException;

	Category fetchCategory(int categoryId, Connection connection) throws SQLException;

	int updateCategory(Category category, Connection connection) throws SQLException;
}