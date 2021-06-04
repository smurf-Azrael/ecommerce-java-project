package com.kitchenstore.deo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kitchenstore.bean.Address;
import com.kitchenstore.bean.Area;
import com.kitchenstore.bean.City;

public interface AddressDeo {

	List<City> fetchCityList(Connection connection) throws SQLException;

	List<Area> fetchAreaList(Connection connection) throws SQLException;

	int setAddress(Address address, Connection connection) throws SQLException;

	List<Address> fetchAddressList(long userId, Connection connection) throws SQLException;

	Address fetchAddress(long addressId, Connection connection) throws SQLException;

	int updateAddress(Address address, Connection connection) throws SQLException;

	int deleteAddress(String addressId, Connection connection) throws SQLException;

	int clearDefaultAddress(long userId, Connection connection) throws SQLException;

	int updateDefaultAddress(long addressId, Connection connection) throws SQLException;

}
