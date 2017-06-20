package com.chinasoft.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinasoft.shop.exception.UserException;
import com.chinasoft.shop.pojo.Address;
import com.chinasoft.shop.pojo.User;
import com.chinasoft.shop.service.AddressService;
import com.chinasoft.shop.utils.Tok;
@Controller
@RequestMapping("address")
public class AddressController {
	@Autowired
	private AddressService as;
	@RequestMapping("findAddress.action")
	public String findAddress (Model model,HttpSession session) {
		User u = (User)session.getAttribute("user");
		Tok.setTok(session);
		model.addAttribute("aList", as.findAll(u.getId()));
		model.addAttribute("action", "addAddress.action");
		return "usercenter/address_list";
	}
	@RequestMapping("addAddress.action")
	public String addAddress (HttpSession session,String tok,Address address,@RequestParam(required=false)String de) {
		User u = (User)session.getAttribute("user");
		try {
			Tok.isFlag(Tok.isAgain(session, tok));
		} catch (UserException e) {
			System.out.println(e.getMessage());
			return "redirect:findAddress.action";
		}
		if (de!=null) {
			as.updateState(u.getId());
			address.setState("1");
		}
		address.setUid(u.getId());
		as.addAddress(address);
		return "redirect:findAddress.action";
	}
	@RequestMapping("setDefault.action/{id}")
	public String setDefault(@PathVariable("id") String id,HttpSession session,Model model){
		User u = (User)session.getAttribute("user");
		as.updateState(u.getId());
		Address ad = as.findById(id);
		as.setDefault(ad);
		Tok.setTok(session);
		model.addAttribute("aList", as.findAll(u.getId()));
		model.addAttribute("action", "addAddress.action");
		return "usercenter/address_list";
	}
	@RequestMapping("cancelDefault.action/{id}")
	public String cancelDefault(@PathVariable("id") String id,Model model,HttpSession session){
		Address ad = as.findById(id);
		as.cancelDefault(ad);
		User u = (User)session.getAttribute("user");
		Tok.setTok(session);
		model.addAttribute("aList", as.findAll(u.getId()));
		model.addAttribute("action", "addAddress.action");
		return "usercenter/address_list";
	}

}
