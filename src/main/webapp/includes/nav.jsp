<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="lt_aside_nav content mCustomScrollbar">
		<h2>管理菜单</h2>
		<ul class="navlist">
			<li>
				<dl>
			   		<dt>商品信息</dt>
					<!--当前链接则添加class:active-->
					<dd><a href="${ctx}/product/prolist.html" class="active">推广列表</a></dd>
					<dd><a href="${ctx}/addproduct.jsp">添加推广</a></dd>
					<dd><a href="${ctx}/product/querypropv.html">商品访问</a></dd>
					<dd><a href="${ctx}/product/protypelist.html">商品类型</a></dd>
				</dl>
			</li>
	  		<li>
			   <dl>
				   <dt>订单信息</dt>
				   <dd><a href="#">订单列表</a></dd>
				   <dd><a href="#">添加订单</a></dd>
				   <dd><a href="#">缺货登记</a></dd>
				   <dd><a href="#">订单列表</a></dd>
			   </dl>
	  		</li>
	  
			<!-- <li>
				<p class="btm_infor">© 望唐集团 版权所有</p>
			</li> -->
		</ul>
	</aside>
	
	<script type="text/javascript" src="${ctx}/js/jquery-1.11.2.js"></script>
	<script type="text/javascript">
	
/* 	$(function(){
		var navchid = $(".navlist").children();
		navchid.find("dd").css({"display":"none"});
		navchid.find("dt").click(function(){
			if(!$(this).attr("status")){
				$(this).siblings().css({"display":""});
				$(this).parent().parent().siblings().find("dd").css({"display":"none"});
				$(this).parent().parent().siblings().find("dt").removeAttr("status");
				$(this).attr({"status":"0"});
			}else{
				$(this).siblings().css({"display":"none"});
				$(this).removeAttr("status");
			}
		})
	}); */
	</script>	
	