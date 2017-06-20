package com.chinasoft.shop.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasoft.shop.exception.UserException;
import com.chinasoft.shop.mapper.UserMapper;
import com.chinasoft.shop.pojo.User;
import com.chinasoft.shop.service.UserService;
import com.chinasoft.shop.utils.EmailUtil;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper um;
	private String uuid = UUID.randomUUID().toString().replace("-", ""); 
	@Override
	public boolean isName(String name) {
		User u = um.isName(name);
		if (u==null) {
			return false;
		}
		else {
			return true;
		}
	}
	@Override
	public boolean isEmail(String email) {
		User u = um.isEmail(email);
		if (u==null) {
			return true;
		}
		else {
		return false;
		}
	}
	@Override
	public boolean isVerify(String vcode, String vc) {
		if (vcode.toUpperCase().equals(vc.toUpperCase())) {
			return true;
		}
		else {
		return false;
		}
	}
	@Override
	public boolean isFlag(boolean flag) throws UserException {
		if (flag)
				throw new UserException("请不要重复提交");
		return false;
	}
	@Override
	public void addUser(User user) {
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		user.setId(uuid);
		EmailUtil.sendMail(user.getEmail(), user.getId());
		user.setRegTime(new Date());
		user.setAvatar("/default.png");
		user.setStates("0");
		user.setToken(user.getId());
		um.addUser(user);
	}
	@Override
	public void updateState(String token) throws UserException {
		User u = um.findUserByToken(token);
		long time =new Date().getTime()-u.getRegTime().getTime();
		if (time/1000/60>60) {
			um.delete(u.getId());
			throw new UserException("验证超时，请重新注册");
		}
		u.setStates("1");
		um.update(u);
	}
	@Override
	public User findUserByNamePass(User user0) throws UserException {
		user0.setPassword(DigestUtils.md5Hex(user0.getPassword()));
		user0.setPassword(DigestUtils.md5Hex(user0.getPassword()));
		User u = um.findUserByNamePass(user0);
		if (u==null) throw new UserException("用户不存在，请检查用户名和密码");
		else {
			if (u.getStates().equals("0")) throw new UserException("用户尚未激活，请去激活");
		}
		return u;
	}
	@Override
	public void update(User user) {
		User u = um.findById(user.getId());
		u.setAvatar(user.getAvatar());
		um.update(u);
	}
	@Override
	public User findById(String id) {
		return um.findById(id);
	}
	@Override
	public List<User> findAll() {
		return um.findAll();
	}
	
	

}
