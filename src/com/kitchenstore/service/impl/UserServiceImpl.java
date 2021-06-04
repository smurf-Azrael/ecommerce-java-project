package com.kitchenstore.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.User;
import com.kitchenstore.deo.UserDeo;
import com.kitchenstore.deo.impl.UserDeoImpl;
import com.kitchenstore.service.UserService;
import com.kitchenstore.utilities.BCrypt;
import com.kitchenstore.utilities.JDBCConnection;

public class UserServiceImpl implements UserService {

	// Deo Layer Objects
	UserDeo userDeo = new UserDeoImpl();

	@Override
	public Boolean checkEmail(String email) {
		Boolean registeredEmail = false;
		try (Connection connection = JDBCConnection.getConnection()) {
			List<String> emailList = userDeo.fetchEmailList(connection);
			for (String tEmail : emailList) {
				if (tEmail.equals(email)) {
					registeredEmail = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return registeredEmail;
	}

	@Override
	public long doRegister(User user) {
		try (Connection connection = JDBCConnection.getConnection()) {
			Long userId = userDeo.insertUserDetails(user, connection);
			if (userId != 0)
				return userId;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public User doLogin(User user) {
		try (Connection connection = JDBCConnection.getConnection()) {
			String pass = user.getPassword();
			User dbUser = userDeo.fetchUserDetails(user, connection);
			if (dbUser != null) {
				boolean matched = BCrypt.checkpw(pass, dbUser.getPassword());
				if (matched) {
					dbUser.setPassword(null);
					return dbUser;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int changePassword(User user) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int updateRow = userDeo.updatePassword(user, connection);
			return updateRow;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public String getCurrentPassword(long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			String currentPass = userDeo.fetchPassword(userId, connection);
			return currentPass;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int editPersonalInfo(User user) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int updateRow = userDeo.updatePersonalInfo(user, connection);
			return updateRow;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int changeContactNumber(User user) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int updateRow = userDeo.updateContactNumber(user, connection);
			return updateRow;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public boolean changeEmail(long userId, String email) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int updateRow = userDeo.updateEmail(userId, email, connection);
			if (updateRow == 1) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<User> getCustomerList() {
		try (Connection connection = JDBCConnection.getConnection()) {
			List<User> customerList = userDeo.fetchCustomerList(connection);
			return customerList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int removeCustomer(long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int deleteRow = userDeo.deleteCustomer(userId, connection);
			return deleteRow;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
