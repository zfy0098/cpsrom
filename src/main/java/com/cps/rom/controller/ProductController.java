package com.cps.rom.controller;

import java.io.File; 
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cps.rom.entity.Product;
import com.cps.rom.entity.Propv;
import com.cps.rom.entity.Protype;
import com.cps.rom.service.ProductService;
import com.cps.rom.utils.PropertyUtils;
import com.cps.rom.utils.ReaderExcel;
import com.cps.rom.utils.UploadFile;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("product")
public class ProductController extends BaseController{

	@Autowired
	private ProductService proService;
	
	
	/**
	 *   添加推广产品
	 * @param request
	 * @return
	 */
	@RequestMapping(value="addProduct" , method = RequestMethod.POST)
	public String addProduct(HttpServletRequest request,
			@ModelAttribute("product") Product product,
			@RequestParam(value = "img", required = false) MultipartFile file){
		
		String proid = UUID.randomUUID().toString().toUpperCase();
		
		String proimg = "";
		
		if(file!=null&&file.getSize()>0){
			String path = PropertyUtils.getValue("picpath");
			
			try {
				proimg = UploadFile.uploadProimg(file, path);
			} catch (IllegalStateException e) {
				log.error(e.getMessage());
			} catch (IOException e) {
				log.error(e.getMessage());
			}
		}
		
        product.setProimg(proimg); 
		product.setProid(proid);
		proService.addPro(product);
		
		return "redirect:prolist.html";
	}

	
	
	/**
	 *     推广商品列表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="prolist")
	public String productlist(HttpServletRequest request,
			@RequestParam(value="page",required = false) String page,
			Map<String,Object> result){
		
		Integer pageSize = 10;
		Integer pageNumber = 1;
		try{
			pageNumber = Integer.parseInt(page);
		}catch(Exception e){
			pageNumber = 1;
		}
		//  总条数
		Integer totalCount = proService.productCount();
		
		// 共有多少页、
		Integer totalPage = proService.totalPage(pageSize);
		
		if(pageNumber < 1){
			pageNumber = 1;
		}else if(pageNumber > totalPage){
			pageNumber = totalPage;
		}
		
		List<Product> list = proService.prolist(pageNumber, pageSize);
		result.put("list", list);
		result.put("totalCount",totalCount);
		result.put("totalPage",totalPage);
		result.put("page",pageNumber);
		return "index";
	}


	/**
	 *   查看商品详细内容
	 * @param request
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("getProbyId")
	public String getProbyId(HttpServletRequest request,
			@RequestParam(value="id",required = true) String id,
			Map<String,Object> map){
		
		Product product = proService.getProByid(id);
		map.put("product", product);
		return "editpagepro";
	}
	
	
	/**
	 *   修改商品
	 * @param request
	 * @param product
	 * @param file
	 * @return
	 */
	@RequestMapping("updatePro")
	public String updatePro(HttpServletRequest request,
			@ModelAttribute("Product") Product product,
			@RequestParam(value = "img", required = false) MultipartFile file){
		
		if(file!=null&&file.getSize()>0){
			
			String path = PropertyUtils.getValue("picpath");
			
			try {
				String Http_url = UploadFile.uploadProimg(file, path);
				product.setProimg(Http_url);
			} catch (IllegalStateException e) {
				log.error(e.getMessage());
			} catch (IOException e) {
				log.error(e.getMessage());
			}
		}
		proService.updatePro(product);
		return "redirect:prolist.html";
	}
	
	
	/**
	 *    上传商品图片
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("uploadproimg")
	public void uploadproimg(HttpServletRequest request,
			@RequestParam(value = "img", required = false) MultipartFile[] files,
			HttpServletResponse response){
		
		List<String> list = new ArrayList<String>();
		
		for (MultipartFile file : files) {
			String path = PropertyUtils.getValue("picpath");
			
			try {
				String Http_url = UploadFile.uploadProimg(file, path);
				if(Http_url!=null&&!Http_url.trim().isEmpty()){
					list.add(Http_url);
				}
			} catch (IllegalStateException e) {
				log.error(e.getMessage());
			} catch (IOException e) {
				log.error(e.getMessage());
			}
		}
		
		JSONArray proArray = JSONArray.fromObject(list);
		
		try {
			response.getWriter().println(proArray);
		} catch (IOException e) {
			log.error(e.getMessage());
		}
	}
	
	
	
	/**
	 *    根据文件上传商品内容
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("addexcelpro")
	public String addexcelpro(HttpServletRequest request,
			@RequestParam(value = "excelfile" ,  required = false) MultipartFile file){
		if(file!=null&&file.getSize()>0){
			String path = PropertyUtils.getValue("excelpath");
			
			String fileName = file.getOriginalFilename();  
			
			String newFileName = UUID.randomUUID().toString().toUpperCase() + fileName.substring(fileName.lastIndexOf("."));
			
			File targetFile = new File(path, newFileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }
	        try {
				file.transferTo(targetFile);
				
				List<Product> prolist = new ArrayList<Product>();
				List<String[]> list = ReaderExcel.getAllData(path + newFileName, 0);
				for (String[] column : list) {
					if(column.length > 6){
						Product pro = new Product();
						pro.setProid(UUID.randomUUID().toString());	//  商品id
						pro.setProname(column[0]);	//  商品名称
						pro.setProurl(column[1]);	// ,商品详情页
						pro.setProprice(column[2]);	// 价格
						pro.setCommissionrate(Double.parseDouble(column[3])); // 佣金比例
						pro.setCommission(column[4]);	//  佣金
						pro.setProspread(column[5]); 	// 推广地址
						pro.setLevels(1);		
						pro.setProstatus(0);
						
						prolist.add(pro);
					}
				}
				
				proService.addexcelpro(prolist);
				
	        } catch (IllegalStateException e) {
	        	log.error(e.getMessage());
			} catch (IOException e) {
				log.error(e.getMessage());
			} catch (InvalidFormatException e) {
				log.error(e.getMessage());
			}
		}
		return "redirect:prolist.html";
	}
	
	/**********************************************     protype表         ****************************************/
	
	/**
	 *   商品类型集合
	 * @param request
	 * @param result
	 * @return
	 */
	@RequestMapping("protypelist")
	public String protypelist(HttpServletRequest request,
			Map<String,Object> result){
		
		List<Protype> list = proService.protypelist();
		result.put("list", list);
		return "protype";
	}
	
	
	/**
	 *   添加商品类型
	 * @param request
	 * @param response
	 * @param protype
	 */
	@RequestMapping("addprotype")
	public void addprotype(HttpServletRequest request,HttpServletResponse response,
			@ModelAttribute("Protype") Protype protype){
		
		String proid = UUID.randomUUID().toString().toUpperCase();
		protype.setTypeid(proid);
		proService.addprotype(protype);
		
	}
	
	
	/**
	 *    更新类型
	 * @param request
	 * @param response
	 * @param protype
	 */
	@RequestMapping("updateProtype")
	public void updateProtype(HttpServletRequest request,HttpServletResponse response,
			@ModelAttribute("Protype") Protype protype){
		
		proService.updatePortype(protype);
	}
	
	
	
	/**********************************************     propv表         ****************************************/
	
	
	/**
	 *   查询商品访问情况
	 * @param request
	 * @param result
	 * @return
	 */
	@RequestMapping("querypropv")
	public String querypropv(HttpServletRequest request,Map<String,Object> result){
		
		List<Propv> list = proService.querypropv();
		
		result.put("list", list);
		
		return "propvlist";
	}
	
	
}
