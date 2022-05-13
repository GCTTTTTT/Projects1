<%--
  Created by IntelliJ IDEA.
  User: 86139
  Date: 2022/3/23
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="base.jsp"%>
<html>
<head>
    <title>文档纠错</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 导入样式 -->
    <link rel="stylesheet" href="../css/up_downloadShow.css">
    <script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
    <script>
        //文档就绪函数
        $(function () {
            //鼠标指针移动时发生 mousemove 事件
            $(document).mousemove(function (e) {
                //获取鼠标坐标：
                var X = e.pageX;
                var Y = e.pageY;
                //获取鼠标坐标e.pageX e.pageY，给图片添加绝对位置 position:absolute  改变图片大小
                // $(".loading1").css({ "width": "10px", "height": "10px", "position": "absolute", "left": e.pageX, "top": e.pageY,"z-index": "1002","display": "none"});
                $(".loading1").css({ "width": "3px", "height": "3px", "position": "absolute", "left": e.pageX, "top": e.pageY,"z-index": "1002"});
            });
        });
    </script>
    <%--    纠错js--%>
<%--    <script type="text/javascript">--%>
<%--        // ajax--post请求--%>
<%--        $(function(){--%>
<%--            // ajax_try--%>
<%--            $("#submit1").click(function(){--%>

<%--                $("#table1id  tr:not(:first)").empty();--%>
<%--                // $("#tbody1").html()--%>
<%--                // $("#table1id").empty("");--%>

<%--                // var tb1 = document.getElementById("tbody1");--%>
<%--                // // var tba = document.getElementById("table1id");--%>
<%--                // for (var i = tb1.length-1;i>=0;i--){--%>
<%--                //     tb1.removeChild(tb1[i]);--%>
<%--                // }--%>
<%--                alert("这是传去处理的数据"+decodeURIComponent($("#uploadForm").serialize(),true));--%>
<%--                $.ajax({--%>
<%--                    type:"POST",--%>
<%--                    url:"http://368672z389.oicp.vip/csc",--%>
<%--                    // data:"action=jQueryAjax",--%>
<%--                    // data:{"text":"国际田联认正中国接力队奥运铜牌。恭喜中国接力队！"},--%>
<%--                    // data:$("#form01").serialize(),--%>
<%--                    // orgText=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！--%>
<%--                    // alert(message) {--%>
<%--                    //     decodeURIComponent($("#uploadForm").serialize(),true);--%>
<%--                    // },--%>
<%--                    data:decodeURIComponent($("#uploadForm").serialize(),true),--%>
<%--                    // data:"text=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！",--%>
<%--                    // contentType:"application/x-www-form-urlencoded; charset=GBK",--%>
<%--                    // contentType:"application/x-www-form-urlencoded; charset=GBK",--%>
<%--                    success:function (data) {--%>
<%--                        data_try=JSON.parse(data);--%>
<%--                        // alert(data_try.correct_result);--%>
<%--                        // alert(data_try)--%>
<%--                        var arr = data_try.detailed_result;--%>
<%--                        var tt1 = data_try.correct_result;--%>
<%--                        // String posttt1 = tt1;--%>
<%--                        alert(tt1);--%>
<%--                        //try--%>
<%--                        $.ajax({--%>
<%--                            // url:"http://localhost:8080/LRt1/UploadServlet",--%>
<%--                            url:"http://192.168.201.134:8080/LRt1/UploadServlet",//注意这里的ip地址可能会变化，现在先写死--%>


<%--// data:"action=jQueryAjax",--%>
<%--//                             data:posttt1,--%>
<%--                            data:String(text=tt1),--%>
<%--                            type:"POST",--%>
<%--                            success:function (data) {--%>
<%--// alert(" 服务器返回的数据是： " + data);--%>
<%--// var jsonObj = JSON.parse(data);--%>
<%--//                                 $("#msg").html(" 编号：" + data.id + " ,  姓名：" + data.name);--%>
<%--                                alert("success!");--%>
<%--                            },--%>
<%--                            dataType : "json"--%>
<%--                        });--%>


<%--                        // alert(arr);--%>

<%--                        var tbody = document.getElementById('tbody1');--%>
<%--                        while (tbody.length){--%>

<%--                            tbody.removeChild(tbody.parentNode);--%>
<%--                        }--%>
<%--                        for (var ar in arr){--%>
<%--                            // alert(arr[ar][1]+" "+arr[ar][2]);--%>
<%--                            var tr = document.createElement('tr');--%>
<%--                            tr.innerHTML="<tr><td>"+arr[ar][1]+"</td>" + "<td>"+arr[ar][2]+"</td></tr>";--%>
<%--                            tbody.appendChild(tr);--%>

<%--                        }--%>
<%--                        var arr_correct_split = data_try.correct_result_split;--%>
<%--                        var arr_original_split = data_try.original_text_split;--%>
<%--                        var str_res = "";--%>
<%--                        for (var i in arr_correct_split){--%>
<%--                            // alert("this is "+ i);--%>
<%--                            for (var j in arr_correct_split[i]){--%>
<%--                                // alert(arr_correct_split[i][j]);--%>
<%--                                if (arr_correct_split[i][j] == arr_original_split[i][j]){--%>
<%--                                    str_res+=arr_correct_split[i][j];--%>
<%--                                }--%>
<%--                                else {--%>
<%--                                    str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";--%>
<%--                                }--%>
<%--                            }--%>
<%--                        }--%>
<%--                        // alert(str_res);--%>
<%--                        $("#msg").html(str_res);--%>
<%--                        // $("#msg").html(data_try.correct_result);--%>
<%--                    },--%>
<%--                    dataType : "text"--%>
<%--                });--%>
<%--            });--%>
<%--        });--%>
<%--    </script>--%>
</head>

