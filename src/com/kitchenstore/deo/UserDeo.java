package com.kitchenstore.deo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.User;

public interface UserDeo {

	List<String> fetchEmailList(Connection connection) throws SQLException;

	long insertUserDetails(User user, Connection connection) throws SQLException;

	User fetchUserDetails(User dbUser, Connection connection) throws SQLException;

	int updatePassword(User user, Connection connection) throws SQLException;

	String fetchPassword(long userId, Connection connection) throws SQLException;

	int updatePersonalInfo(User user, Connection connection) throws SQLException;

	int updateContactNumber(User user, Connection connection) throws SQLException;

	int updateEmail(long userId, String email, Connection connection) throws SQLException;

	List<User> fetchCustomerList(Connection connection) throws SQLException;

	int deleteCustomer(long userId, Connection connection) throws SQLException;

}
