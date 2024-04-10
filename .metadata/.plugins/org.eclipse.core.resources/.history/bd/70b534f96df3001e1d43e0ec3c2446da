package com.pbl3.libs;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
		  public static void main(String[] args) throws Exception {
		    String password = "stackjava.com";
		    String hashedText = getMD5(password);
		    System.out.println("Digest(in hex format): " + hashedText);
		  }
		  public static String getMD5(String input) {
		    try {
		      MessageDigest md = MessageDigest.getInstance("MD5");
		      byte[] messageDigest = md.digest(input.getBytes());
		      return convertByteToHex(messageDigest);
		    } catch (NoSuchAlgorithmException e) {
		      throw new RuntimeException(e);
		    }
		  }
		 
		  public static String convertByteToHex(byte[] data) {
		    StringBuffer sb = new StringBuffer();
		    for (int i = 0; i < data.length; i++) {
		      sb.append(Integer.toString((data[i] & 0xff) + 0x100, 16).substring(1));
		    }
		    return sb.toString();
		  }
	}