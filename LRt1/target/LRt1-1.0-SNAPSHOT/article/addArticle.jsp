<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加文章</title>
<style type="text/css">
#box {
	width: 1000px;
	/*width: 100%;*/
	margin-left: auto;
	margin-right: auto;
	background-image: url(../css/image/18.gif);
	/*background-image: url("../images/background.png") ;*/
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
		<form class="layui-form" action="" enctype="multipart/form-data"
			id="myform">
		<!-- 	<h3 style="text-align:center;margin-bottom:20px;text-shadow:1px 1px 2px red;">增加博文</h3> -->
			<div class="layui-form-item">
				<label class="layui-form-label">文章标题</label>
				<div class="layui-input-block" style="width: 420px;">
					<input type="text" name="title" required lay-verify="required"
						placeholder="请输入标题" autocomplete="off" class="layui-input"
						id="article_title">
<%--					<input type="text" name="title"--%>
<%--						   placeholder="请输入标题" autocomplete="off" class="layui-input"--%>
<%--						   id="article_title" value="1">--%>
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
					<input type="radio" name="isTop" value="是" title="是"> <input
						type="radio" name="isTop" value="否" title="否" checked>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<!-- 在这里放一个img标签 默认不显示 -->
<%--					去除封面图--%>
<%--					<button type="button" class="layui-btn" id="test1">--%>
<%--						<i class="layui-icon">&#xe67c;</i>上传封面图--%>
<%--					</button>--%>
<%--					<!--  style="display:none;" -->--%>
<%--					<div style="height: 20px; width: 100%;"></div>--%>
<%--					<img src="" id="article_image" class="article_image"--%>
<%--						style="display: none; margin-top: 20px;"></img>--%>
				</div>
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
<%--						<tr>--%>
<%--							<td>贤心</td>--%>
<%--							<td>贤心</td>--%>
<%--						</tr>--%>
<%--						<tr>--%>
<%--							<td>贤心</td>--%>
<%--							<td>贤心</td>--%>
<%--						</tr>--%>
						</tbody>
					</table>

				</div>
<%--				<div>--%>
<%--					<button class="layui-btn layui-btn-normal">按钮</button>--%>
<%--				</div>--%>

<%--			</div>--%>
<%--			<div class="layui-form-item">--%>
<%--				<div class="layui-input-block layui-col-md9">--%>
				<div class="layui-input-inline layui-col-md10">
					<div id="editor" name="article_content"
						style="width: 900px; height: 400px;"></div>
				</div>
			</div>
<%--			<div class="layui-row layui-form-item layui-col-md1">--%>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button id="submit2" type="button" class="layui-btn layui-btn-radius" style="margin-left: 30%;">一键替换</button>
					<%--			</div>--%>
					<%--			<div class="layui-row layui-form-item layui-col-md1">--%>
					<button id="submit1" type="button" class="layui-btn layui-btn-radius" style="margin-left: 12%;">开始纠错</button>
				</div>

			</div>

<%--			<div class="layui-input-block">--%>
<%--				<button class="layui-btn" type="button" lay-submit--%>
<%--						lay-filter="formDemo">立即提交</button>--%>
<%--				<button type="reset" class="layui-btn layui-btn-primary"--%>
<%--						style="margin-left: 12%;">重置</button>--%>
<%--			</div>--%>
<%--			<div class="layui-form-item">--%>
<%--				&lt;%&ndash;					layui表格try&ndash;%&gt;--%>
<%--				<table class="layui-table">--%>
<%--					<colgroup>--%>
<%--						<col width="100">--%>
<%--						<col width="100">--%>
<%--						<col>--%>
<%--					</colgroup>--%>
<%--					<thead>--%>
<%--					<tr>--%>
<%--						<th>修改前</th>--%>
<%--						<th>修改后</th>--%>
<%--					</tr>--%>
<%--					</thead>--%>
<%--					<tbody>--%>
<%--					<tr>--%>
<%--						<td>贤心</td>--%>
<%--						<td>2016-11-29</td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<td>许闲心</td>--%>
<%--						<td>2016-11-28</td>--%>
<%--					</tr>--%>
<%--					</tbody>--%>
<%--				</table>--%>
<%--			</div>--%>
			<div class="layui-form-item">
				<label class="layui-form-label">标签</label>
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
						id="article_desc"></textarea>
				</div>
			</div>
			<div class="layui-form-item" style="margin-top: 50px;">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-radius" type="button" lay-submit
						lay-filter="formDemo">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-radius layui-btn-primary"
						style="margin-left: 12%;">重置</button>
				</div>
<%--				==============================纠错按钮========================--%>
<%--				<div>--%>
<%--					<button id="submit1" type="button" class="btn1">开始纠错</button>--%>
<%--				</div>--%>
<%--				&lt;%&ndash;==============================纠错表格========================&ndash;%&gt;--%>
<%--				<div id="table_div">--%>
<%--					<table id="table1id" cellspacing="0" border="1">--%>
<%--						<thead>--%>
<%--						<tr style="background: cadetblue;height: 35px;width: 50px;">--%>
<%--							<th style="height: 35px;width: 70px;">修改前</th>--%>
<%--							<th style="height: 35px;width: 70px;">修改后</th>--%>
<%--						</tr>--%>
<%--						</thead>--%>
<%--						<tbody id="tbody1">--%>
<%--						</tbody>--%>
<%--					</table>--%>
<%--					&lt;%&ndash;    <div class="scroll-bar"></div>&ndash;%&gt;--%>

