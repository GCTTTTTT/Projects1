<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑文章</title>
<%
	int article_id = (int)request.getAttribute("article_id");
	String article_content = (String)request.getAttribute("article_content");
	String article_desc = (String)request.getAttribute("article_desc");
	String article_image = (String)request.getAttribute("article_image");
	int article_isTop = (int)request.getAttribute("article_isTop");
	String article_title = (String)request.getAttribute("article_title");
	String category_name = (String)request.getAttribute("category_name");
	int tag1 = (int)request.getAttribute("tag1");
	int tag2 = (int)request.getAttribute("tag2");
	int tag3 = (int)request.getAttribute("tag3");	
	String parent_name = (String)request.getAttribute("parent_name");
%>
<style type="text/css">
#box {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
	/*background-image: url(../css/image/18.gif);  */
	padding: 20px;
	opacity: 0.8;
}
::-webkit-scrollbar {

	display: none; /* Chrome Safari */

}

.layui-form-select dl {
	z-index: 1999;
}
</style>
	<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
</head>
<body>
	<div id="box">
	<input value = "<%=article_id %>" hidden = "hidden" id = "tid">
	<input value = "<%=tag1 %>" hidden = "hidden" id = "tag_1">
	<input value = "<%=tag2 %>" hidden = "hidden" id = "tag_2">
	<input value = "<%=tag3 %>" hidden = "hidden" id = "tag_3">
	<input value = "<%=article_isTop %>" hidden = "hidden" id = "article_isTop">
	
		<form class="layui-form" action="" enctype="multipart/form-data"
			id="myform">
			<h3 style="text-align:center;margin-bottom:20px;text-shadow:1px 1px 2px green;">编辑文章</h3>
			<div class="layui-form-item">
				<label class="layui-form-label">文章标题</label>
				<div class="layui-input-block" style="width: 420px;">
					<input type="text" name="title" required lay-verify="required"
						placeholder="请输入标题" autocomplete="off" class="layui-input"
						id="article_title" value=<%=article_title%>>
				</div>
			</div>

			<div class="layui-form-item" style="z-index: 1999px;">
				<label class="layui-form-label">文章分类</label>
				<div class="layui-input-inline" style="width: 180px;">
					<select name="first_category" lay-verify="required"
						id="first_category" lay-filter="myFirstSelect">
						<option value=""></option>
					</select>
				</div>
				<div class="layui-input-inline" style="width: 180px;">
					<select name="second_category" lay-verify="required"
						id="second_category" lay-filter="mySecondSelect">

					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">置顶</label>
				<div class="layui-input-block">
					<input type="radio" name="isTop" value="是" title="是" id="isT"> <input
						type="radio" name="isTop" value="否" title="否" checked>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<!-- 在这里放一个img标签 默认不显示 -->
<%--					不用封面图了--%>
<%--					<button type="button" class="layui-btn" id="test1">--%>
<%--						<i class="layui-icon">&#xe67c;</i>上传封面图--%>
<%--					</button>--%>
					<!--  style="display:none;" -->
<%--					<div style="height: 20px; width: 100%;"></div>--%>
<%--					<img id="article_image" class="article_image" src="<%=article_image %>"--%>
<%--						style=" margin-top: 20px;width:135px;height:180px;"></img>--%>
<%--				</div>--%>
			</div>

			<%--					layui表格try--%>
			<div class="layui-form-item layui-row layui-col-space">
				<div class="layui-col-md2" id="table_div" style="overflow-y:scroll;border: 2px solid #a0b3d6;border-radius: 5px;height:479.73px;max-height: 479.73px">
					<%--					<label class="layui-form-label">在线编辑</label>--%>
					<table class="layui-table" id="table1id" cellspacing="0" border="1">
						<colgroup>
							<col width="100">
							<col width="100">
							<col>
						</colgroup>
						<thead>
						<tr>
							<th>修改前</th>
							<th>修改后</th>
						</tr>
						</thead>
						<tbody id="tbody1">
						</tbody>
					</table>

				</div>



			<div  style="display:none;">
				<input type="hidden" name="article_title" id="content" 
						value="<%=article_content %>"/>
			</div>
<%--			<div class="layui-form-item">--%>
<%--				<label class="layui-form-label">文章内容</label>--%>
<%--				<div class="layui-input-block">--%>
				<div class="layui-input-inline layui-col-md10">
					<div id="editor" name="article_content"
						style="width: 900px; height: 400px;">
						
					</div>
				</div>
