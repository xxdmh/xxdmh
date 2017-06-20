package com.chinasoft.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chinasoft.shop.exception.UserException;
import com.chinasoft.shop.pojo.Goods;
import com.chinasoft.shop.pojo.OrdersDetails;
import com.chinasoft.shop.pojo.User;
import com.chinasoft.shop.service.AddressService;
import com.chinasoft.shop.service.GoodsService;
import com.chinasoft.shop.service.OrderDetailsService;
import com.chinasoft.shop.service.OrdersService;
import com.chinasoft.shop.utils.Tok;

@Controller
@RequestMapping("orders")
public class OrdersController {
    @Autowired
	private OrdersService os;
    @Autowired
    private AddressService as;
    @Autowired
    private GoodsService gs;
    @Autowired
    private OrderDetailsService ods;
    private OrdersDetails oo;
    @RequestMapping("add.action/{id}")
    public String add (@PathVariable("id")String id,Model model,
    		HttpSession session,HttpServletRequest request,
    		double sub,Integer num,String tok) {
    	User u = (User)session.getAttribute("user");
    	Goods g = gs.findById2(id);
    	    try {
				Tok.isFlag(Tok.isAgain(session, tok));
				request.getSession().removeAttribute("tok");
    	    	model.addAttribute("aList", as.findAll(u.getId()));
    	    	oo=ods.findById(ods.addAds(g,sub,num));
    	    	model.addAttribute("ods",oo);
			} catch (UserException e) {
				System.out.println(e.getMessage());
				model.addAttribute("aList", as.findAll(u.getId()));
    	    	model.addAttribute("ods",oo);
			}
    	return "goods/order_add";
    }

}
