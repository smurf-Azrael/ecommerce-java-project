package com.kitchenstore.deo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kitchenstore.bean.Address;
import com.kitchenstore.bean.Area;
import com.kitchenstore.bean.City;
import com.kitchenstore.deo.AddressDeo;

public class AddressDeoImpl implements AddressDeo {

	@Override
	public List<City> fetchCityList(Connection connection) throws SQLException {
		String selectQuery = "Select * from city";
		List<City> cityList = new ArrayList<City>();
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					City tempCity = new City();
					tempCity.setCityId(resultSet.getInt("city_id"));
					tempCity.setCityName(resultSet.getString("city_name"));

					cityList.add(tempCity);
				}
			}
		}
		return cityList;
	}

	@Override
	public List<Area> fetchAreaList(Connection connection) throws SQLException {
		String selectQuery = "Select * from area";
		List<Area> areaList = new ArrayList<Area>();
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Area tempArea = new Area();
					tempArea.setAreaId(resultSet.getLong("area_id"));
					tempArea.setAreaName(resultSet.getString("area_name"));
					tempArea.setCityId(resultSet.getInt("city_id"));
					tempArea.setPincode(resultSet.getInt("pincode"));
					areaList.add(tempArea);
				}
			}
		}
		return areaList;
	}

	@Override
	public int setAddress(Address address, Connection connection) throws SQLException {
		String insertQuery = "INSERT INTO address (user_id, first_name, last_name, address, area_id, contact_number, alternate_number, address_type, is_default) VALUES (?,?,?,?,?,?,?,?,?)";
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
			preparedStatement.setLong(1, address.getUserId());
			preparedStatement.setString(2, address.getfName());
			preparedStatement.setString(3, address.getlName());
			preparedStatement.setString(4, address.getAddress());
			preparedStatement.setLong(5, address.getAreaId());
			preparedStatement.setString(6, address.getContactNumber());
			preparedStatement.setString(7, address.getAlternateNumber());
			preparedStatement.setString(8, address.getAddressType());
			preparedStatement.setInt(9, 0);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public List<Address> fetchAddressList(long userId, Connection connection) throws SQLException {
		String selectQuery = "Select address_id, first_name, last_name, address, contact_number, alternate_number, address_type, is_default, city_name, area_name, pincode from address AS ad INNER JOIN area AS a ON ad.area_id = a.area_id INNER JOIN city AS c ON a.city_id=c.city_id  where ad.user_id=?";
		List<Address> addressList = new ArrayList<Address>();
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, userId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Address tempAddress = new Address();
					tempAddress.setAddressId(resultSet.getLong("address_id"));
					tempAddress.setfName(resultSet.getString("first_name"));
					tempAddress.setlName(resultSet.getString("last_name"));
					tempAddress.setAddress(resultSet.getString("address"));
					tempAddress.setContactNumber(resultSet.getString("contact_number"));
					tempAddress.setAlternateNumber(resultSet.getString("alternate_number"));
					tempAddress.setAddressType(resultSet.getString("address_type"));
					tempAddress.setIsDefault(resultSet.getInt("is_default"));
					tempAddress.setAreaName(resultSet.getString("area_name"));
					tempAddress.setCityName(resultSet.getString("city_name"));
					tempAddress.setPincode(resultSet.getInt("pincode"));
					addressList.add(tempAddress);
				}
			}
		}
		return addressList;
	}

	@Override
	public Address fetchAddress(long addressId, Connection connection) throws SQLException {
		String selectQuery = "Select user_id,first_name, last_name, address, contact_number, alternate_number, address_type, is_default, city_name, area_name, pincode from address AS ad INNER JOIN area AS a ON ad.area_id = a.area_id INNER JOIN city AS c ON a.city_id=c.city_id  where ad.address_id=?";
		Address tempAddress = new Address();
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setLong(1, addressId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					tempAddress.setAddressId(resultSet.getLong("user_id"));
					tempAddress.setfName(resultSet.getString("first_name"));
					tempAddress.setlName(resultSet.getString("last_name"));
					tempAddress.setAddress(resultSet.getString("address"));
					tempAddress.setContactNumber(resultSet.getString("contact_number"));
					tempAddress.setAlternateNumber(resultSet.getString("alternate_number"));
					tempAddress.setAddressType(resultSet.getString("address_type"));
					tempAddress.setIsDefault(resultSet.getInt("is_default"));
					tempAddress.setAreaName(resultSet.getString("area_name"));
					tempAddress.setCityName(resultSet.getString("city_name"));
					tempAddress.setPincode(resultSet.getInt("pincode"));
				}
			}
		}
		return tempAddress;
	}

	@Override
	public int updateAddress(Address address, Connection connection) throws SQLException {
		String updateQuery = "UPDATE address SET first_name=?, last_name=?, address=?, area_id=?, contact_number=?, alternate_number=?, address_type=?, is_default=? WHERE address_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, address.getfName());
			preparedStatement.setString(2, address.getlName());
			preparedStatement.setString(3, address.getAddress());
			preparedStatement.setLong(4, address.getAreaId());
			preparedStatement.setString(5, address.getContactNumber());
			preparedStatement.setString(6, address.getAlternateNumber());
			preparedStatement.setString(7, address.getAddressType());
			preparedStatement.setInt(8, 0);
			preparedStatement.setLong(9, address.getAddressId());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int deleteAddress(String addressId, Connection connection) throws SQLException {
		String deleteQuery = "DELETE FROM address WHERE (address_id = ?)";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setLong(1, Long.parseLong(addressId));
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int clearDefaultAddress(long userId, Connection connection) throws SQLException {
		String deleteQuery = "UPDATE address SET is_default=? WHERE user_id = ?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setLong(2, userId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int updateDefaultAddress(long addressId, Connection connection) throws SQLException {
		String updateQuery = "UPDATE address SET is_default=? WHERE address_id = ?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, 1);
			preparedStatement.setLong(2, addressId);
			return preparedStatement.executeUpdate();
		}
	}

}
