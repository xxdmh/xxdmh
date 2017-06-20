package com.chinasoft.shop.utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.chinasoft.shop.exception.UserException;
public class FileUtis {
	public static String create (HttpServletRequest request,CommonsMultipartFile file,String dirName) {
		String name=null;
		if (file.getOriginalFilename().contains("&")) {
			name = file.getOriginalFilename().replace("&", "");
		}else {
			name=file.getOriginalFilename();
		}
		String dirs = Integer.toHexString(name.hashCode());
		String path = "/"+dirs.charAt(0)+"/"+dirs.charAt(1)+"/";
		String realPath= request.getServletContext().getRealPath(dirName)+path;
		new File(realPath).mkdirs();
		String img = Uuid.getUuid()+"_"+name;
		try {
			file.transferTo(new File(realPath,img));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return path+img;
	}
	public static void delete (HttpServletRequest request,String dirName,String imgName) throws UserException {
		String realPath= request.getServletContext().getRealPath(dirName)+imgName;
		File fi = new File(realPath);
		if (!fi.exists()) {
			System.out.println("没有该文件，马上创建");
		}
		else {
		if (fi.isFile()&&fi.exists()&&!imgName.equals("/default.png")) {
			System.out.println("删除操作执行中，马上创建新图片");
			fi.delete();
		}else throw new UserException("删除失败了");
	}
	}
	

}
