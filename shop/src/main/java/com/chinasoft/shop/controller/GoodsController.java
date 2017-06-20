package com.chinasoft.shop.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.chinasoft.shop.exception.UserException;
import com.chinasoft.shop.pojo.Category;
import com.chinasoft.shop.pojo.Goods;
import com.chinasoft.shop.service.CategoryService;
import com.chinasoft.shop.service.GoodsService;
import com.chinasoft.shop.utils.FileUtis;
import com.chinasoft.shop.utils.Tok;
import com.chinasoft.shop.utils.Uuid;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("goods")
public class GoodsController {
	@Autowired
	private GoodsService gs;
	@Autowired
	private CategoryService cs;
	@RequestMapping("add.action")
	public String add (Model model,HttpSession session) {
		Tok.setTok(session);
		model.addAttribute("goodsNo", Uuid.getUuid());
		model.addAttribute("categories", cs.findAll());
		model.addAttribute("action", "addGoods.action");
		return "admin/goods_add";
	}
	@RequestMapping("addGoods.action")
	public String addGoods (String categoryId,Goods goods,
			@RequestParam(value="file",required=false) CommonsMultipartFile file,
			HttpServletRequest request,HttpSession session,String tok) {
		try {
			Tok.isFlag(Tok.isAgain(session, tok));
		} catch (UserException e) {
			System.out.println(e.getMessage());
		}
		Category c = cs.findById(categoryId);
		c.setGoodsNums(c.getGoodsNums()+1);
		cs.update(c);
		goods.setImage(FileUtis.create(request, file, "goodsImg"));
		goods.setCid(categoryId);
		gs.addGoods(goods);
		return "redirect:findAll.action";
	}
	@RequestMapping("findAll.action")
	public String findAll(Model model,@RequestParam(required=true,defaultValue="1") Integer pageNum,@RequestParam(required=false,defaultValue="1") Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		model.addAttribute("page", new PageInfo<Goods>(gs.findAll()));
		model.addAttribute("categories", cs.findAll());
		model.addAttribute("pageaction", "findAll.action");
		return "admin/goods_list";
	}
	@RequestMapping("edit.action/{id}")
	public String eidt(@PathVariable("id") String id,Model model){
		model.addAttribute("action", "addEdit.action");
		model.addAttribute("goods", gs.findById(id));
		model.addAttribute("categories", cs.findAll());
		return "admin/goods_add";
	}
	@RequestMapping("addEdit.action")
	public String addEdit(@RequestParam(value="file",required=false)CommonsMultipartFile file,String imgName,Goods goods,HttpServletRequest request,String categoryId){
		if (file.getOriginalFilename()=="") {
			goods.setCid(categoryId);
			gs.update(goods);	
		}else {
			try {
				FileUtis.delete(request,"goodsImg", imgName);
				goods.setCid(categoryId);
				String dirs = Integer.toHexString(file.getOriginalFilename().hashCode());
				String path = "/"+dirs.charAt(0)+"/"+dirs.charAt(1)+"/";
				String realPath= request.getServletContext().getRealPath("goodsImg")+path;
				new File(realPath).mkdirs();
				String img = Uuid.getUuid()+"_"+file.getOriginalFilename();
				try {
					file.transferTo(new File(realPath,img));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				goods.setImage(path+img);
				gs.update(goods);
			} catch (UserException e) {
				System.out.println(e.getMessage());
			}
		}
		return "redirect:findAll.action";
	}
//	@RequestMapping("add123")
//    public void addSearch(){
//		System.out.println("23366");
//	gs.searchGoods();
//  }
// 
// @RequestMapping("query123")
//    public String query(String msg,Model model){
//	if(msg==null || msg.equals("")){
//	    msg = "*:*";
//	}
//	 SolrClient client = new HttpSolrClient.Builder("http://172.4.14.139:8983/solr/xxdmh").build();
//	 SolrQuery query = new SolrQuery();
//	 query.set("q", msg);
//	 query.set("start", 0);
//	 query.set("rows",100);
//	 QueryResponse response = null;
//	try {
//	    response = client.query(query);
//	} catch (SolrServerException e) {
//	    e.printStackTrace();
//	} catch (IOException e) {
//	    e.printStackTrace();
//	}
//	 SolrDocumentList list = response.getResults();
//	 model.addAttribute("page",new PageInfo<Goods>(gs.findAll()));
//	 return "admin/goods_list";
//    }

	@ModelAttribute
	public void getGoods (Model model,Goods goods) {
		Goods g = gs.findById(goods.getId());
		if (g!=null) {
			model.addAttribute("goods", goods);
		}
	}

}
