package com.onchange.util;

import java.util.Random;

public class RandomUtil {

	private static String[] str = new String[7];
    private static Random random = new Random();
	static {
		str[0]="0123456789";
		str[1]="abcdefghijklmnopqrstuvwxyz";
		str[2]="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		str[3]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		str[4]="23456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		str[5]="23456789abcdefghijklmnopqrstuvwxyz";
		str[6]="23456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	}
	
	public static enum RandomType
	{
		/**
		 * 数字
		 */
		NUMBEN(0),
		/*
		 * 小写字母
		 */
		LOWER_CASE(1),
		/**
		 * 大写字母
		 */
		UPPER_CASE(2),
		/**
		 * 大小写字母组合
		 */
		UPPER_LOWER_CASE(3),
		/**
		 * 数字大写字母组合
		 */
		UPPER_CASE_NUMBER(4),
		/**
		 * 小写字母数字组合
		 */
		LOWER_CASE_NUMBER(5),
		/**
		 * 小写大写字母数字组合
		 */
		UPPER_LOWER_CASE_NUMBER(6);
		
		private int index;
		
		private RandomType(int index) {
			this.index = index;
		}
		public int getIndex() {
			return index;
		}
	}
	/***
	 * 产生随机数
	 * @param type 随机数字符类型
	 * @param length 随机数长度
	 * @return 随机数
	 */
	public static String rand(RandomType type,int length) {
		String text = str[type.getIndex()];
		StringBuilder sb = new StringBuilder(length);
		for(int i = 0 ;i< length;i++) {
			int n = random.nextInt(text.length());
			sb.append(text.charAt(n));
		}
		return sb.toString();
	}
	
}
