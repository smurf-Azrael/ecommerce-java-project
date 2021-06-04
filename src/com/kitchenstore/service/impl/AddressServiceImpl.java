package com.kitchenstore.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Address;
import com.kitchenstore.bean.Area;
import com.kitchenstore.bean.City;
import com.kitchenstore.deo.AddressDeo;
import com.kitchenstore.deo.impl.AddressDeoImpl;
import com.kitchenstore.service.AddressService;
import com.kitchenstore.utilities.JDBCConnection;

public class AddressServiceImpl implements AddressService {

	// Global Deo Object

	AddressDeo addressDeo = new AddressDeoImpl();

	@Override
	public List<City> getCityList() {
		try (Connection connection = JDBCConnection.getConnection()) {
			return addressDeo.fetchCityList(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Area> getAreaList() {
		try (Connection connection = JDBCConnection.getConnection()) {
			return addressDeo.fetchAreaList(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean addAddress(Address address) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int insertRow = addressDeo.setAddress(address, connection);
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
	public List<Address> getAddressList(long userId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			return addressDeo.fetchAddressList(userId, connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Address getAddress(long addressId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			return addressDeo.fetchAddress(addressId, connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean editAddress(Address address) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int updateRow = addressDeo.updateAddress(address, connection);
			if (updateRow == 1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Boolean removeAddress(String addressId) {
		try (Connection connection = JDBCConnection.getConnection()) {
			int deleteRow = addressDeo.deleteAddress(addressId, connection);
			if (deleteRow == 1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean setDefaultAddress(long addressId, long UserId) {
		Connection connection = null;
		connection = JDBCConnection.getConnection();
		boolean isSetted = false;
		try {
			connection.setAutoCommit(false);
			int isDeleted = addressDeo.clearDefaultAddress(UserId, connection);
			int isUpdated = addressDeo.updateDefaultAddress(addressId, connection);
			connection.commit();
			isSetted = true;
		} catch (Exception e) {
			try {
				connection.rollback();
				isSetted = false;
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSetted;
	}

}
