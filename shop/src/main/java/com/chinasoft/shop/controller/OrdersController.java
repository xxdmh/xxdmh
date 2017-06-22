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
    	    	oo=ods.findById(ods.addAds(g,sub,num,u));
    	    	model.addAttribute("ods",oo);
			} catch (UserException e) {
				System.out.println(e.getMessage());
				model.addAttribute("aList", as.findAll(u.getId()));
    	    	model.addAttribute("ods",oo);
			}
    	return "goods/order_add";
    }
    @RequestMapping("cart.action")
	public String cart(Model model,HttpSession session) {
    	User u = (User)session.getAttribute("user");
		model.addAttribute("cartList",ods.findCart(u.getId()));
		model.addAttribute("hot", gs.findByHottest5());
		model.addAttribute("total", ods.totalMoney());
		return "goods/cart";
	}
	@RequestMapping("addHot.action")
	public String addHot (String id,HttpSession session) {
		Goods g =gs.findById2(id);
		User u = (User) session.getAttribute("user");
		ods.addHotAds(g,u);
		return "redirect:cart.action";
	}
	@RequestMapping("updateNums.action")
	public void updateNums(String nums,String id){
		OrdersDetails od = ods.findById(id);
		int a = Integer.parseInt(nums);
		if (a==0) {
			ods.delete(id);
		}else {
		od.setNums(a);
		od.setSubtotal(a*od.getGprice());
		ods.update(od);
		}
	}
	@RequestMapping("deleteCart.action")
	public void deleteCart (String id) {
		ods.deleteCart(id);
	}
	@RequestMapping("addCart2.action")
	public void addCart2 (String id,HttpSession session) {
		Goods g =gs.findById2(id);
		User u = (User) session.getAttribute("user");
		ods.addHotAds(g,u);
	}
	@RequestMapping("seeOrders.action")
	public String seeOrders(String xxdmh,HttpSession session,Model model){
		User u = (User)session.getAttribute("user");
		String[] a = xxdmh.split(";");
		model.addAttribute("odsList",ods.findCarts(a));
		model.addAttribute("xxdmh", xxdmh);
		model.addAttribute("aList", as.findAll(u.getId()));
		Tok.setTok(session);
		return "goods/order_add";
	}

}
