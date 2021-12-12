package com.ravi.mycart.helper;

public class CardDescHelper {
	
	public static String get10Words(String desc) {
		
		String []str=desc.split(" ");
		if(str.length>10) {
			
			String result="";
			for(int i=0;i<10;i++) {
				result=result+str[i]+" ";
			}
			
			return (result+"...");
			
		}else
			return desc+"...";
	}
	
	//Calculate price after discount
	public static int getFinalPrice(int discount, int price) {
		int discPrice=(int)((price*discount)/100);
		int finalPrice=price-discPrice;
		return finalPrice;
	}

}
