package com.kitchenstore.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Category;
import com.kitchenstore.deo.CategoryDeo;
import com.kitchenstore.deo.ProductDeo;
import com.kitchenstore.deo.SubCategoryDeo;
import com.kitchenstore.deo.impl.CategoryDeoImpl;
import com.kitchenstore.deo.impl.ProductDeoImpl;
import com.kitchenstore.deo.impl.SubCategoryDeoImpl;
import com.kitchenstore.service.CategoryService;
import com.kitchenstore.utilities.JDBCConnection;

public class CategoryServiceImpl implements CategoryService {

	CategoryDeo categoryDeo = new CategoryDeoImpl();
	SubCategoryDeo subCategoryDeo = new SubCategoryDeoImpl();
	ProductDeo productDeo = new ProductDeoImpl();

	@Override
	public boolean addCategory(String categoryName) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int insertRow = categoryDeo.setcategory(categoryName, connection);
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
	public List<Category> getCategoryList() {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<Category> categoryList = categoryDeo.fetchCategoryList(connection);
			return categoryList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean removeCategory(int categoryId) {
		Connection connection = null;
		try {
			connection = JDBCConnection.getConnection();
			connection.setAutoCommit(false);
			int deleteCRow = categoryDeo.deleteCategory(categoryId, connection);
			int deleteSubCRow = subCategoryDeo.deleteSubCategories(categoryId, connection);
			int deleteProRow = productDeo.deleteProducts(categoryId, connection);

			connection.commit();
			if (deleteCRow == 1) {
				return true;
			}

		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public Category getCategory(int categoryId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			Category category = categoryDeo.fetchCategory(categoryId, connection);
			return category;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean editCategory(Category category) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int updateRow = categoryDeo.updateCategory(category, connection);
			if (updateRow == 1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
