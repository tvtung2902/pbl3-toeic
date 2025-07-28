package com.pbl3.libs;

public class ToStringBuilder {
	public static String arrayToJson(Object[] array) {
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		for (int i = 0; i < array.length; i++) {
			sb.append("\"").append(array[i]).append("\"");
			if (i < array.length - 1) {
				sb.append(",");
			}
		}
		sb.append("]");
		return sb.toString();
	}
}
