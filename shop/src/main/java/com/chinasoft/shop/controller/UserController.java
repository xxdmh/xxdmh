package com.chinasoft.shop.controller;

import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chinasoft.shop.exception.UserException;
import com.chinasoft.shop.pojo.User;
import com.chinasoft.shop.service.CategoryService;
import com.chinasoft.shop.service.GoodsService;
import com.chinasoft.shop.service.UserService;
import com.chinasoft.shop.utils.Tok;
import com.chinasoft.shop.utils.VerifyImage;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService us;
	@Autowired
	private GoodsService gs;
	@Autowired
	private CategoryService cs;
	@RequestMapping("index.action")
	public String index1 (Model model) {
		model.addAttribute("Latestgoods",gs.findByLatest());
		model.addAttribute("Hottestgoods", gs.finfByHottest());
		model.addAttribute("categories", cs.findAllGoods());
		return "index";
	}
	@RequestMapping("login.action")
	public String login () {
		return "login";
	}
	@RequestMapping("register.action")
	public String register (HttpSession session) {
		Tok.setTok(session);
		return "register";
	}
	@RequestMapping("image.action/{id}")
	public void image (HttpSession session,Model model,HttpServletResponse response) {
		try {
			ImageIO.write(VerifyImage.getImarge(),"png", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		session.setAttribute("vc", VerifyImage.getVc());
	}
	@RequestMapping("isName.action")
	public void isName (String name,HttpServletResponse response) {
		try {
			response.getWriter().print(us.isName(name));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("isEmail.action")
	public void isEmail(String email,HttpServletResponse response){
		try {
			response.getWriter().print(us.isEmail(email));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("isVerify.action")
	public void isVerify(String vcode,HttpServletResponse response,HttpSession session){
		String vc = (String) session.getAttribute("vc");
		try {
			response.getWriter().print(us.isVerify(vcode,vc));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("regist.action")
	public String regist (HttpSession session,String tok,User user,HttpServletRequest request) {
		boolean flag = Tok.isAgain(session,tok);
		try {
			us.isFlag(flag);
		} catch (UserException e) {
			return "redirect:login.action";
		}
		request.getSession().removeAttribute("tok");
		us.addUser(user);
		return "login";
	}
	@RequestMapping("updateToken.action")
	public String updateToken (String token,Model model) {
		try {
			us.updateState(token);
		} catch (UserException e) {
			model.addAttribute("msg", e.getMessage());
			return "register";
		}
		return "login";
	}
	@RequestMapping("log.action")
	public String log () {
		return "redirect:index.action";
	}
	@RequestMapping("isNamePass.action")
	public void isNamePass(User user,HttpServletResponse response,HttpSession session){
		try {
			user = us.findUserByNamePass(user);
			session.setAttribute("user", user);
		} catch (UserException e) {
			try {
				response.getWriter().print(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
	@RequestMapping("logout.action")
	public String logout (HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return "redirect:index.action";
	}
	@RequestMapping("indexAdmin.action")
	public String indexAdmin(){
		return "admin/index";
	}
	
}
