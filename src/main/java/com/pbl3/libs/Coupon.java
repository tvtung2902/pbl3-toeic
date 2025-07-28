package com.pbl3.libs;

import java.util.Random;

public class Coupon {
	    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    private static final int COUPON_LENGTH = 8;

	    public static String createCode() {
	        Random random = new Random();
	        StringBuilder couponCode = new StringBuilder();
	        for (int i = 0; i < COUPON_LENGTH; i++) {
	            int index = random.nextInt(CHARACTERS.length());
	            couponCode.append(CHARACTERS.charAt(index));
	        }
	        return couponCode.toString();
	    }
}
