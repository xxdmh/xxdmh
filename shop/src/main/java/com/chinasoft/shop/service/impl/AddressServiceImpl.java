package com.chinasoft.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasoft.shop.mapper.AddressMapper;
import com.chinasoft.shop.pojo.Address;
import com.chinasoft.shop.service.AddressService;
import com.chinasoft.shop.utils.Uuid;
@Service
public class AddressServiceImpl implements AddressService {
	@Autowired
	private AddressMapper am;

	@Override
	public List<Address> findAll(String id) {
		return am.findAll(id);
	}

	@Override
	public void addAddress(Address address) {
		address.setId(Uuid.getUuid());
		address.setState("0");
		System.out.println(address.toString());
		am.addAddress(address);
	}

	@Override
	public void updateState(String id) {
		am.updateState(id);
	}

	@Override
	public Address findById(String id) {
		return am.findById(id);
	}

	@Override
	public void setDefault(Address ad) {
		ad.setState("1");
		am.setDefault(ad);
	}

	@Override
	public void update(Address ad) {
		ad.setState("0");
		System.out.println(ad.toString());
		am.update(ad);
	}

	@Override
	public void cancelDefault(Address ad) {
		ad.setState("0");
		am.cancelDefault(ad);
		
	}
	

}
