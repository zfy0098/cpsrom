<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/includes/ctx.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加推广产品</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
	<style type="text/css">
		.upload{width:800px;height:240px;margin:20px auto;}
        .upload .u_logo{text-align:center}
        .upload .u_box{width:640px;height:130px;border:3px dashed #E6E6E6;margin:0 auto; font-size:36px;color:#D1D1D1;text-align:center;line-height:130px;}
          
        .pic{width:840px;height:300px;margin:0 auto;}
        .pic ul li {color:#fff;list-style:none;float:left;margin:0 3px 3px 3px;}
        .pic ul li a:hover img{-webkit-transform:scale(1.5)}
          
	</style>
</head>
<body>
	<!-- 头部 -->
	<%@ include file="/includes/head.jsp" %>
	<!-- 右侧菜单 -->
	<%@ include file="/includes/nav.jsp" %>
	
		
	<section class="rt_wrap content mCustomScrollbar">
		<div class="rt_content">
		 <section>
	      <ul class="admin_tab">
	      	<li><a class="active">单个信息录入</a></li>
	      	<li><a>Excel文件批量录入</a></li>
	      	<li><a>上传商品图片</a></li>
	      </ul>
	      <!--tabCont-->
	      <div class="admin_tab_cont" style="display:block;">
		     <section>
				<h2><strong style="color:grey;">分列内容布局</strong></h2>
				<form action="${ctx}/product/addProduct.html" method="post" id="form"
				name="form" enctype="multipart/form-data">
					<ul class="ulColumn2">
						<li>
							<span class="item_name" style="width:120px;">商品名称：</span>
							<input type="text" class="textbox textbox_295" name="proname" placeholder="商品名称"/>
							<!-- <span class="errorTips">错误提示信息...</span> -->
						</li>
						<li>
							<span class="item_name" style="width:120px;">商品价格：</span>
							<input type="text" class="textbox textbox_295" name="proprice" placeholder="商品价格"/>
							<!-- <span class="errorTips">错误提示信息...</span> -->
						</li>
						
						<li>
							<span class="item_name" style="width:120px;">是否推广：</span>
							<label class="single_selection"><input type="radio" name="prostatus" value="0" checked="checked"/>立即推广</label>
							<label class="single_selection"><input type="radio" name="prostatus" value="1" />暂停推广</label>
						</li>
						<li>
							<span class="item_name" style="width:120px;">推广等级：</span>
							<input type="text" class="textbox textbox_100" name="levels" placeholder="数字越小优先级越高"/>
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
							<textarea placeholder="" name="prourl" class="textarea" style="width:500px;height:30px;"></textarea>
						</li>
						<li>
							<span class="item_name" style="width:120px;">商品推广地址：</span>
							<textarea placeholder="" name="prospread" class="textarea" style="width:500px;height:30px;"></textarea>
						</li>
						<li>
							<span class="item_name" style="width:120px;">佣金比例：</span>
							<input type="text" class="textbox textbox_295" name="commissionrate" placeholder="佣金比例"/>
							<!-- <span class="errorTips">错误提示信息...</span> -->
						</li>
						
						<li>
							<span class="item_name" style="width:120px;">佣金：</span>
							<input type="text" class="textbox textbox_295" name="commission" readonly="readonly"  placeholder="佣金比例"/>
							<!-- <span class="errorTips">错误提示信息...</span> -->
						</li>
						
						<li>
							<span class="item_name" style="width:120px;">上传图片：</span>
							<label class="uploadImg">
								<input type="file" name="img" id="img"/>
								<span>上传图片</span>
							</label>
							<span ><img id="pic" width=220px></span>
						</li>
						<li>
							<span class="item_name" style="width:120px;"></span>
							<input type="submit" class="link_btn"/>
						</li>
					</ul>
				</form>
			</section>
     	</div>
     	<div class="admin_tab_cont">
     		<h2><strong style="color:grey;">添加excel文件</strong></h2>
     		<form action="${ctx}/product/addexcelpro.html" method="post" id="excelform"
				name="form" enctype="multipart/form-data">
				<ul class="ulColumn2">
					<li>
						<span class="item_name">注意：</span>
					</li>
					<li>
						<span class="errorTips">1.excel文件内容顺序 : 商品名称,商品详情页,价格,佣金比例,佣金,推广地址;</span>
					</li>
					<li>
						<span class="errorTips">2.不要添加标题信息,并保证第一行数据的完整性</span>
					</li>
					<li>
						<span class="errorTips">3.批量录入推广等级全部为10 , 并无法上传商品图片;</span>
					</li>
					<li>
						<span class="item_name" style="width:120px;">选择文件：</span>
						<label class="uploadImg">
							<input type="file" name="excelfile" id="excelfile" />
							<span>选择文件</span>
						</label>
						<span id="filename"></span>
					</li>
					<li>
						<span class="item_name" style="width:120px;"></span>
						<input type="submit" class="link_btn" onclick="test();"/>
					</li>
				</ul>
			</form>
     	</div>
     	
     	<div class="admin_tab_cont">
     		拖拽上传文件
     		<div class="upload">
 	        	<div class="u_logo"></div>
          		<div class="u_box" id="drop_area">
             		将文件拖拽到此处
          		</div>
 	     	</div>
 	     	<div class="pic">
 	     		<ul>
 	     		</ul>
		    </div>
     	</div>
     </section>
		<input type="button" value="测试" onclick="test2();"/>
	</div>
	</section>
	<script src="${ctx}/js/jquery-1.11.2.js"></script>
	<script src="${ctx}/js/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<script type="text/javascript">
	
	function test2(){
		var fileList = document.getElementById("excelfile").files;
		alert(fileList.length);
		var formData = new FormData();
		formData.append('excelfile', fileList[0]);
		
		/* var fileList = document.getElementById("excelfile").files;
		var arry = [];
        var fd = new FormData();
        for (var i = 0; i < fileList.length; i++) {
        	arry.push(fileList[i]);
  		} */
        $.ajax({
        	type:"post",
        	url:"${ctx}/product/addexcelpro.html",
        	data:formData,
        	success:function(result){
        		alert(text);
        	}
        });
        
	}
	
		function test(){
			var fileList = document.getElementById("excelfile").files;
			var xhr = new XMLHttpRequest();
            xhr.open("post", "${ctx}/product/addexcelpro.html", true);
            //告诉服务器是以个Ajax 请求
            xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
            
            var fd = new FormData();
            for (var i = 0; i < fileList.length; i++) {
          		fd.append("excelfile",fileList[i]);
	  		}
            xhr.send(fd);
            
            xhr.onreadystatechange = function(){
          		var XMLHttpReq = xhr;
          		if (XMLHttpReq.readyState == 4) {
          	        if (XMLHttpReq.status == 200) {
          	            var text = XMLHttpReq.responseText;
          	            alert(text);
          	        }
          	    }
            }
		}
	
	
		$().ready(function(){
	        /* $('#dtb-msg1 .compatible').show();
	        $('#dtb-msg1 .notcompatible').hide();
	        $('#drop_zone_home').hover(function(){
	            $(this).children('p').stop().animate({top:'0px'},200);
	        },function(){
	            $(this).children('p').stop().animate({top:'-44px'},200);
	        }); */
	        //功能实现
	        $(document).on({
	            dragleave:function(e){
	                e.preventDefault();
	                //$('.dashboard_target_box').removeClass('over');
	                $("#drop_area").removeClass("over");
	            },
	            drop:function(e){
	                e.preventDefault();
	                //$('.dashboard_target_box').removeClass('over');
	            },
	            dragenter:function(e){
	                e.preventDefault();
	                //$('.dashboard_target_box').addClass('over');
	                $("#drop_area").addClass("over");
	            },
	            dragover:function(e){
	                e.preventDefault();
	                //$('.dashboard_target_box').addClass('over');
	                $("#drop_area").addClass("over");
	            }
	        });
	        var box = document.getElementById('drop_area');
	        box.addEventListener("drop",function(e){
	            e.preventDefault();
	            //获取文件列表
	            var fileList = e.dataTransfer.files;
	            var img = document.createElement('img');
	            document.body.appendChild(img);
	            
	            //检测是否是拖拽文件到页面的操作
	            if(fileList.length == 0){
	                $('.dashboard_target_box').removeClass('over');
	                return;
	            }
	            //检测文件是不是图片
	            /* alert(fileList[0].type);
	            alert(fileList[0].type.indexOf('image')); */
	            /* if(fileList[0].type.indexOf('image') == -1){
	                $('.dashboard_target_box').removeClass('over');
	                return;
	            } */
	            
	            //实例化file reader对象
	            var reader = new FileReader();
	            reader.onload = function(e){
	                img.src = e.target.result;
	            };
	            reader.readAsDataURL(fileList[0]);
	            
	             /* if($.browser.safari){
	                //Chrome8+
	                alert("Chrome8");
	                img.src = window.webkitURL.createObjectURL(fileList[0]);
	            }else if($.browser.mozilla){
	                //FF4+
	                alert("ff4");
	                img.src = window.URL.createObjectURL(fileList[0]);
	            }else{
	                alert("else");
	                //实例化file reader对象
	                var reader = new FileReader();
	                reader.onload = function(e){
	                    img.src = this.result;
	                    $(document.body).appendChild(img);
	                };
	                reader.readAsDataURL(fileList[0]);
	            }  */
	            var xhr = new XMLHttpRequest();
	            xhr.open("post", "${ctx}/product/uploadproimg.html", true);
	            //告诉服务器是以个Ajax 请求
	            xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
	            
	            var fd = new FormData();
	            for (var i = 0; i < fileList.length; i++) {
	          	  fd.append("img",fileList[i]);
		  		}
	            xhr.send(fd);
	            
	            xhr.onreadystatechange = function(){
	          	  var XMLHttpReq = xhr;
	          	  if (XMLHttpReq.readyState == 4) {
	          	        if (XMLHttpReq.status == 200) {
	          	            var text = XMLHttpReq.responseText;
	          	            var strs= new Array(); //定义一数组 
	          	            strs = text.split(",");
	          	            var html = "";
	          	           
	          	            for(var i=0;i<strs.length;i++){
	          	            	html +="<li>"
	        	     				+"<span>"
	        	     				+"<img src='"+strs[i]+"' height='240px;' />"
	        	     				+"</span>"
	        	     				+"<span  style='color: #000'>"
	        	     				+strs[i]
	        	     				+"</span>"
	        	     				+"</li>";
	          	            }
	          	            $(".pic ul").html(html);
	          	        }
	          	    }
	            }
	        },false);
	  	});
	  
		  
		$(document).ready(function(){
			//tab
			$(".admin_tab li a").click(function(){
				var liindex = $(".admin_tab li a").index(this);
				$(this).addClass("active").parent().siblings().find("a").removeClass("active");
				$(".admin_tab_cont").eq(liindex).fadeIn(500).siblings(".admin_tab_cont").hide();
		 	});
		});
	
		$("input[name=commissionrate] , input[name=proprice]").blur(function(){
			$("input[name=commission]").val($(this).val()*$("input[name=proprice]").val()/100);
		});
		
		
		document.getElementById("excelfile").onclick = function(){
			$("#filename").html("");
		}
		
		document.getElementById("excelfile").onchange = function(){
			var file = this.files;
			$("#filename").html(file[0].name);
		}
		
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