<%--			</div>--%>
			</div>
<%--纠错按钮--%>
<%--			<div class="layui-row layui-form-item layui-col-md1 layui-col-md-offset6">--%>
<%--				<button id="submit1" type="button" class="layui-btn layui-btn-normal">开始纠错</button>--%>
<%--			</div>--%>
<%--			纠错按钮+一键替换--%>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button id="submit2" type="button" class="layui-btn layui-btn-radius" style="margin-left: 30%;">一键替换</button>
					<%--			</div>--%>
					<%--			<div class="layui-row layui-form-item layui-col-md1">--%>
					<button id="submit1" type="button" class="layui-btn layui-btn-radius" style="margin-left: 12%;">开始纠错</button>
				</div>

			</div>
			<div class="layui-form-item">
<%--				<label class="layui-form-label">标签</label>--%>
				<div class="layui-input-inline" style="width: 150px;">
					<select name="tag1" id="tag1" lay-verify="" lay-search>
					</select>
				</div>
				<div class="layui-input-inline" style="width: 150px;">
					<select name="tag2" id="tag2" lay-verify="" lay-search>
						<option id="0">可不选</option>
					</select>
				</div>
				<div class="layui-input-inline" style="width: 150px;">
					<select name="tag3" id="tag3" lay-verify="" lay-search>
						<option id="0">可不选</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">文章简介</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" class="layui-textarea"
						id="article_desc" ></textarea>
				</div>
			</div>
			<div class="layui-form-item" style="margin-top: 50px;">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-radius" type="button" lay-submit
						lay-filter="formDemo">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary layui-btn-radius"
						style="margin-left: 12%;">重置</button>
				</div>
			</div>
		</form>


	</div>
