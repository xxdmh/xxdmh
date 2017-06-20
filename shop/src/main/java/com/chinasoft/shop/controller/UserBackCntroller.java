package com.chinasoft.shop.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.chinasoft.shop.exception.UserException;
import com.chinasoft.shop.pojo.User;
import com.chinasoft.shop.service.OrdersService;
import com.chinasoft.shop.service.UserService;
import com.chinasoft.shop.utils.FileUtis;
import com.chinasoft.shop.utils.Tok;

@RequestMapping("userback")
@Controller
public class UserBackCntroller {
	@Autowired
	private UserService us;
	@Autowired
	private OrdersService os;
	@RequestMapping("indexcenter.action")
	public String indexcenter (Model model,HttpSession session) {
		User u = (User)session.getAttribute("user");
		model.addAttribute("orders", os.LimitFind(u.getId()));
		return "usercenter/index";
	}
	@RequestMapping("findAll.action")
	public String findAll () {
		return "usercenter/order_list";
	}
	@RequestMapping("edit.action")
	public String avatar (HttpSession session ) {
		Tok.setTok(session);
		return "usercenter/user_avatar";
	}
	@RequestMapping("addEdit")
	public String addEdit (HttpSession session,String tok,User user,String imgName) {
		try {
			user.setAvatar(imgName);
			us.update(user);
			session.setAttribute("user", us.findById(user.getId()));
			Tok.isFlag(Tok.isAgain(session, tok));
		} catch (UserException e) {
		System.out.println(e.getMessage());
		}
		return "redirect:indexcenter.action";
	}
	@RequestMapping("addImg.action")
	@ResponseBody
	public String addImg (@RequestParam(required=false) CommonsMultipartFile file,
			HttpServletResponse response,HttpServletRequest request,String imgName) {
		String name= null;
		if (file!=null) {
			if (!file.getOriginalFilename().equals("/default.png")) {
					try {
						String img = FileUtis.create(request, file, "userImg");
						name = img;
						FileUtis.delete(request,"userImg", imgName);
					} catch (UserException e) {
						System.out.println(e.getMessage());
						return name;
					}
			}
		}
		return name;
	} 


}