<body class="layui-layout-body">
<div class="loading1" style="display: none"><img src="https://sucai.suoluomei.cn/sucai_zs/images/20200115093745-vava.gif"></div>

<div class="layui-layout layui-layout-admin">
    <%--    nav_try--%>
    <div class="layui-header" style="background: rgb(19,29,47); opacity: 1">
        <div class="layui-logo">You Are Right</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
<%--            <li class="layui-nav-item"><a href="../jsp/uploadShow2_div.jsp">文本纠错</a></li>--%>
            <li class="layui-nav-item"><a href="../jsp/new_fir_page.jsp">文本纠错</a></li>
            <li class="layui-nav-item layui-this"><a href="../jsp/up_downloadShow.jsp">文档纠错</a></li>
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


<div class="out">
    <div class="header">
        <span>
            文档纠错
        </span>
        <!-- logo部分 -->
<%--        <div class="logo">--%>
<%--            You Are Right—汉语文本校对系统--%>
<%--        </div>--%>
<%--        <!-- 导航栏部分 nav -->--%>
<%--        <div class="nav">--%>
<%--            &lt;%&ndash;            <ul>&ndash;%&gt;--%>
<%--            &lt;%&ndash;                <li><a href="#">首页</a></li>&ndash;%&gt;--%>
<%--            &lt;%&ndash;                <li><a href="#">课程</a></li>&ndash;%&gt;--%>
<%--            &lt;%&ndash;                <li><a href="#">职业规划</a></li>&ndash;%&gt;--%>
<%--            &lt;%&ndash;            </ul>&ndash;%&gt;--%>
<%--            <a href="../jsp/uploadShow2_div.jsp">文本纠错</a>--%>
<%--            <a href="../jsp/up_downloadShow.jsp">文档纠错</a>--%>
<%--            <a href="../jsp/onlineEditing.jsp">在线编辑</a>--%>
<%--            <a href="../jsp/login.jsp">退出登录</a>--%>
<%--        </div>--%>
        </div>
    <div class="blank1"></div>
    <div class="blank_left"></div>

<%--    <div class="left">--%>
<%--        <div class="left_top">原文本</div>--%>
<%--        <div class="left_middle">--%>
<%--            <form id="uploadForm" class="">--%>
<%--                &lt;%&ndash;                <input type="file" id="file" onchange="handleFiles(this.files)">&ndash;%&gt;--%>
<%--                &lt;%&ndash;    <p id="pp"></p>&ndash;%&gt;--%>
<%--                &lt;%&ndash;    div不能用name属性？&ndash;%&gt;--%>
<%--                <textarea name="text" id="TextAreaOrg" wrap="hard" class="textArea"></textarea>--%>
<%--            </form>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;        <div class="left_bottom">&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <div class="file_div">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <input type="file" id="file" onchange="handleFiles(this.files)" name="file">上传文件&ndash;%&gt;--%>
<%--        &lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--        &lt;%&ndash;&lt;%&ndash;            <input type="file" id="file" onchange="handleFiles(this.files)">&ndash;%&gt;&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <div style="text-align: center;display:block;">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <button id="submit1" class="btn1">开始纠错</button>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        </div>&ndash;%&gt;--%>

<%--    </div>--%>


    <div class="right">
        <div class="right_top">纠错后文档</div>
<%--        <div id="msg" class="right_textArea" contenteditable="true"></div>--%>
        <div id="msg" class="right_textArea"></div>
        <%--<div id="div_textArea1" contenteditable="true" class="textArea">--%>
        <%--    这是一个<span style="background-color: yellow;color: red">div模拟textarea</span>的测试代码--%>
        <%--</div>--%>
<%--        修改前后字表格展示--%>
<%--        <div id="table_div">--%>
<%--            <table id="table1id" cellspacing="0" border="1">--%>
<%--                <thead>--%>
<%--                <tr style="background: cadetblue;height: 35px;width: 50px;">--%>
<%--                    <th style="height: 35px;width: 70px;">修改前</th>--%>
<%--                    <th style="height: 35px;width: 70px;">修改后</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody id="tbody1">--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--            &lt;%&ndash;    <div class="scroll-bar"></div>&ndash;%&gt;--%>
<%--        </div>--%>

<%--        按钮div--%>
        <div class="blank_middle">
            <%--        <div class="blank_middle_top"></div>--%>
