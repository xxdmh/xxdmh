package com.chinasoft.shop.mapper;

import java.util.List;

import com.chinasoft.shop.pojo.Address;

public interface AddressMapper {

	List<Address> findAll(String id);

	void updateState(String id);

	void addAddress(Address address);

	Address findById(String id);

	void setDefault(Address ad);

	void update(Address ad);

	void cancelDefault(Address ad);
	

}