<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/includes/ctx.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改推广产品</title>
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
		<!-- <h2><strong style="color:grey;">商品详细</strong></h2> -->
			<div class="page_title">	
			<h2 class="fl" style="color:grey;">商品详细</h2>
			<a href="javascript:void(0);" onclick="javascript:history.back(-1)" class="fr top_rt_btn">返回</a>
			</div>
			<form action="${ctx}/product/updatePro.html" method="post" id="form"
			name="form" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${product.id}" />
				<input type="hidden" name="proimg" value="${product.proimg}"/>
				<ul class="ulColumn2">
					<li>
						<span class="item_name" style="width:120px;">商品名称：</span>
						<input type="text" class="textbox textbox_295" name="proname" value="${product.proname}" placeholder="商品名称"/>
						<!-- <span class="errorTips">错误提示信息...</span> -->
					</li>
					<li>
						<span class="item_name" style="width:120px;">商品价格：</span>
						<input type="text" class="textbox textbox_295" name="proprice" value="${product.proprice}" placeholder="商品价格"/>
						<!-- <span class="errorTips">错误提示信息...</span> -->
					</li>
					
					<li>
						<span class="item_name" style="width:120px;">是否推广：</span>
						<label class="single_selection"><input type="radio" name="prostatus" value="0" <c:if test="${product.prostatus==0}">checked="checked"</c:if>/>立即推广</label>
						<label class="single_selection"><input type="radio" name="prostatus" value="1" <c:if test="${product.prostatus==1}">checked="checked"</c:if>/>暂停推广</label>
					</li>
					<li>
						<span class="item_name" style="width:120px;">推广等级：</span>
						<input type="text" class="textbox textbox_100" name="levels" value="${product.levels}" placeholder="数字越小优先级越高"/>
						<!-- <span class="errorTips">错误提示信息...</span> -->
					</li> 
					
					<!-- <li>
						<span class="item_name" style="width:120px;">推广等级：</span>
						<select class="select">
							<option>选择品牌</option>
						</select>
						<span class="errorTips">错误提示信息...</span>
					</li>  -->
					<li>
						<span class="item_name" style="width:120px;">商品详情地址：</span>
						<textarea placeholder="" name="prourl" class="textarea" style="width:500px;height:30px;">${product.prourl}</textarea>
					</li>
					<li>
						<span class="item_name" style="width:120px;">商品推广地址：</span>
						<textarea placeholder="" name="prospread" class="textarea" style="width:500px;height:30px;">${product.prospread}</textarea>
					</li>
					<li>
						<span class="item_name" style="width:120px;">佣金比例：</span>
						<input type="text" class="textbox textbox_295" name="commissionrate" value="${product.commissionrate}" placeholder="佣金比例"/>
						<!-- <span class="errorTips">错误提示信息...</span> -->
					</li>
					
					<li>
						<span class="item_name" style="width:120px;">佣金：</span>
						<input type="text" class="textbox textbox_295" name="commission" value="${product.commission}" readonly="readonly"  placeholder="佣金比例"/>
						<!-- <span class="errorTips">错误提示信息...</span> -->
					</li>
					
					<li>
						<span class="item_name" style="width:120px;">更改图片：</span>
						<label class="uploadImg">
							<input type="file" name="img" id="img"/>
							<span>上传图片</span>
						</label>
						<span ><img id="oldpic" src="${product.proimg}" width=110px><img id="pic" width=220px></span>
					</li>
					<li>
						<span class="item_name" style="width:120px;"></span>
						<input type="submit" class="link_btn"/>
					</li>
				</ul>
			</form>
		</section>
	</div>
	</section>
	<script src="${ctx}/js/jquery-1.11.2.js"></script>
	<script src="${ctx}/js/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<script type="text/javascript">
	
		$("input[name=commissionrate] , input[name=proprice]").blur(function(){
			$("input[name=commission]").val($(this).val()*$("input[name=proprice]").val()/100);
		});
	
		var reader = new FileReader();
	    reader.onload = function(e){
	    	document.getElementById('pic').setAttribute('src', e.target.result);
	    };
	    function readURL(input) {
	    	if (input.files && input.files[0]) {
	        	reader.readAsDataURL(input.files[0]);
	        }
	    };
	    document.getElementById('img').onchange = function(){
	    	readURL(this);
	    };
	</script>
</body>
</html>