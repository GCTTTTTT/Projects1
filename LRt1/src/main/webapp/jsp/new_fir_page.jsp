<%--
  Created by IntelliJ IDEA.
  User: 86139
  Date: 2022/4/20
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../css/new_fir_page_style.css">
    <title>Title</title>

    <style type="text/css">
        body {
            /*display: flex;*/
            width: 100%;
            height: 100%;
            min-height: 100vh;
            /*background: url(../images/background.png) no-repeat;*/
            /*backdrop-filter: blur(5px);*/
            background-size: cover;
            /*background-position: bottom center;*/
            /*filter:blur(10px);!*虚化值，越大越模糊*!*/
            /*-webkit-filter: blur(10px);*/
            /*-moz-filter: blur(10px);*/
            /*-o-filter: blur(10px);*/
            /*-ms-filter: blur(10px);*/
            /*filter: blur(10px);*/
        }

        #submit1{
            text-align: center;
        }

        /*.left_box{*/
        /*    width: 70%;*/
        /*    !*display: inline-block;*!*/
        /*}*/
        /*.right_box{*/
        /*    width: 30%;*/
        /*    !*display: inline-block;*!*/
        /*    background-color: red;*/
        /*}*/
        .each_td1{
            height: 50px;

            /*border-left :3px solid mediumpurple;*/
            border-left :3px solid mediumseagreen;

            /*border-left: 2px solid greenyellow;*/
            /*margin-top: 10px;*/
            border-top: 1px solid lightgrey;
            border-bottom: 1px solid lightgrey;
            text-align: center;
            background-color: white;
        }
        .each_td2{
            height: 50px;

            /*border-left :3px solid yellow;*/
            /*border-left: 2px solid greenyellow;*/
            /*margin-top: 10px;*/
            color: grey;
            font-size: 8px;


            text-align: center;
            border-top: 1px solid lightgrey;
            border-bottom: 1px solid lightgrey;
            background-color: white;
        }
        .each_td3{
            height: 50px;

            /*border-left :3px solid yellow;*/
            /*border-left: 2px solid greenyellow;*/
            /*margin-top: 10px;*/
            text-align: center;
            border-top: 1px solid lightgrey;
            border-bottom: 1px solid lightgrey;
            background-color: white;
        }
        .each_td4{
            height: 50px;

            /*border-left :3px solid yellow;*/
            /*border-left: 2px solid greenyellow;*/
            /*margin-top: 10px;*/
            text-align: center;
            border-top: 1px solid lightgrey;
            border-bottom: 1px solid lightgrey;
            background-color: white;
        }

        .top_box{
            width: 100%;
            /*height: 20%;*/
            height: 8%;
            /*height: 60px;*/
            background-color: white;
        }
        .left_box{
            /*display: flex;*/
            float: left;
            width: 70%;
            height: 100%;
            display: inline-block;
            background-color: white;
        }
        /*#editor{*/
        /*    !*float: left;*!*/
        /*    width: 100%;*/
        /*    height: 80%;*/
        /*    !*transform:translateY(-50%);*!*/
        /*    !*margin-top: 12.5%;*!*/
        /*}*/
        .editor_div{
            width: 87%;
            height: 100%;
            /*background-color: purple;*/
            display: inline-block;
        }
        .btn_div{
            float: left;
            width: 12%;
            height: 100%;
            background-color: aliceblue;
            display: inline-block;
            /*display:flex;*/
            /*justify-content:center;*/
            /*align-items:center;*/
        }
        .btns_box{
            width: 100%;
            height: 70%;
            /*background-color: black;*/
            /*display:flex;*/
            /*justify-content:center;*/
            /*align-items:center;*/
            /*vertical-align: center;*/
            /*text-align: center;*/
            /*margin: 0 auto;*/
            margin-top: 70%;
        }
        #table_div{
            width: 29%;
            height: 94%;
            display: inline-block;
            /*background-color: red;*/
            overflow-y:scroll;/*滚动*/
            position: relative;
            background-color: rgb(248,248,248);
        }
        #table1id{
            width: 100%;
            /*overflow-y: scroll;*/

        }
        .btn1{
            width: 100%;
            height: 15%;
            /*background-color: red;*/
            /*text-align: center;*/
            /*vertical-align: center;*/
            display:flex;
            justify-content:center;
            align-items:center;
            margin-top: 30%;

        }
        .file {
            height: 28px;
            width: 50%;
            position: relative;
            /*display: inline-block;*/
            /*background: #D0EEFF;*/
            /*background: #1E9FFF;*/
            background: #009688;
            /*color: white;*/
            /*border: 1px solid #99D3F5;*/
            border: 1px solid #009688;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: white;
            text-align: center;
            /*vertical-align:center;*/
            text-decoration: none;
            text-indent: 0;
            line-height: 28px;
            /*display:flex;*/
            /*justify-content:center;*/
            /*align-items:center;*/
            border-radius: 100px;
        }
        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }
        .file:hover {
            /*background: #AADFFD;*/
            /*border-color: #78C3F3;*/
            /*color: #004974;*/
            /*text-decoration: none;*/

            opacity: .8;
            filter: alpha(opacity = 80);
            color: #fff;
        }
        .layui-btn{
            /*width: 70%;*/
            width: 90px;
        }
        /*#submit3{*/
        /*    */
        /*}*/
        .loading{width:10px;height:10px;display: none; position: absolute; z-index:1002; }
        #edui1_iframeholder{
            height: 65%;
            /*overflow: scroll;*/
        }

        #img_right{
            height: 70%;
            width: 80%;
            /*text-align: center;*/

            /*position: absolute;*/
            /*top: 50%;*/
            /*left: 50%;*/
            /*margin-top: -25px; !* 高度的一半 *!*/
            /*margin-left: -25px; !* 宽度的一半 *!*/

            /*position: absolute;*/
            /*top: 0;*/
            /*left: 0;*/
            /*right: 0;*/
            /*bottom: 0;*/
            /*margin: auto;*/

            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);

        }
    </style>
    <script>
        //文档就绪函数
        $(function () {
            //鼠标指针移动时发生 mousemove 事件
            $(document).mousemove(function (e) {
                //获取鼠标坐标：
                var X = e.pageX;
                var Y = e.pageY;
                //获取鼠标坐标e.pageX e.pageY，给图片添加绝对位置 position:absolute  改变图片大小
                $(".loading").css({ "width": "3px", "height": "3px", "position": "absolute", "left": e.pageX, "top": e.pageY,"z-index": "1002","display": "none"});
                // $(".loading").css({ "width": "3px", "height": "3px", "position": "absolute", "left": e.pageX, "top": e.pageY,"z-index": "1002"});
            });
        });
    </script>

    <script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="${ctx}/js/umedit/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/js/umedit/ueditor.all.min.js"></script>
    <script type="text/javascript"
            src="${ctx}/js/umedit/lang/zh-cn/zh-cn.js"></script>
    <script>
        window.onload=function (){
        	// alert("window.onload");
        	// var form = layui.form;
        	// var ue = window.UE.getEditor('editor');
            var ue = UE.getEditor('editor', {autoHeightEnabled: false});
        }
    </script>


    <%--    纠错js--%>
    <script type="text/javascript">
        $(function(){
            // ajax_try
            $("#submit1").click(function(){
                // cnt = "1";
                // alert(cnt);


                $(".loading").show();
                // $("#table1id  tr:not(:first)").empty();
                $("#tbody1").html("");
                // $("#tbody1").html()
                // $("#table1id").empty("");

                // var tb1 = document.getElementById("tbody1");
                // // var tba = document.getElementById("table1id");
                // for (var i = tb1.length-1;i>=0;i--){
                //     tb1.removeChild(tb1[i]);
                // }
                //提取纯文本！！！！
                // var article_content_txt = UE.getEditor('editor').getContentTxt();
                var article_content_txt = UE.getEditor('editor').getContentTxt();
                var article_content = UE.getEditor('editor').getContent();
                // alert("article_content_txt:  "+article_content_txt);
                var article_json = "text="+article_content_txt;
                var ue = UE.getEditor('editor');

                //去除多余纠错后样式
                var article_content_new="";
                var flag1 = true;
                var flag2=true;
                // alert(article_content);
                // alert(article_content[4]);
                // alert(article_content[4+13]);
                // alert(article_content[17]);
                for(var i=0;i<article_content.length;i++){

                    // alert(i);
                    // alert(article_content[i]);
                    // alert(article_content[i+1]);
                    // alert(article_content[i+2]);
                    // alert(article_content[i+3]);

                    // var tmp=i+13;
                    // alert(article_content[tmp]);

                    if(article_content[i]==='<'&&article_content[i+13]==='b'&&article_content[i+20]==='b'&&article_content[i+27]==='4'){
                        // if(article_content[i]==='<'){
                        // alert(article_content[i+13]);
                        // alert(article_content[i+20]);
                        // alert(article_content[i+27]);
                        // alert("11111");
                        flag1=false;
                        flag2=false;
                        continue;
                    }
                    if(!flag1&&article_content[i]==='>'){
                        flag1=true;
                        article_content_new+=article_content[i+1];
                        // alert("2222");
                        continue;
                    }
                    if(!flag2&&article_content[i]==='>'&&article_content[i-1]==='n'&&article_content[i-2]==='a'&&article_content[i-5]==='/'&&article_content[i-8]==='>'&&article_content[i-11]==='d'){
                        flag2=true;
                        // alert("3333");
                        continue;
                    }
                    if (flag1&&flag2){
                        // alert("44");
                        article_content_new+=article_content[i];
                    }
                }

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
                        // alert("success");
                        data_try=JSON.parse(data);
                        // alert(data_try.correct_result);
                        // alert(data_try)
                        var arr = data_try.detailed_result;
                        var tt1 = data_try.correct_result;

                        // alert("tt1: "+tt1);
                        if (arr.length>0){
                            $("#img_right").hide();
                        }
                        else $("#img_right").show();

                        var str_res="";

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
                            tr.innerHTML="<tr><td class='each_td1'>"+arr[ar][1]+"</td>" + "<td class='each_td2'>"+"建议修改为"+"</td>"+ "<td class='each_td3'>"+arr[ar][2]+"</td><td class='each_td4'></td></tr>";
                            tbody.appendChild(tr);

                        }
                        var flag = true;
                        var cnt_correct = 0;
                        for (var i in article_content_new){//
                            if (article_content_new[i] === '<'){
                                flag = false;
                                str_res+=article_content_new[i];
                                continue;
                            }
                            else if(article_content_new[i] === '>'){
                                flag = true;
                                str_res+=article_content_new[i];
                                continue;
                            }
                            if (flag === true){//可以进行比较了
                                // str_res+=correct_result[cnt_correct];
                                if(article_content_new[i]===tt1[cnt_correct]){
                                    str_res+=article_content_new[i];
                                }
                                else{
                                    str_res+="<span style='border-bottom:4px double red;'>"+ article_content_new[i] +"</span>" ;
                                }

                                cnt_correct+=1;
                            }
                            else{//为框内的内容，直接加
                                str_res+=article_content_new[i];
                            }

                        }

                        // alert(str_res);
                        ue.ready(function() {

                            //设置编辑器的内容
                            // ue.setContent('测试加载动态内容');
                            ue.setContent(str_res);
                        });
                        $(".loading").hide();

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
                    error : function(e) {
                        alert("出错！");
                        // alert(e.responseText);
                        // alert()
                    },

                    dataType : "text"
                });

            });


