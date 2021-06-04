package com.kitchenstore.deo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.kitchenstore.bean.User;
import com.kitchenstore.deo.UserDeo;

public class UserDeoImpl implements UserDeo {

	@Override
	public List<String> fetchEmailList(Connection connection) throws SQLException {
		String selectQuery = "Select email from user where is_remove=?";
		List<String> emailList = new ArrayList<String>();
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					emailList.add(resultSet.getString("email"));
				}
			}
		}
		return emailList;
	}

	@Override
	public long insertUserDetails(User user, Connection connection) throws SQLException {
		Long userId = (long) 0;
		String insertQuery = "Insert into user(first_name, last_name, password, email, registered_date, is_admin, is_remove) VALUES (?,?,?,?,?,?,?)";
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		String registerDate = currentDateTime.format(formatter);
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,
				Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setString(1, user.getfName());
			preparedStatement.setString(2, user.getlName());
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, registerDate);
			preparedStatement.setInt(6, 0);
			preparedStatement.setInt(7, 0);
			preparedStatement.executeUpdate();
			try (ResultSet resultSet = preparedStatement.getGeneratedKeys()) {
				while (resultSet.next()) {
					userId = resultSet.getLong(1);
				}
			}
		}
		return userId;
	}

	@Override
	public User fetchUserDetails(User dbUser, Connection connection) throws SQLException {
		String selectQuery = "Select * from user where email=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setString(1, dbUser.getEmail());
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					dbUser.setUserId(resultSet.getInt("user_id"));
					dbUser.setfName(resultSet.getString("first_name"));
					dbUser.setlName(resultSet.getString("last_name"));
					dbUser.setGender(resultSet.getString("gender"));
					dbUser.setContact(resultSet.getString("contact_number"));
					dbUser.setPassword(resultSet.getString("password"));
					dbUser.setEmail(resultSet.getString("email"));
					dbUser.setIsAdmin(resultSet.getInt("is_admin"));
				}
			}
		}
		return dbUser;
	}

	@Override
	public int updatePassword(User user, Connection connection) throws SQLException {
		String passwod = user.getPassword();
		String email = user.getEmail();
		String updateQuery = "update user set password=? where email=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, passwod);
			preparedStatement.setString(2, email);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public String fetchPassword(long userId, Connection connection) throws SQLException {
		String selectQuery = "Select password from user where user_id=?";
		String pass = "";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, userId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					pass = resultSet.getString("password");
				}
			}
		}
		return pass;
	}

	@Override
	public int updatePersonalInfo(User user, Connection connection) throws SQLException {
		String updateQuery = "update user set first_name=?,last_name=?,gender=? where user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, user.getfName());
			preparedStatement.setString(2, user.getlName());
			preparedStatement.setString(3, user.getGender());
			preparedStatement.setLong(4, user.getUserId());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int updateContactNumber(User user, Connection connection) throws SQLException {
		String updateQuery = "update user set contact_number=? where user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, user.getContact());
			preparedStatement.setLong(2, user.getUserId());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int updateEmail(long userId, String email, Connection connection) throws SQLException {
		String updateQuery = "update user set email=? where user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, email);
			preparedStatement.setLong(2, userId);
			return preparedStatement.executeUpdate();
		}

	}

	@Override
	public List<User> fetchCustomerList(Connection connection) throws SQLException {
		List<User> userList = new ArrayList<User>();
		String selectQuery = "SELECT * FROM user WHERE is_admin=? AND is_remove=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setInt(2, 0);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					User dbUser = new User();
					dbUser.setUserId(resultSet.getInt("user_id"));
					dbUser.setfName(resultSet.getString("first_name"));
					dbUser.setlName(resultSet.getString("last_name"));
					dbUser.setGender(resultSet.getString("gender"));
					dbUser.setContact(resultSet.getString("contact_number"));
					dbUser.setEmail(resultSet.getString("email"));
					userList.add(dbUser);
				}
			}
		}
		return userList;
	}

	@Override
	public int deleteCustomer(long userId, Connection connection) throws SQLException {

		String updateQuery = "update user set is_remove=? where user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, 1);
			preparedStatement.setLong(2, userId);
			return preparedStatement.executeUpdate();
		}
	}
}
