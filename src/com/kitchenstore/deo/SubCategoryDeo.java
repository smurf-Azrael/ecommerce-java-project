package com.kitchenstore.deo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.SubCategory;

public interface SubCategoryDeo {

	int setSubCategory(SubCategory subCategory, Connection connection) throws SQLException;

	List<SubCategory> fetchSubCategoryList(Connection connection) throws SQLException;

	int deleteSubCategory(int subCategoryId, Connection connection) throws SQLException;

	SubCategory fetchSubCategory(int subCategoryId, Connection connection) throws SQLException;

	int updateSubCategory(SubCategory subCategory, Connection connection) throws SQLException;

	int deleteSubCategories(int categoryId, Connection connection) throws SQLException;

	List<SubCategory> fetchSubCategoryList(int categproyId, Connection connection) throws SQLException;
}
