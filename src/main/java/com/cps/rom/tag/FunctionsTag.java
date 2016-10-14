package com.cps.rom.tag;

public class FunctionsTag {

	
	/**
	 *   根据状态值 返回说明文字
	 * @param status
	 * @return
	 */
	public static String getStatusPS(Integer status){
		return status==0?"正常":"停止";
	}
}
