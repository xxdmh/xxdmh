package com.chinasoft.shop.service;

import java.util.List;

import com.chinasoft.shop.pojo.Address;

public interface AddressService {

	List<Address> findAll(String id);

	void addAddress(Address address);

	void updateState(String id);

	Address findById(String id);

	void setDefault(Address ad);

	void update(Address ad);

	void cancelDefault(Address ad);

}
