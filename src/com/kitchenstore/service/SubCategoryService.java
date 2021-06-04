package com.kitchenstore.service;

import java.util.List;

import com.kitchenstore.bean.SubCategory;

public interface SubCategoryService {

	boolean addSubCategory(SubCategory subCategory);

	List<SubCategory> getSubCategoryList();

	boolean removeSubCategory(int subCategoryId);

	SubCategory getSubCategory(int subCategoryId);

	boolean editSubCategory(SubCategory subCategory);

	List<SubCategory> getSubCategoryList(int categproyId);

}
