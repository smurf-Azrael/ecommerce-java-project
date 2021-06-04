package com.kitchenstore.service;

import java.util.List;

import com.kitchenstore.bean.Address;
import com.kitchenstore.bean.Area;
import com.kitchenstore.bean.City;

public interface AddressService {

	List<City> getCityList();

	List<Area> getAreaList();

	boolean addAddress(Address address);

	List<Address> getAddressList(long userId);

	Address getAddress(long addressId);

	boolean editAddress(Address address);

	Boolean removeAddress(String addressId);

	boolean setDefaultAddress(long addressId, long UserId);

}
