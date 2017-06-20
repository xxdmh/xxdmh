package com.chinasoft.shop.utils;

import javax.servlet.http.HttpSession;

import com.chinasoft.shop.exception.UserException;

public class Tok {
	public static void setTok (HttpSession session) {
		session.setAttribute("tok", Uuid.getUuid());
	}
	public static boolean isAgain (HttpSession session, String tok) {
		if (tok==null) {
			return true;
		}
		String s_tok = (String) session.getAttribute("tok");
		if (s_tok==null) {
			return true;
		}
		if (!tok.equals(s_tok)) {
			return true;
		}
		return false;
	}
	public static boolean isFlag (boolean a) throws UserException {
		if (a==true) throw new UserException("不要重复提交");
		return false;
	}

}
