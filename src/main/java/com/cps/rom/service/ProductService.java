package com.cps.rom.service;

import java.util.List;

import com.cps.rom.entity.Product;
import com.cps.rom.entity.Propv;
import com.cps.rom.entity.Protype;

public interface ProductService {

	/**
	 *   添加推广商品
	 * @param product
	 * @return
	 */
	public int addPro(Product product);
	
	
	
	/**
	 *   商品列表
	 * @return
	 */
	public List<Product> prolist(Integer page,Integer pageSize); 
	
	
	
	/**
	 *   查询商品数量
	 * @return
	 */
	public int productCount();
	
	
	/**
	 *   要分的总页数
	 * @param pageSize  每页显示的总条数
	 * @return
	 */
	public int totalPage(Integer pageSize);
	
	
	
	
	/**
	 *   查询商品详细
	 * @param id
	 * @return
	 */
	public Product getProByid(String id);
	
	
	/**
	 *    修改商品信息
	 * @param product
	 * @return
	 */
	public int updatePro(Product product);
	
	
	
	/**
	 *   文件形式添加商品信息
	 * @param list
	 * @return
	 */
	public int addexcelpro(List<Product> list);
	
	
	
	
	
	/**
	 *   商品类型
	 * @return
	 */
	public List<Protype> protypelist();
	
	
	
	/**
	 *  添加商品类型
	 * @param protype
	 * @return
	 */
	public int addprotype(Protype protype);
	
	
	
	/**
	 *  修改商品类型
	 * @param protype
	 * @return
	 */
	public int updatePortype(Protype protype);
	
	
	
	
	
	/**
	 *    查询商品访问量
	 * @return
	 */
	public List<Propv> querypropv();
}
