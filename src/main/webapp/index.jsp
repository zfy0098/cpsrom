<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/includes/ctx.jsp" %>
<%@ taglib uri="/WEB-INF/tag/function.tld" prefix="zfn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cps后台管理系统</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
	<style type="text/css">
		#picdiv{width: 200px; height:200px;position: absolute;left: 60%;top: 50%;margin-top: -100px;
		z-index:9}
	</style>
</head>
<body>
	<%@ include file="/includes/head.jsp" %>
	<!--aside nav-->
	<%@ include file="/includes/nav.jsp" %>
	<div id="picdiv"></div>
	
<section class="rt_wrap content mCustomScrollbar">
	<div class="rt_content">
		<section>
			<!-- <h2><strong style="color:grey;">页面标题及表格/分页（根据具体情况列入重点，切勿放置可扩展内容不定的数据）</strong></h2>
      		 -->
      		 <div class="page_title">
				<h2 class="fl">推广产品列表</h2>
				<a href="${ctx}/addproduct.jsp" class="fr top_rt_btn">添加新商品</a>
      		</div>
		<table class="table">
	       <tr>
	        <th style="width: 15%">商品名称</th>
	        <th style="width: 7%">价钱</th>
	        <th style="width: 7%">佣金</th>
	        <th style="width: 17%">url地址</th>
	        <th style="width: 7%">是否推广</th>
	        <th style="width: 7%">推广等级</th>
	        <th style="width: 15%">添加时间</th>
	        <th>操作</th>
	       </tr>
	       
	       <c:forEach items="${list}" var="list">
	       <tr>
	        <td style="width:265px;"><div class="cut_title ellipsis">${list.proname}</div></td>
	        <td>${list.proprice}</td>
	        <td>${list.commission}</td>
	        <td onmouseover="showpic(this)" onmouseout="hidepic();" data-proimg="${list.proimg}">${list.prourl}</td>
	        <td>${zfn:statusps(list.prostatus)}</td>
	        <td>${list.levels}</td>
	        <td>${list.indate}</td>
	        <%-- <fmt:formatDate value="${list.indate}" pattern="yyyy-MM-dd HH:mm" /> --%>
	        <td>
	         	<a href="${ctx}/product/getProbyId.html?id=${list.id}" class="inner_btn">详细</a>
	         	<!-- <a href="" class="inner_btn">修改</a> -->
	       	</td>
	       </tr>
	       </c:forEach>
	       
	       
	      <!-- 
	      <a href="#">表内链接</a>
	         <a href="#" class="inner_btn">表内按钮</a>
	         
	         
	       <tr>
	        <td style="width:265px;"><div class="cut_title ellipsis">265px宽·长标题字符串截取，仅适合单行截取，多行截取程序定义一下。</div></td>
	        <td>内容二</td>
	        <td>内容三</td>
	        <td>内容四</td>
	        <td>内容五</td>
	        <td>
	         <a href="#">表内链接</a>
	         <a href="#" class="inner_btn">表内按钮</a>
	       	</td>
	       </tr>
	       <tr>
	        <td style="width:265px;"><div class="cut_title ellipsis">265px宽·长标题字符串截取，仅适合单行截取，多行截取程序定义一下。</div></td>
	        <td>内容二</td>
	        <td>内容三</td>
	        <td>内容四</td>
	        <td>内容五</td>
	        <td>
	         <a href="#">表内链接</a>
	         <a href="#" class="inner_btn">表内按钮</a>
	        </td>
	       </tr>
	       <tr>
	        <td style="width:265px;"><div class="cut_title ellipsis">265px宽·长标题字符串截取，仅适合单行截取，多行截取程序定义一下。</div></td>
	        <td>内容二</td>
	        <td>内容三</td>
	        <td>内容四</td>
	        <td>内容五</td>
	        <td>
	         <a href="#">表内链接</a>
	         <a href="#" class="inner_btn">表内按钮</a>
	        </td>
	       </tr>\\<a>3</a>
	       <a>…</a> -->
	      </table>
	      <form action="${ctx}/product/prolist.html" id="form" method="post">
	      	<input type="hidden" name="page" id="page" value="${page}" />
		      <aside class="pagedesc fl">
		     	 <span>共${totalCount}条</span>
		     	 <span>共${totalPage}页</span>
		     	 <span>第${page}页</span>
		      </aside>
		      <aside class="paging fr">
		       <a href="javascript:void(0);" onclick="next(0)" >首页</a>
		       <a href="javascript:void(0);" onclick="next(1)" >上一页</a>
		       <a href="javascript:void(0);" onclick="next(2)" >下一页</a>
		       <a href="javascript:void(0);" onclick="next(3)" >尾页</a>
		      </aside>
		   </form>
		 </section>
	 </div>
	</section>
	
	<script type="text/javascript" src="${ctx}/js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
	
		function next(page){
			
			switch(page){
				//  首页
				case 0:
					$("#page").val(1);
					break;
				// 上一页
				case 1:
					$("#page").val($("#page").val()-1);
					break;
				// 下一页
				case 2:
					$("#page").val(parseInt($("#page").val())+1);
					break;
				// 尾页
				case 3:
					$("#page").val("${totalPage}");
					break;
			}
			$("#form").submit() ;
			
		}
	
		function showpic(obj){
			var img ="<img src='"+obj.getAttribute("data-proimg")+"' height='200px;' />";
			$("#picdiv").html(img);
			$("#picdiv").css({"display":""});
		}
		function hidepic(){
			$("#picdiv").css({"display":"none"});
		}
		hidepic();
		
	/* (function($){
		$(window).load(function(){
			
			$("a[rel='load-content']").click(function(e){
				e.preventDefault();
				var url=$(this).attr("href");
				$.get(url,function(data){
					$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
					//scroll-to appended content 
					$(".content").mCustomScrollbar("scrollTo","h2:last");
				});
			});
			
			$(".content").delegate("a[href='top']","click",function(e){
				e.preventDefault();
				$(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
			});
			
		});
	})(jQuery); */
	
	
	</script>
</body>
</html>