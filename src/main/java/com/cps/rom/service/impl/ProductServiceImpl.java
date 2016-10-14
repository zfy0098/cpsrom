package com.cps.rom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cps.rom.dao.ProductDao;
import com.cps.rom.entity.Product;
import com.cps.rom.entity.Propv;
import com.cps.rom.entity.Protype;
import com.cps.rom.service.ProductService;
import com.github.pagehelper.PageHelper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao prodao;
	
	public int addPro(Product product) {
		return prodao.addPro(product);
	}
	
	
	/**
	 *   商品列表
	 * @return
	 */
	public List<Product> prolist(Integer page,Integer pageSize){
		PageHelper.startPage(page,pageSize);
		return prodao.prolist();
	}
	
	
	/**
	 * 
	 *   查询商品数量
	 * @return
	 */
	public int productCount(){
		return prodao.productCount();
	}
	
	
	/**
	 *   要分的总页数
	 * @param pageSize  每页显示的总条数
	 * @return
	 */
	public int totalPage(Integer pageSize){
		int count = prodao.productCount();
		return count%pageSize==0?count/pageSize:count/pageSize+1;
	}

	
	/**
	 *   查询商品详细
	 * @param id
	 * @return
	 */
	public Product getProByid(String id){
		return prodao.getProByid(id);
	}
	
	
	
	/**
	 *    修改商品信息
	 * @param product
	 * @return
	 */
	public int updatePro(Product product){
		return prodao.updatePro(product);
	}
	
	
	/**
	 *   文件形式添加商品信息
	 * @param list
	 * @return
	 */
	public int addexcelpro(List<Product> list){
		return prodao.addexcelpro(list);
	}
	
	
	
	/**
	 *   商品类型
	 * @return
	 */
	public List<Protype> protypelist(){
		return prodao.protypelist();
	}
	
	/**
	 *  添加商品类型
	 * @param protype
	 * @return
	 */
	public int addprotype(Protype protype){
		return prodao.addprotype(protype);
	}
	
	
	
	/**
	 *  修改商品类型
	 * @param protype
	 * @return
	 */
	public int updatePortype(Protype protype){
		return prodao.updatePortype(protype);
	}
	
	
	
	
	
	/**
	 *    查询商品访问量
	 * @return
	 */
	public List<Propv> querypropv(){
		return prodao.querypropv();
	}
	
}
