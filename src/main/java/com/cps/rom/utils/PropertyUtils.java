package com.cps.rom.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

public class PropertyUtils {
	private Properties pro = new Properties();
	private static PropertyUtils propertyUtils = new PropertyUtils();

	private PropertyUtils() {
		InputStream in = null;
		try {
			// pro.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("db.properties"));
			in = Thread.currentThread().getContextClassLoader().getResourceAsStream("system.properties");
			BufferedReader bf = new BufferedReader(new InputStreamReader(in));
			pro.load(bf);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
			}
		}
	}

	public static PropertyUtils getInstance() {
		return propertyUtils;
	}

	public static String getValue(String key) {
		return (String) getInstance().pro.get(key);
	}

	public static void main(String[] args) throws Exception {
		System.out.println(getValue("httpurl"));
	}
}
