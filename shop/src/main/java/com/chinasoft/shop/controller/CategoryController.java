package com.chinasoft.shop.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chinasoft.shop.exception.UserException;
import com.chinasoft.shop.pojo.Category;
import com.chinasoft.shop.service.CategoryService;
import com.chinasoft.shop.utils.Tok;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("cate")
public class CategoryController {
	@Autowired
	private CategoryService cs;
	@RequestMapping("add.action")
	public String add(HttpSession session){
		Tok.setTok(session);
		return "admin/category_add";
	}
	@RequestMapping("findAll.action")
	public String findAll (Model model,@RequestParam(defaultValue="1",required=true) Integer pageNum,@RequestParam(defaultValue="3",required=false) Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<Category> pagelist = new PageInfo<Category>(cs.findAll());
		model.addAttribute("page", pagelist);
		return "admin/category_list";
	}
	@RequestMapping("addCate.action")
	public String addCate (Category category,HttpSession session,String tok,HttpServletRequest request) {
		try {
			cs.isAgain(Tok.isAgain(session, tok));
		} catch (UserException e) {
			System.out.println(e.getMessage());
			return "redirect:findAll.action";
		}
		request.getSession().removeAttribute("tok");
		cs.addCate(category);
		return "redirect:findAll.action";
	}
	@RequestMapping("isCate.action")
	public void isCate (String name,HttpServletResponse response) {
		try {
			response.getWriter().print(cs.isCate(name));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("edit.action/{id}")
	public String edit (HttpSession session,@PathVariable("id")String id,Model model) {
		Tok.setTok(session);
		model.addAttribute("category",cs.findById(id));
		return "admin/category_edit";
	}
	@RequestMapping("editIsCate.action")
	public void editIsCate(String name,String id,HttpServletResponse response) {
		try {
			cs.findByNameId(name,id);
		} catch (UserException e) {
			try {
				response.getWriter().print(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
	@RequestMapping("addEdit.action")
	public String addEdit (Category category,String tok,HttpSession session) {
		try {
			cs.isAgain(Tok.isAgain(session, tok));
		} catch (UserException e) {
			System.out.println(e.getMessage());
			return "redirect:findAll.action";
		}
		cs.update(category);
		return "redirect:findAll.action";
	}
	@RequestMapping("getCate.action")
	@ResponseBody
	public String getCate () {
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(cs.findAll());
		} catch (IOException e) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
			throw new RuntimeException(e);
		}
	}

}
