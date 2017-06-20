package com.chinasoft.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinasoft.shop.pojo.User;
import com.chinasoft.shop.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Controller
@RequestMapping("sadmin")
public class SuperAdminController {
	@Autowired
	private UserService us;
	@RequestMapping("indexSadmin.action")
	public String indexSadmin() {
		return "admin/index";
	}
	@RequestMapping("findAllUsers.action")
	public String findAllUsers (Model model,@RequestParam(required=true,defaultValue="1") Integer pageNum,
			@RequestParam(required=false,defaultValue="5") Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		model.addAttribute("page",new PageInfo<User>(us.findAll()));
		return "admin/member_list";
	}

}