//             $("#submit2").click(function(){
//                 $("#table1id  tr:not(:first)").empty();
//                 var ue = UE.getEditor('editor');
//                 // var article_content_txt = UE.getEditor('editor').getContentTxt();
//                 var article_content_txt = ue.getContentTxt();
//                 var article_content = ue.getContent();
//                 // var article_content_html = ue.getContentHtml();
//                 // alert("article_content_txt： "+article_content_txt);
//                 // alert("article_content： "+article_content);
//                 // for (var i in article_content){
//                 // 	alert(article_content[i]);
//                 // }
//                 // alert("article_content_html： "+article_content_html);
//                 // alert(article_content_txt);
//                 // var instead_text = article_content_txt+"   这是试试哈";
//                 // ue.ready(function() {
//                 // 	//设置编辑器的内容
//                 // 	// ue.setContent('测试加载动态内容');
//                 // 	ue.setContent(instead_text);
//                 // });


//
//                 // ajax请求
//                 $.ajax({
//                     type:"POST",
//                     // async:false,
//                     url:"http://368672z389.oicp.vip/csc",
//                     // data:"action=jQueryAjax",
//                     // data:{"text":"国际田联认正中国接力队奥运铜牌。恭喜中国接力队！"},
//                     // data:$("#form01").serialize(),
//                     // orgText=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！
//                     // data:decodeURIComponent($("#uploadForm").serialize(),true),
//                     // 传数据
//                     data:"text="+article_content_txt,
//                     // data:String(text=article_content_txt),
//
//                     // data:"text=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！",
//                     // contentType:"application/x-www-form-urlencoded; charset=GBK",
//                     // contentType:"application/x-www-form-urlencoded; charset=GBK",
//                     success:function (data) {
//                         alert("success");
//                         data_try=JSON.parse(data);
//                         // alert(data_try.correct_result);
//                         // alert(data_try)
//                         var arr = data_try.detailed_result;
//                         var tt1 = data_try.correct_result;
//                         // alert(tt1);
//                         // 有格式的文本进行一键替换test
// // article_content:编辑器内容
//
//                         var arr_correct_split = data_try.correct_result_split;
//                         var arr_original_split = data_try.original_text_split;
//                         var correct_result = data_try.correct_result;//正确结果
//                         var str_res = "";
//                         var flag = true;
//                         var cnt_correct = 0;
//                         //三个=？
//                         for (var i in article_content){
//                             if (article_content[i] === '<'){
//                                 flag = false;
//                                 str_res+=article_content[i];
//                                 continue;
//                             }
//                             else if(article_content[i] === '>'){
//                                 flag = true;
//                                 str_res+=article_content[i];
//                                 continue;
//                             }
//                             if (flag === true){//可以进行比较了
//                                 str_res+=correct_result[cnt_correct];
//                                 cnt_correct+=1;
//                             }
//                             else{//为框内的内容，直接加
//                                 str_res+=article_content[i];
//                             }
//
//                         }
//                         // alert("str_res: "+str_res);
//                         // alert(cnt_correct);
//                         // alert(correct_result.length);
//                         // for (var i in arr_correct_split){
//                         // 	// alert("this is "+ i)
//                         // 	for (var j in arr_correct_split[i]){
//                         // 		if ()
//                         // 		// alert(arr_correct_split[i][j]);
//                         // 		if (arr_correct_split[i][j] == arr_original_split[i][j]){
//                         // 			str_res+=arr_correct_split[i][j];
//                         // 		}
//                         // 		else {
//                         // 			str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";
//                         // 		}
//                         // 	}
//                         // }
//                         // alert(str_res);
//
//
//                         // ue.ready(function() {
//                         // 	//设置编辑器的内容
//                         // 	// ue.setContent('测试加载动态内容');
//                         // 	ue.setContent(tt1);
//                         // });
//                         ue.ready(function() {
//                             //设置编辑器的内容
//                             // ue.setContent('测试加载动态内容');
//                             ue.setContent(str_res);
//                         });
//                         // String posttt1 = tt1;
//                         // alert("tt1:  "+tt1);
//                         //try
//                         // 改文件（不用）======================
// // 					$.ajax({
// // 						// url:"http://localhost:8080/LRt1/UploadServlet",
// // 						url:"http://192.168.201.134:8080/LRt1/UploadServlet",//注意这里的ip地址可能会变化，现在先写死
// //
// //
// // // data:"action=jQueryAjax",
// // //                             data:posttt1,
// // 						data:String(text=tt1),
// // 						type:"POST",
// // 						success:function (data) {
// // // alert(" 服务器返回的数据是： " + data);
// // // var jsonObj = JSON.parse(data);
// // //                                 $("#msg").html(" 编号：" + data.id + " ,  姓名：" + data.name);
// // //                                 alert("success!");
// // 						},
// // 						dataType : "json"
// // 					});
//                         // ============================================
//                         // alert()
//                         // 		高亮标出（不用）========================================
//                         // 		var arr_correct_split = data_try.correct_result_split;
//                         // 		var arr_original_split = data_try.original_text_split;
//                         // 		var str_res = "";
//                         // 		for (var i in arr_correct_split){
//                         // 			// alert("this is "+ i);
//                         // 			for (var j in arr_correct_split[i]){
//                         // 				// alert(arr_correct_split[i][j]);
//                         // 				if (arr_correct_split[i][j] == arr_original_split[i][j]){
//                         // 					str_res+=arr_correct_split[i][j];
//                         // 				}
//                         // 				else {
//                         // 					str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";
//                         // 				}
//                         // 			}
//                         // 		}
//                         // 		alert(str_res);
//
//                         // alert(arr);
//                         // var tbody = document.getElementById('tbody1');
//                         // while (tbody.length){
//                         //
//                         // 	tbody.removeChild(tbody.parentNode);
//                         // }
//                         // for (var ar in arr){
//                         // 	// alert(arr[ar][1]+" "+arr[ar][2]);
//                         // 	var tr = document.createElement('tr');
//                         // 	tr.innerHTML="<tr><td>"+arr[ar][1]+"</td>" + "<td>"+arr[ar][2]+"</td></tr>";
//                         // 	tbody.appendChild(tr);
//                         //
//                         // }
//                         // 高亮标出（不用）========================================
//                         // var arr_correct_split = data_try.correct_result_split;
//                         // var arr_original_split = data_try.original_text_split;
//                         // var str_res = "";
//                         // for (var i in arr_correct_split){
//                         // 	// alert("this is "+ i);
//                         // 	for (var j in arr_correct_split[i]){
//                         // 		// alert(arr_correct_split[i][j]);
//                         // 		if (arr_correct_split[i][j] == arr_original_split[i][j]){
//                         // 			str_res+=arr_correct_split[i][j];
//                         // 		}
//                         // 		else {
//                         // 			str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";
//                         // 		}
//                         // 	}
//                         // }
//                         // // alert(str_res);
//                         // $("#msg").html(str_res);
//                         // // $("#msg").html(data_try.correct_result);
//                         // ========================================
//                     },
//                     dataType : "text"
//                 });
//                 // $("#table1id  tr:not(:first)").empty();
//                 // var article_content_txt = UE.getEditor('editor').getContentTxt();
//                 // var article_json = "text="+article_content_txt;
//                 // $.ajax({
//                 // 	type:"POST",
//                 // 	async:false,
//                 // 	url:"http://368672z389.oicp.vip/csc",
//                 // 	// data:"action=jQueryAjax",
//                 // 	// data:{"text":"国际田联认正中国接力队奥运铜牌。恭喜中国接力队！"},
//                 // 	// data:$("#form01").serialize(),
//                 // 	// orgText=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！
//                 // 	// data:decodeURIComponent($("#uploadForm").serialize(),true),
//                 // 	// 传数据
//                 // 	data:"text="+article_content_txt,
//                 // 	// contentType:"application/x-www-form-urlencoded; charset=GBK",
//                 // 	success:function (data) {
//                 // 		alert("success");
//                 // 		data_try=JSON.parse(data);
//                 // 		var arr = data_try.detailed_result;
//                 // 		var tt1 = data_try.correct_result;
//                 // 		var tbody = document.getElementById('tbody1');
//                 // 		while (tbody.length){
//                 // 			tbody.removeChild(tbody.parentNode);
//                 // 		}
//                 // 		for (var ar in arr){
//                 // 			// alert(arr[ar][1]+" "+arr[ar][2]);
//                 // 			var tr = document.createElement('tr');
//                 // 			tr.innerHTML="<tr><td>"+arr[ar][1]+"</td>" + "<td>"+arr[ar][2]+"</td></tr>";
//                 // 			tbody.appendChild(tr);
//                 //
//                 // 		}
//                 // 		// 高亮标出（不用）========================================
//                 // 		// var arr_correct_split = data_try.correct_result_split;
//                 // 		// var arr_original_split = data_try.original_text_split;
//                 // 		// var str_res = "";
//                 // 		// for (var i in arr_correct_split){
//                 // 		// 	// alert("this is "+ i);
//                 // 		// 	for (var j in arr_correct_split[i]){
//                 // 		// 		// alert(arr_correct_split[i][j]);
//                 // 		// 		if (arr_correct_split[i][j] == arr_original_split[i][j]){
//                 // 		// 			str_res+=arr_correct_split[i][j];
//                 // 		// 		}
//                 // 		// 		else {
//                 // 		// 			str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";
//                 // 		// 		}
//                 // 		// 	}
//                 // 		// }
//                 // 		// // alert(str_res);
//                 // 		// $("#msg").html(str_res);
//                 // 		// // $("#msg").html(data_try.correct_result);
//                 // 		// ========================================
//                 // 	},
//                 // 	dataType : "text"
//                 // });
//             });

            // 一键替换
            $("#submit2").click(function(){
                // $("#table1id  tr:not(:first)").empty();
                $(".loading").show();
                $("#img_right").show();

                $("#tbody1").html("");
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
                var article_content_new="";
                var flag1 = true;
                var flag2=true;
                // alert(article_content);
                // alert(article_content[4]);
                // alert(article_content[4+13]);
                // alert(article_content[17]);
                for(var i=0;i<article_content.length;i++){

                    // alert(i);
                    // alert(article_content[i]);
                    // alert(article_content[i+1]);
                    // alert(article_content[i+2]);
                    // alert(article_content[i+3]);

                    // var tmp=i+13;
                    // alert(article_content[tmp]);

                    if(article_content[i]==='<'&&article_content[i+13]==='b'&&article_content[i+20]==='b'&&article_content[i+27]==='4'){
                    // if(article_content[i]==='<'){
                        // alert(article_content[i+13]);
                        // alert(article_content[i+20]);
                        // alert(article_content[i+27]);
                        // alert("11111");
                        flag1=false;
                        flag2=false;
                        continue;
                    }
                    if(!flag1&&article_content[i]==='>'){
                        flag1=true;
                        article_content_new+=article_content[i+1];
                        // alert("2222");
                        continue;
                    }
                    if(!flag2&&article_content[i]==='>'&&article_content[i-1]==='n'&&article_content[i-2]==='a'&&article_content[i-5]==='/'&&article_content[i-8]==='>'&&article_content[i-11]==='d'){
                        flag2=true;
                        // alert("3333");
                        continue;
                    }
                    if (flag1&&flag2){
                        // alert("44");
                        article_content_new+=article_content[i];
                    }
                }
                // alert(article_content_new);
                // <span style='border-bottom:4px double red;'></span>
                // 4  7         17
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
                        // alert("success");
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
                        for (var i in article_content_new){
                            if (article_content_new[i] === '<'){
                                flag = false;
                                str_res+=article_content_new[i];
                                continue;
                            }
                            else if(article_content_new[i] === '>'){
                                flag = true;
                                str_res+=article_content_new[i];
                                continue;
                            }
                            if (flag === true){//可以进行比较了
                                str_res+=correct_result[cnt_correct];
                                cnt_correct+=1;
                            }
                            else{//为框内的内容，直接加
                                str_res+=article_content_new[i];
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
                        // alert(str_res);
                        $(".loading").hide();
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
                    error : function(e) {
                        alert("出错！");
                        // alert(e.responseText);
                        // alert()
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



        function handleFiles(files) {
            $(".loading").show();
            if(files.length){
                let file = files[0];
                let reader = new FileReader();
                console.log(file)
                reader.onload = function(){
                    alert("文件上传成功！");
                    // pp.innerHTML = this.result;
                    // var array=this.result;
                    // var array=this.result.replace(/\r/g,'').split('\n');
                    // var array=this.result.replace(/[\n\r]/g,'<br>')
                    // var array=this.result.replace(/[\n\r]/g,'');//去除换行
                    // var array=this.result.replace(/[\n\r]/g,'<br/>');
                    var array=this.result.replace(/[\n]/g,'<br/>');
                    // var array=this.result;

                    // txts=txts.replace(/[\n\r]/g,'<br>')
                    // var array=this.result.split('\r');
                    // alert(array);
                    // textAreaOrg.innerHTML=array;
                    $(".loading").hide();
                    var ue = UE.getEditor('editor');
//对编辑器的操作最好在编辑器ready之后再做
                    ue.ready(function() {
                        //设置编辑器的内容
                        ue.setContent(array);
                    });
                    // for(var l in array) {
                    //     // pp.innerHTML += array[l] + '<br />'
                    //     textAreaOrg.innerHTML+=array[l];
                    // }
                    // alert(textAreaOrg.innerHTML);
                };
                // reader.readAsText(file, "gb2312");
                reader.readAsText(file, "UTF-8");
            }
        }
    </script>
</head>
<body>
<div class="loading"><img src="https://sucai.suoluomei.cn/sucai_zs/images/20200115093745-vava.gif"></div>
<div class="top_box">
    <div class="layui-layout layui-layout-admin">
        <%--    nav_try--%>
        <div class="layui-header" style="background: rgb(19,29,47); opacity: 1">
            <div class="layui-logo">You Are Right</div>
            <!-- 头部区域（可配合layui已有的水平导航） -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layui-this"><a href="../jsp/new_fir_page.jsp">文本纠错</a></li>
                <li class="layui-nav-item"><a href="../jsp/new_sec_page.jsp">文档纠错</a></li>
                <li class="layui-nav-item"><a href="../jsp/onlineEditing.jsp">在线编辑</a></li>
                <li class="layui-nav-item"><a href="../jsp/login.jsp">退出登录</a></li>
                <%--				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>--%>
                <%--					<dl class="layui-nav-child">--%>
                <%--						<dd>--%>
                <%--							<a href="">邮件管理</a>--%>
                <%--						</dd>--%>
                <%--						<dd>--%>
                <%--							<a href="">消息管理</a>--%>
                <%--						</dd>--%>
                <%--						<dd>--%>
                <%--							<a href="">授权管理</a>--%>
                <%--						</dd>--%>
                <%--					</dl></li>--%>
            </ul>

            <%--			<ul class="layui-nav layui-layout-right">--%>
            <%--				<li class="layui-nav-item"><a href="javascript:;"> <img--%>
            <%--						src="https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=19ee1139ffdeb48fef64a98c9176514c/810a19d8bc3eb135d7ee3ce3aa1ea8d3fd1f44b9.jpg"--%>
            <%--						class="layui-nav-img"> <span id="uname"><%=name %></span>--%>
            <%--				</a>--%>
            <%--					<dl class="layui-nav-child">--%>
            <%--						<!--${ctx}/user/index.jsp  -->--%>
            <%--						<dd>--%>
            <%--							<a href="#" target="myframe">基本资料</a>--%>
            <%--						</dd>--%>
            <%--						<dd>--%>
            <%--							<a href="">安全设置</a>--%>
            <%--						</dd>--%>
            <%--					</dl></li>--%>
            <%--				<li class="layui-nav-item"><a href="login.jsp">退了</a></li>--%>
            <%--			</ul>--%>
            <script>
                //JavaScript代码区域
                layui.use('element', function() {
                    var element = layui.element;
                });
            </script>
        </div>
    </div>

</div>
<div class="left_box">
    <div class="btn_div">
        <div class="btns_box">
<%--            <div class="btn1">--%>
<%--                <div class="file">--%>
<%--                    &lt;%&ndash;                <button id="submit1" type="button" class="layui-btn layui-btn-radius layui-btn-normal" >上传文件</button>&ndash;%&gt;--%>
<%--                    <input type="file" id="file" onchange="handleFiles(this.files)"class="layui-btn-radius" name="file">上传文件--%>
<%--                </div>--%>
<%--            </div>--%>

            <div class="btn1">
                <button id="submit1" type="button" class="layui-btn layui-btn-radius" >开始纠错</button>
            </div>
            <div class="btn1">
                <button id="submit2" type="button" class="layui-btn layui-btn-radius" >一键替换</button>
            </div>
            <div class="btn1">
                <button id="submit3" type="button" onclick="location.reload()" class="layui-btn layui-btn-radius" >重置</button>
            </div>
        </div>


    </div>
    <div class="editor_div">
        <div id="editor" name="article_content">
        </div>
    </div>
<%--    <div class="btn_div"></div>--%>
</div>
<%--<div class="right_box"></div>--%>
<div id="table_div">
<%--    <img src="../images/xiezuocat_no_alert.svg" alt="" id="img_right">--%>
<%--    <img src="https://uranus-static.oss-cn-beijing.aliyuncs.com/xiezuocat/xiezuocat_no_alert.svg" alt="" id="img_right">--%>
<%--    <img src="../images/rightImg.jpg" alt="" id="img_right">--%>
    <img src="../images/rightImg1.jpg" alt="" id="img_right">
    <table id="table1id" cellspacing="0" border="0" style="border-collapse: separate;border-spacing: 0px 12px;" >
        <thead>
        <tr style="width: 100%;height: 60px">
            <th style="height: 35px;width: 10%"></th>
            <th style="height: 35px;width: 25%;"></th>
            <th style="height: 35px;width: 10%;"></th>
            <th style="height: 35px;width: 40%;"></th>
        </tr>
        </thead>
        <tbody id="tbody1">
        </tbody>
    </table>
    <%--    <div class="scroll-bar"></div>--%>
</div>

</body>
</html>
