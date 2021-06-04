package com.kitchenstore.service;

import java.util.List;

import com.kitchenstore.bean.Category;

public interface CategoryService {

	boolean addCategory(String categoryName);

	List<Category> getCategoryList();

	boolean removeCategory(int categoryId);

	Category getCategory(int categoryId);

	boolean editCategory(Category category);

}
