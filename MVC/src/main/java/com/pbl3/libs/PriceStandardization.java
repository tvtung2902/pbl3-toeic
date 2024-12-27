package com.pbl3.libs;

import java.text.DecimalFormat;
public class PriceStandardization {
	public static String getPriceCH(double price) {
		DecimalFormat formatter = new DecimalFormat("#,###");
		String formattedAmount = formatter.format(price);
		formattedAmount = formattedAmount.replace(",", ".");
		return formattedAmount + "đ";
	}
}
