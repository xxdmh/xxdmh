package com.chinasoft.shop.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinasoft.shop.pojo.Goods;
import com.chinasoft.shop.service.GoodsService;
import com.chinasoft.shop.utils.Tok;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Controller
@RequestMapping("agoods")
public class AheadGoodsController {
	@Autowired
	private GoodsService gs;
	@RequestMapping("findById.action")
	public String findGoods (String id,Model model,
			@RequestParam(required=true,defaultValue="1") Integer pageNum,
			@RequestParam(required=false,defaultValue="1") Integer pageSize,String name) {
		model.addAttribute("saleGoods", gs.findBySaleNums(id));
		PageHelper.startPage(pageNum, pageSize);
		model.addAttribute("pageaction", "findById.action");
		model.addAttribute("id",id);
		model.addAttribute("webName", name);
		model.addAttribute("page",new PageInfo<Goods>(gs.findByCateId(id)));
		return "goods/goods_list";
	}
	@RequestMapping("goodsView.action/{id}")
	public String goodsView (@PathVariable("id") String id,Model model,HttpSession session) {
		model.addAttribute("goods", gs.findById2(id));
		model.addAttribute("hgoods", gs.findByHottest5());
		Tok.setTok(session);
		return "goods/goods_view";
	}
}