</body>
<script>
	// var cnt = "0";
	// =================================================
	// 纠错功能实现
	// ajax--post请求
	// window.onload=function (){
	// 	alert("window.onload");
	// 	var form = layui.form;
	// 	var ue = window.UE.getEditor('editor');
	// }
	$(function(){
		// ajax_try
		$("#submit1").click(function(){
			// cnt = "1";
			// alert(cnt);


			$("#table1id  tr:not(:first)").empty();
			// $("#tbody1").html()
			// $("#table1id").empty("");

			// var tb1 = document.getElementById("tbody1");
			// // var tba = document.getElementById("table1id");
			// for (var i = tb1.length-1;i>=0;i--){
			//     tb1.removeChild(tb1[i]);
			// }
			//提取纯文本！！！！
			var article_content_txt = UE.getEditor('editor').getContentTxt();
			// alert("article_content_txt:  "+article_content_txt);
			var article_json = "text="+article_content_txt;
			// alert("article_json:  "+article_json);
			// alert("String(text=article_content_txt):  "+String(text=article_content_txt));
			$.ajax({
				type:"POST",
				async:false,
				url:"http://368672z389.oicp.vip/csc",
				// data:"action=jQueryAjax",
				// data:{"text":"国际田联认正中国接力队奥运铜牌。恭喜中国接力队！"},
				// data:$("#form01").serialize(),
				// orgText=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！
				// data:decodeURIComponent($("#uploadForm").serialize(),true),
				// 传数据
				data:"text="+article_content_txt,
				// data:String(text=article_content_txt),

				// data:"text=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！",
				// contentType:"application/x-www-form-urlencoded; charset=GBK",
				// contentType:"application/x-www-form-urlencoded; charset=GBK",
				success:function (data) {
					alert("success");
					data_try=JSON.parse(data);
					// alert(data_try.correct_result);
					// alert(data_try)
					var arr = data_try.detailed_result;
					var tt1 = data_try.correct_result;
					// String posttt1 = tt1;
					// alert("tt1:  "+tt1);
					//try
					// 改文件（不用）======================
// 					$.ajax({
// 						// url:"http://localhost:8080/LRt1/UploadServlet",
// 						url:"http://192.168.201.134:8080/LRt1/UploadServlet",//注意这里的ip地址可能会变化，现在先写死
//
//
// // data:"action=jQueryAjax",
// //                             data:posttt1,
// 						data:String(text=tt1),
// 						type:"POST",
// 						success:function (data) {
// // alert(" 服务器返回的数据是： " + data);
// // var jsonObj = JSON.parse(data);
// //                                 $("#msg").html(" 编号：" + data.id + " ,  姓名：" + data.name);
// //                                 alert("success!");
// 						},
// 						dataType : "json"
// 					});
					// ============================================

					// alert(arr);

					var tbody = document.getElementById('tbody1');
					while (tbody.length){

						tbody.removeChild(tbody.parentNode);
					}
					for (var ar in arr){
						// alert(arr[ar][1]+" "+arr[ar][2]);
						var tr = document.createElement('tr');
						tr.innerHTML="<tr><td>"+arr[ar][1]+"</td>" + "<td>"+arr[ar][2]+"</td></tr>";
						tbody.appendChild(tr);

					}
					// 高亮标出（不用）========================================
					// var arr_correct_split = data_try.correct_result_split;
					// var arr_original_split = data_try.original_text_split;
					// var str_res = "";
					// for (var i in arr_correct_split){
					// 	// alert("this is "+ i);
					// 	for (var j in arr_correct_split[i]){
					// 		// alert(arr_correct_split[i][j]);
					// 		if (arr_correct_split[i][j] == arr_original_split[i][j]){
					// 			str_res+=arr_correct_split[i][j];
					// 		}
					// 		else {
					// 			str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";
					// 		}
					// 	}
					// }
					// // alert(str_res);
					// $("#msg").html(str_res);
					// // $("#msg").html(data_try.correct_result);
					// ========================================
				},
				dataType : "text"
			});
		});

		$("#submit2").click(function(){
			$("#table1id  tr:not(:first)").empty();
			var ue = UE.getEditor('editor');
			// var article_content_txt = UE.getEditor('editor').getContentTxt();
			var article_content_txt = ue.getContentTxt();
			var article_content = ue.getContent();
			// alert(article_content_txt);
			// var instead_text = article_content_txt+"   这是试试哈";
			// ue.ready(function() {
			// 	//设置编辑器的内容
			// 	// ue.setContent('测试加载动态内容');
			// 	ue.setContent(instead_text);
			// });

			// ajax请求
			$.ajax({
				type:"POST",
				// async:false,
				url:"http://368672z389.oicp.vip/csc",
				// data:"action=jQueryAjax",
				// data:{"text":"国际田联认正中国接力队奥运铜牌。恭喜中国接力队！"},
				// data:$("#form01").serialize(),
				// orgText=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！
				// data:decodeURIComponent($("#uploadForm").serialize(),true),
				// 传数据
				data:"text="+article_content_txt,
				// data:String(text=article_content_txt),

				// data:"text=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！",
				// contentType:"application/x-www-form-urlencoded; charset=GBK",
				// contentType:"application/x-www-form-urlencoded; charset=GBK",
				success:function (data) {
					alert("success");

					data_try=JSON.parse(data);
					// alert(data_try.correct_result);
					// alert(data_try)
					var arr = data_try.detailed_result;
					var tt1 = data_try.correct_result;

					// 有格式的文字替换
					var arr_correct_split = data_try.correct_result_split;
					var arr_original_split = data_try.original_text_split;
					var correct_result = data_try.correct_result;//正确结果
					// alert(correct_result.length);
					var str_res = "";
					var flag = true;
					var cnt_correct = 0;
					//三个=？
					for (var i in article_content){
						if (article_content[i] === '<'){
							flag = false;
							str_res+=article_content[i];
							continue;
						}
						else if(article_content[i] === '>'){
							flag = true;
							str_res+=article_content[i];
							continue;
						}
						if (flag === true){//可以进行比较了
							str_res+=correct_result[cnt_correct];
							cnt_correct+=1;
						}
						else{//为框内的内容，直接加
							str_res+=article_content[i];
						}

					}
					// alert("str_res: "+str_res);
					// alert("cnt: "+cnt_correct);
					// for (var i in arr_correct_split){
					// 	// alert("this is "+ i)
					// 	for (var j in arr_correct_split[i]){
					// 		if ()
					// 		// alert(arr_correct_split[i][j]);
					// 		if (arr_correct_split[i][j] == arr_original_split[i][j]){
					// 			str_res+=arr_correct_split[i][j];
					// 		}
					// 		else {
					// 			str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";
					// 		}
					// 	}
					// }
					// alert(str_res);


					// ue.ready(function() {
					// 	//设置编辑器的内容
					// 	// ue.setContent('测试加载动态内容');
					// 	ue.setContent(tt1);
					// });
					ue.ready(function() {
						//设置编辑器的内容
						// ue.setContent('测试加载动态内容');
						ue.setContent(str_res);
					});
					// alert(tt1);
					// ue.ready(function() {
					// 	//设置编辑器的内容
					// 	// ue.setContent('测试加载动态内容');
					// 	ue.setContent(tt1);
					// });
					// String posttt1 = tt1;
					// alert("tt1:  "+tt1);
					//try
					// 改文件（不用）======================
// 					$.ajax({
// 						// url:"http://localhost:8080/LRt1/UploadServlet",
// 						url:"http://192.168.201.134:8080/LRt1/UploadServlet",//注意这里的ip地址可能会变化，现在先写死
//
//
// // data:"action=jQueryAjax",
// //                             data:posttt1,
// 						data:String(text=tt1),
// 						type:"POST",
// 						success:function (data) {
// // alert(" 服务器返回的数据是： " + data);
// // var jsonObj = JSON.parse(data);
// //                                 $("#msg").html(" 编号：" + data.id + " ,  姓名：" + data.name);
// //                                 alert("success!");
// 						},
// 						dataType : "json"
// 					});
					// ============================================
					// alert()
					// 		高亮标出（不用）========================================
					// 		var arr_correct_split = data_try.correct_result_split;
					// 		var arr_original_split = data_try.original_text_split;
					// 		var str_res = "";
					// 		for (var i in arr_correct_split){
					// 			// alert("this is "+ i);
					// 			for (var j in arr_correct_split[i]){
					// 				// alert(arr_correct_split[i][j]);
					// 				if (arr_correct_split[i][j] == arr_original_split[i][j]){
					// 					str_res+=arr_correct_split[i][j];
					// 				}
					// 				else {
					// 					str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";
					// 				}
					// 			}
					// 		}
					// 		alert(str_res);

					// alert(arr);
					// var tbody = document.getElementById('tbody1');
					// while (tbody.length){
					//
					// 	tbody.removeChild(tbody.parentNode);
					// }
					// for (var ar in arr){
					// 	// alert(arr[ar][1]+" "+arr[ar][2]);
					// 	var tr = document.createElement('tr');
					// 	tr.innerHTML="<tr><td>"+arr[ar][1]+"</td>" + "<td>"+arr[ar][2]+"</td></tr>";
					// 	tbody.appendChild(tr);
					//
					// }
					// 高亮标出（不用）========================================
					// var arr_correct_split = data_try.correct_result_split;
					// var arr_original_split = data_try.original_text_split;
					// var str_res = "";
					// for (var i in arr_correct_split){
					// 	// alert("this is "+ i);
					// 	for (var j in arr_correct_split[i]){
					// 		// alert(arr_correct_split[i][j]);
					// 		if (arr_correct_split[i][j] == arr_original_split[i][j]){
					// 			str_res+=arr_correct_split[i][j];
					// 		}
					// 		else {
					// 			str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";
					// 		}
					// 	}
					// }
					// // alert(str_res);
					// $("#msg").html(str_res);
					// // $("#msg").html(data_try.correct_result);
					// ========================================
				},
				dataType : "text"
			});
			// $("#table1id  tr:not(:first)").empty();
			// var article_content_txt = UE.getEditor('editor').getContentTxt();
			// var article_json = "text="+article_content_txt;
			// $.ajax({
			// 	type:"POST",
			// 	async:false,
			// 	url:"http://368672z389.oicp.vip/csc",
			// 	// data:"action=jQueryAjax",
			// 	// data:{"text":"国际田联认正中国接力队奥运铜牌。恭喜中国接力队！"},
			// 	// data:$("#form01").serialize(),
			// 	// orgText=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！
			// 	// data:decodeURIComponent($("#uploadForm").serialize(),true),
			// 	// 传数据
			// 	data:"text="+article_content_txt,
			// 	// contentType:"application/x-www-form-urlencoded; charset=GBK",
			// 	success:function (data) {
			// 		alert("success");
			// 		data_try=JSON.parse(data);
			// 		var arr = data_try.detailed_result;
			// 		var tt1 = data_try.correct_result;
			// 		var tbody = document.getElementById('tbody1');
			// 		while (tbody.length){
			// 			tbody.removeChild(tbody.parentNode);
			// 		}
			// 		for (var ar in arr){
			// 			// alert(arr[ar][1]+" "+arr[ar][2]);
			// 			var tr = document.createElement('tr');
			// 			tr.innerHTML="<tr><td>"+arr[ar][1]+"</td>" + "<td>"+arr[ar][2]+"</td></tr>";
			// 			tbody.appendChild(tr);
			//
			// 		}
			// 		// 高亮标出（不用）========================================
			// 		// var arr_correct_split = data_try.correct_result_split;
			// 		// var arr_original_split = data_try.original_text_split;
			// 		// var str_res = "";
			// 		// for (var i in arr_correct_split){
			// 		// 	// alert("this is "+ i);
			// 		// 	for (var j in arr_correct_split[i]){
			// 		// 		// alert(arr_correct_split[i][j]);
			// 		// 		if (arr_correct_split[i][j] == arr_original_split[i][j]){
			// 		// 			str_res+=arr_correct_split[i][j];
			// 		// 		}
			// 		// 		else {
			// 		// 			str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";
			// 		// 		}
			// 		// 	}
			// 		// }
			// 		// // alert(str_res);
			// 		// $("#msg").html(str_res);
			// 		// // $("#msg").html(data_try.correct_result);
			// 		// ========================================
			// 	},
			// 	dataType : "text"
			// });
		});

	});


	function getFirstCategory() {
		$("#article_desc").val("<%=article_desc%>");
		$.post("${ctx}/getFirstCategory", {}, function(result) {
			with (result) {
				for (var i = 0; i < data.length; i++) {
					var option = "<option id="+data[i].category_id+">"
							+ data[i].category_name + "</option>";
					$("#first_category").append(option);
					layui.form.render('select');
				}
			}
			//当数据加载完毕后，调用trigger方法触发选中事件
			

		}, "json");
		$.ajaxSetup({
			cache : false
		});
	}
	function getFirstTag() {
		$.post("${ctx}/getFirstTag", {}, function(result) {
			with (result) {
				for (var i = 0; i < data.length; i++) {
					var option = "<option id="+data[i].tag_id+">"
							+ data[i].tag_name + "</option>";
					$("#tag1").append(option);
					$("#tag2").append(option);
					$("#tag3").append(option);
					layui.form.render('select');
				}
			}
		}, "json");
		$.ajaxSetup({
			cache : false
		});
	}
 	function getSelectedCategory(){		
 		setTimeout(function () {
 			  $('select[name="first_category"]').next().find('.layui-anim').children('dd[lay-value="<%=parent_name%>"]').click();
 			  $('select[name="second_category"]').next().find('.layui-anim').children('dd[lay-value="<%=category_name%>"]').click();
 	           
		},500);
		 layui.form.render('select');
	} 
	function getSelectedTag(){
		//遍历 将某个置为选中状态
		$('#tag1 option').each(function(){
			 if($(this).attr('id')==<%=tag1%>){
				$(this).attr("selected",true);
			}
		});
		$('#tag2 option').each(function(){
			if($(this).attr('id')==<%=tag2%>){
				$(this).attr("selected",true);
			}
		});
		$('#tag3 option').each(function(){
			if($(this).attr('id')==<%=tag3%>){
				$(this).attr("selected",true);
			}
		});
		layui.form.render('select');
	}
	//获取默认的状态
	function getSelectedState(){
		//alert(1);
		var article_isTop =$("#article_isTop").val();
		if(article_isTop!=0){
			//alert(111111);
			$("#isT").attr("checked",true);
			layui.form.render();
		}
	}
	layui.use('form', function() {
		//就是这行代码  搞定了tag默认选中非要选择的
		 $.ajaxSettings.async = false; 
		//1.初始化form表单
		var form = layui.form;
		//2.初始化富文本编辑器
		// var ue = window.UE.getEditor('editor');
		var ue = UE.getEditor('editor', {autoHeightEnabled: false});
		ue.ready(function(){
			//alert($("#content").val());
			ue.setContent('<%=article_content%>');
		});
		//3.获得一级分类
		getFirstCategory();
		//补充之获得一级标签（最少选择一个，最多选择三个）
		getFirstTag();
		getSelectedTag();
		getSelectedCategory(); 
		getSelectedState();
		//4.获得二级分类
		form.on('select(myFirstSelect)', function(data2) {
			data2 = $("#first_category :selected").attr("id");
			$.post("${ctx}/getSecondCatgegory", {
				parent_id : data2
			}, function(result) {
				with (result) {
					$("#second_category").html("");
					for (var i = 0; i < data.length; i++) {
						var option = "<option id="+data[i].category_id+">"
								+ data[i].category_name + "</option>";
						$("#second_category").append(option);
						layui.form.render('select');
					}
				}
				
			}, "json");
			$.ajaxSetup({
				cache : false
			});
			layui.form.render('select');
		});

		//监听提交
		form.on('submit(formDemo)', function(data) {
			var tag_id1 = $("#tag1 :selected").attr("id");
			var tag_id2 = $("#tag2 :selected").attr("id");
			var tag_id3 = $("#tag3 :selected").attr("id");
			var category_id = $("#second_category :selected").attr("id");
			var article_title = $("#article_title").val();
			var article_desc = $("#article_desc").val();
			var article_content = UE.getEditor('editor').getContent();
			// var article_image = $("#article_image").attr("src");
			var article_image = "";

			var article_isTop_name = $('input[name="isTop"]:checked').val();
			var article_id = $('#tid').val();
			var tag_1 =$('#tag_1').val();
			var tag_2 = $('#tag_2').val();
			var tag_3 = $('#tag_3').val();
			if (article_isTop_name == '是') {
				var article_isTop = 1;
			} else {
				var article_isTop = 0;
			}
			
			if(tag_id2==tag_id3&&tag_id2!=0){
				layer.msg("不能多次选择同一个标签哦！", {
					icon : 2
			});
			return;
		}
			
			if (tag_id1 === tag_id2 || tag_id1 === tag_id3) {
					layer.msg("不能多次选择同一个标签哦！", {
					icon : 2
				});
				return;
			}
			// if (article_image == "") {
			// 	layer.msg("一定要上传封面图哦！", {
			// 		icon : 2
			// 	});
			// 	return;
			// }
			if(article_desc==""){
				layer.msg("博文简介不能为空哦！", {
					icon : 2
				});
				return;
			}
			// 1.检查是否提交了必填项
			$.post("${ctx}/editArticle",//后台地址
			{
				article_id: article_id,
				article_title : article_title,
				article_desc : article_desc,
				article_content : article_content,
				article_image : article_image,
				article_isTop : article_isTop,
				tag_id1 : tag_id1,
				tag_id2 : tag_id2,
				tag_id3 : tag_id3,
				category_id : category_id,
				tag_1:tag_1,
				tag_2:tag_2,
				tag_3:tag_3
			},//需要提交到后台的数据
			function(result) {
				if (result) {
					alert("修改成功");
					//添加成功
					layer.msg("修改成功", {
						icon : 1
					});
					//返回到上一个界面
					/* window.parent.location.reload(); */
					/* document.getElementById("myform").reset(); */
				} else {
					layer.msg("修改失败", {
						icon : 2
					});
				}
			},//回调函数
			"json");
		});
	});
	let UPLOAD_FILES;

	layui.use('upload', function() {
		var upload = layui.upload;
		//提示用户上传图片不可以太大了
		//执行实例
		var uploadInst = upload.render({
			elem : '#test1' //绑定元素
			,
			url : '${ctx}/upload' //上传接口
			,
			exts : 'jpg|png|jpeg' //可传输文件的后缀
			,
			accept : 'file' //video audio images
			,
			done : function(res) {
				//上传完毕回调
				if (res.code == 0) {
					var returnPath = res.data.returnPath;
					$("#article_image")
							.attr(
									"src",
									// "http://localhost:8080/LRt1/upload/"
									"http://192.168.201.134:8080/LRt1/upload/"//写死ip后期改
											+ returnPath);
					// $("#article_image").attr("style",
					// 		"display:block;width:135px;height:180px;");

				}
			},
			error : function() {
				//请求异常回调
				//比如生成一个“重新上传”的按钮
			}
		});
	});
</script>
<script type="text/javascript" src="${ctx}/js/umedit/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/js/umedit/ueditor.all.min.js"></script>
<script type="text/javascript"
	src="${ctx}/js/umedit/lang/zh-cn/zh-cn.js"></script>
</html>