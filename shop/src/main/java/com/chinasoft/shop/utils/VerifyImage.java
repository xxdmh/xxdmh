package com.chinasoft.shop.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;


public class VerifyImage {
	public static int width = 95;
	public static int height = 30;
	public static int length = 4;
	private static String vc;
	public static String content = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	public static Random rd = new Random();
	public static String getVc() {
		return vc;
	}

	public  static void setVc(String vc) {
		VerifyImage.vc = vc;
	}
     public static String getContent () {
    	 return content.charAt(rd.nextInt(content.length()))+"";
     }
	public static BufferedImage getImarge () {
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = image.createGraphics();
		String a = "";
		String b = "";
		g.fillRect(0, 0, width, height);
		for(int i = 0; i< length ; i++){
			a=getContent();
			g.setColor(getFontColor());
			g.setFont(new Font("微软雅黑", Font.BOLD, 20));
			g.drawString(a, 10+i*20, 22);
			b+=a;
		}
		setVc(b);
		return image;
	}

	private static Color getFontColor() {
		int red = rd.nextInt(256);
		int blue = rd.nextInt(256);
		int green = rd.nextInt(256);
		return new Color(red, green, blue);
	}

}