<%--            <div class="left_bottom">--%>
                <div class="blank_middle_top"></div>
                <div class="blank_middle_left1"></div>
                <div class="file_div">
                    <input type="file" id="file" onchange="handleFiles(this.files)" name="file">上传文件
                </div>
                <%--            <input type="file" id="file" onchange="handleFiles(this.files)">--%>
                <%--            <div style="text-align: center;display:block;">--%>
                <%--            <div>--%>
                <%--                <button id="submit1" class="btn1">开始纠错</button>--%>
                <%--            </div>--%>
                <div class="blank_middle_left1"></div>
                <div class="reload_div">
                    <input type=button value=重置 onclick="location.reload()" id="reload_button">
                </div>
                <div class="blank_middle_left1"></div>
                <div class="download_txt">
                    <a href="/LRt1/DownloadServlet" id="download_link">下载文件</a>
                </div>
<%--            </div>--%>
        </div>

    </div>
</div>


<script>
    var inp=document.getElementById("inp");
    var ppp=document.getElementById("ppp");
    var objFile = document.getElementById("file");
    var pp = document.getElementById("pp");
    var textAreaOrg = document.getElementById("TextAreaOrg");
    var s = ''

    // function an() {
    //     var arr=inp.value.replace(/\r/g,'').split('\n');
    //     for(var i in arr) {
    //         ppp.innerHTML += arr[i] + '<br />'
    //     }
    // }


    function handleFiles(files) {

        // $("#table1id  tr:not(:first)").empty();
        if(files.length){
            $(".loading1").show();
            let file = files[0];
            let reader = new FileReader();
            console.log(file)
            reader.onload = function(){

                // pp.innerHTML = this.result;
                // alert(this.result);
                // var array=this.result;
                // var array=this.result.replace(/\r/g,'').split('\n');
                var array=this.result.replace(/[\n\r]/g,'')
                // alert(array);
                // alert("试试能不能变格式："+"text="+array);
                // 上传文件解析后直接开始纠错并显示修改后的txt
                var post_msg = "text="+array;
                // alert("Post_msg:"+post_msg);
                $.ajax({
                    type:"POST",
                    url:"http://368672z389.oicp.vip/csc",
                    // data:"action=jQueryAjax",
                    // data:{"text":"国际田联认正中国接力队奥运铜牌。恭喜中国接力队！"},
                    // data:$("#form01").serialize(),
                    // orgText=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！
                    // alert(message) {
                    //     decodeURIComponent($("#uploadForm").serialize(),true);
                    // },
                    // data:decodeURIComponent($("#uploadForm").serialize(),true),
                    data:post_msg,
                    // data:"text=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！",
                    // contentType:"application/x-www-form-urlencoded; charset=GBK",
                    // contentType:"application/x-www-form-urlencoded; charset=GBK",
                    success:function (data) {
                        data_try=JSON.parse(data);
                        // alert(data_try.correct_result);
                        // alert(data_try)
                        var arr = data_try.detailed_result;
                        var tt1 = data_try.correct_result;
                        // String posttt1 = tt1;
                        // alert(tt1);
                        //try
                        $.ajax({
                            // url:"http://localhost:8080/LRt1/UploadServlet",
                            url:"http://192.168.201.134:8080/LRt1/UploadServlet",//注意这里的ip地址可能会变化，现在先写死


// data:"action=jQueryAjax",
//                             data:posttt1,
                            data:String(text=tt1),
                            type:"POST",
                            success:function (data) {
                                // alert("文件写入成功！");
// alert(" 服务器返回的数据是： " + data);
// var jsonObj = JSON.parse(data);
//                                 $("#msg").html(" 编号：" + data.id + " ,  姓名：" + data.name);
//                                 alert("success!");
                            },

                            dataType : "json"
                        });


                        // alert(arr);

                        // var tbody = document.getElementById('tbody1');
                        // while (tbody.length){
                        //
                        //     tbody.removeChild(tbody.parentNode);
                        // }
                        // for (var ar in arr){
                        //     // alert(arr[ar][1]+" "+arr[ar][2]);
                        //     var tr = document.createElement('tr');
                        //     tr.innerHTML="<tr><td>"+arr[ar][1]+"</td>" + "<td>"+arr[ar][2]+"</td></tr>";
                        //     tbody.appendChild(tr);
                        //
                        // }
                        var arr_correct_split = data_try.correct_result_split;
                        var arr_original_split = data_try.original_text_split;
                        var str_res = "";
                        for (var i in arr_correct_split){
                            // alert("this is "+ i);
                            for (var j in arr_correct_split[i]){
                                // alert(arr_correct_split[i][j]);
                                if (arr_correct_split[i][j] == arr_original_split[i][j]){
                                    str_res+=arr_correct_split[i][j];
                                }
                                else {
                                    str_res+="<span style='background-color: yellow;color: red'>"+arr_correct_split[i][j]+"</span>";
                                }
                            }
                        }
                        // alert(str_res);
                        $(".loading1").hide();
                        $("#msg").html(str_res);
                        // $("#msg").html(data_try.correct_result);
                    },
                    error : function(e) {
                        alert("文件上传出错！");
                        // alert(e.responseText);
                    },
                    dataType : "text"
                });



                // textAreaOrg.innerHTML=array;

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

</body>
</html>