<%--				</div>--%>
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
			// var article_content_html = ue.getContentHtml();
			// alert("article_content_txt： "+article_content_txt);
			// alert("article_content： "+article_content);
			// for (var i in article_content){
			// 	alert(article_content[i]);
			// }
			// alert("article_content_html： "+article_content_html);
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
					// alert(tt1);
					// 有格式的文本进行一键替换test
// article_content:编辑器内容

							var arr_correct_split = data_try.correct_result_split;
							var arr_original_split = data_try.original_text_split;
							var correct_result = data_try.correct_result;//正确结果
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
							// alert(cnt_correct);
							// alert(correct_result.length);
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

	// ==============================================
	function getFirstCategory() {
		// alert("1-进入了getFirstCategory的方法");
		$.post("${ctx}/getFirstCategory", {}, function(result) {
			with (result) {
				for (var i = 0; i < data.length; i++) {
					var option = "<option id="+data[i].category_id+">"
							+ data[i].category_name + "</option>";
					$("#first_category").append(option);
					layui.form.render('select');
				}
			}

		}, "json");
		$.ajaxSetup({
			cache : false
		});
	}
	function getFirstTag() {
		// alert("function getFirstTag() {被调用了");
		$.post("${ctx}/getFirstTag", {}, function(result) {
			with (result) {
				for (var i = 0; i < data.length; i++) {
					var option = "<option id="+data[i].tag_id+">"
							+ data[i].tag_name + "</option>";
					$("#tag1").append(option);
					$("#tag2").append(option);
					$("#tag3").append(option);
					//??????
					layui.form.render('select');
				}
			}

		}, "json");
		$.ajaxSetup({
			cache : false
		});
	}
	// http://localhost:8080/MyBlog/upload/4cb78291ed21ac6a77e29d67eaf4b84.png
	layui.use('form', function() {
		// alert(cnt);
		// alert("layui.use('form', function() {被调用了");
		//1.初始化form表单
		var form = layui.form;
		//2.初始化富文本编辑器
		// var ue = window.UE.getEditor('editor');
		var ue = UE.getEditor('editor', {autoHeightEnabled: false});
		// alert("0".equals("0"));
		// if (cnt.equals("0")){
		// 	alert(yes);
// 设置内容
		// var s = "试试哈";
		// ue.ready(function() {
		// 	//设置编辑器的内容
		//
		// 	// ue.setContent("试试行不行<span style='color:yellow'>我是黄的</span>");
		// 	ue.setContent(s);
		// });

			// var ue = window.UE.getEditor('editor');
		// }

		//3.获得一级分类
		getFirstCategory();
		//补充之获得一级标签（最少选择一个，最多选择三个）
		getFirstTag();

		//4.获得二级分类
		form.on('select(myFirstSelect)', function(data2) {
			// alert("form.on('select(myFirstSelect)', function(data2) {被调用了");
			var category_id = $("#first_category :selected").attr("id");
			$.post("${ctx}/getSecondCatgegory", {
				parent_id : category_id
			}, function(result) {
				with (result) {
					$("#second_category").html("");
					for (var i = 0; i < data.length; i++) {
						//alert("2-测试进入了吗")
						var option = "<option id="+data[i].category_id+">"
								+ data[i].category_name + "</option>";
						$("#second_category").append(option);
						//????
						layui.form.render('select');
					}
				}

			}, "json");
			$.ajaxSetup({
				cache : false
			//	修改了
			});

			layui.form.render('select');
		});

		//监听提交
		form.on('submit(formDemo)', function(data) {
			// alert("form.on被调用了");
			var tag_id1 = $("#tag1 :selected").attr("id");
			var tag_id2 = $("#tag2 :selected").attr("id");
			var tag_id3 = $("#tag3 :selected").attr("id");
			var category_id = $("#second_category :selected").attr("id");
			var article_title = $("#article_title").val();
			var article_desc = $("#article_desc").val();
			var article_content = UE.getEditor('editor').getContent();

			// alert(article_content);
			//提取纯文本！！！！
			var article_content_txt = UE.getEditor('editor').getContentTxt();
			// alert(article_content_txt);

			// var article_image = $("#article_image").attr("src");
			var article_image = "";
			var article_isTop_name = $('input[name="isTop"]:checked').val();
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
			$.post("${ctx}/addArticle",//后台地址
			{
				article_title : article_title,
				article_desc : article_desc,
				article_content : article_content,
				article_image : article_image,//改为非必要
				article_isTop : article_isTop,
				tag_id1 : tag_id1,
				tag_id2 : tag_id2,
				tag_id3 : tag_id3,
				category_id : category_id
			},//需要提交到后台的数据
			function(result) {
				if (result) {
					//添加成功
					alert("添加成功");
					layer.msg("添加成功", {
						icon : 1
					});
					document.getElementById("myform").reset();
				} else {
					layer.msg("添加失败", {
						icon : 2
					});
				}
			},//回调函数
			"json");
		});
	});
	let UPLOAD_FILES;

	layui.use('upload', function() {
		// alert("layui.use被调用了");
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
					//alert(returnPath);
					/* $("#article_image").attr("src", "../upload/" + returnPath); */
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