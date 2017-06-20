package com.chinasoft.shop.utils;

import java.util.UUID;

public class Uuid {
	public static String getUuid(){
		return UUID.randomUUID().toString().replace("-", "");
	}

}
