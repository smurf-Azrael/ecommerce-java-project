package com.kitchenstore.service;

import java.util.List;

import com.kitchenstore.bean.User;

public interface UserService {

	Boolean checkEmail(String email);

	long doRegister(User user);

	User doLogin(User user);

	int changePassword(User user);

	String getCurrentPassword(long userId);

	int editPersonalInfo(User user);

	int changeContactNumber(User user);

	boolean changeEmail(long userId, String email);

	List<User> getCustomerList();

	int removeCustomer(long userId);

}
