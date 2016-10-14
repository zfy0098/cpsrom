<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/includes/ctx.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品类型</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
</head>
<body>
	<!-- 头部 -->
	<%@ include file="/includes/head.jsp" %>
	<!-- 右侧菜单 -->
	<%@ include file="/includes/nav.jsp" %>
	<section class="rt_wrap content mCustomScrollbar">
		<div class="rt_content">
			<section>
      			<div class="page_title">
					<h2 class="fl">商品类型</h2>
					<input type="button"  class="fr top_rt_btn" value="添加父类型" id="showPopTxt" >
      			</div>
				<table class="table">
	       			<tr>
	        			<th style="width: 40%">父类型名称</th>
	        			<th style="width: 40%">子类型名称</th>
	        			<th>操作</th>
	       			</tr>
	       
	       			<c:forEach items="${list}" var="list">
	       			<tr>
				        <td class="parent" data-typeid="${list.typeid}" >${list.name}</td>
				        <td style="width:265px;"></td>
				        <td>
				         	<a href="javascript:void(0);" class="inner_btn" onclick="editProtype('${list.id}','${list.name}',this);">修改</a>
				       	</td>
	      			</tr>
	      			<c:forEach items="${list.typelist}" var="childlist">
	      			<tr>
				        <td></td>
				        <td style="width:265px;">${childlist.name}</td>
				        <td>
				         	<a href="javascript:void(0);" class="inner_btn"  onclick="editProtype('${childlist.id}','${childlist.name}',this);">修改</a>
				       	</td>
	      			</tr>
	      			</c:forEach>
	       			</c:forEach>
	     		</table>
			    <%-- <form action="${ctx}/product/prolist.html" id="form" method="post">
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
				</form> --%>
			</section>
	 	</div>
	</section>
	<section class="pop_bg">
    	<div class="pop_cont">
       		<!--title-->
       		<input type="hidden" id="parent"/>
			<h3>添加商品类型</h3>
   			<div class="pop_cont_input">
    			<ul>
     				<li>
      					<span>标题：</span>
      					<input type="text" placeholder="定义提示语..." class="textbox" id="typename"/>
     				</li>
     				
   				</ul>
   			</div>
  			<!--以pop_cont_text分界-->
   			<div class="pop_cont_text">
    			这里是文字性提示信息！
   			</div>
   			<!--bottom:operate->button-->
   			<div class="btm_btn">
    			<input type="button" value="确认" class="input_btn trueBtn"/>
    			<input type="button" value="关闭" class="input_btn falseBtn"/>
  			</div>
 		</div>
    </section>
	<script type="text/javascript" src="${ctx}/js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			 //弹出文本性提示框
			$("#showPopTxt").click(function(){
				$("#parent").val(0);
				$(".pop_bg").fadeIn();
				
				 //弹出：确认按钮
				$(".trueBtn").click(function(){
					addprotype();
					$(".pop_bg").fadeOut();
				});
			});
			 
			$(".parent").click(function(){
				$("#parent").val(this.getAttribute("data-typeid"));
				$(".pop_bg").fadeIn();
				 //弹出：确认按钮
				$(".trueBtn").click(function(){
					addprotype();
					$(".pop_bg").fadeOut();
				});
			})
			
			//弹出：取消或关闭按钮
			$(".falseBtn").click(function(){
				$(".pop_bg").fadeOut();
			});
		});
		
		
		function editProtype(id,name,obj){
			$("#typename").val(name);
			$(".pop_bg").fadeIn();
			 //弹出：确认按钮
			$(".trueBtn").click(function(){
				name = $("#typename").val();
				$.ajax({
					type:"post",
					url:"${ctx}/product/updateProtype.html",
					data:{id:id,name:name},
					success:function(){
						window.location.href="${ctx}/product/protypelist.html"
					}
				});
				$(".pop_bg").fadeOut();
			});
		}
		
		//  添加商品类型  ajax请求
		function addprotype(){
			var typename = $("#typename").val();
			var parent = $("#parent").val();
			$.ajax({
				type:"post",
				url:"${ctx}/product/addprotype.html",
				data:{name:typename,parent:parent},
				success:function(result){
					window.location.href="${ctx}/product/protypelist.html"
				}
			});
		}
		
	</script>
</body>
</html>