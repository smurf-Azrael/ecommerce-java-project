package com.kitchenstore.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.SubCategory;
import com.kitchenstore.deo.ProductDeo;
import com.kitchenstore.deo.SubCategoryDeo;
import com.kitchenstore.deo.impl.ProductDeoImpl;
import com.kitchenstore.deo.impl.SubCategoryDeoImpl;
import com.kitchenstore.service.SubCategoryService;
import com.kitchenstore.utilities.JDBCConnection;

public class SubCategoryServiceImpl implements SubCategoryService {

	SubCategoryDeo subCategoryDeo = new SubCategoryDeoImpl();
	ProductDeo productDeo = new ProductDeoImpl();

	@Override
	public boolean addSubCategory(SubCategory subCategory) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int insertRow = subCategoryDeo.setSubCategory(subCategory, connection);
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
	public List<SubCategory> getSubCategoryList() {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<SubCategory> subCategoryList = subCategoryDeo.fetchSubCategoryList(connection);
			return subCategoryList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean removeSubCategory(int subCategoryId) {

		Connection connection = null;
		try {
			connection = JDBCConnection.getConnection();
			connection.setAutoCommit(false);
			int deleteRow = subCategoryDeo.deleteSubCategory(subCategoryId, connection);
			int deleteProRow = productDeo.deleteProducts((long) subCategoryId, connection);

			connection.commit();
			if (deleteRow == 1) {
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
	public SubCategory getSubCategory(int subCategoryId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			SubCategory subCategory = subCategoryDeo.fetchSubCategory(subCategoryId, connection);
			return subCategory;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean editSubCategory(SubCategory subCategory) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int updateRow = subCategoryDeo.updateSubCategory(subCategory, connection);
			if (updateRow == 1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<SubCategory> getSubCategoryList(int categproyId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<SubCategory> subCategoryList = subCategoryDeo.fetchSubCategoryList(categproyId, connection);
			return subCategoryList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
