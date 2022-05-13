<%--
  Created by IntelliJ IDEA.
  User: 86139
  Date: 2022/3/23
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 导入样式 -->
    <link rel="stylesheet" href="../css/uploadShow.css">
    <script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<%--    纠错js--%>
    <script type="text/javascript">
        // ajax--post请求
        $(function(){
            // $("#submit").click(function(){
            //     // post请求
            //     alert($("#form01").serialize());
            //     // $.post("http://368672z389.oicp.vip/csc",$("#form01").serialize(),function (data) {
            //     //     // $("#msg").html(data);
            //     //     alert(data)
            //     // },"text");
            //     $.post("http://368672z389.oicp.vip/csc","text=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！",function (data) {
            //         // $("#msg").html(data);
            //         alert(data)
            //     },"text");
            //
            // });

            // ajax_try
            $("#submit1").click(function(){
                // $.ajaxSetup({
                //     contentType: "application/x-www-form-urlencoded; charset=utf-8"
                // });
                // alert(decodeURIComponent($("#form01").serialize(),true))
                $.ajax({
                    type:"POST",
                    url:"http://368672z389.oicp.vip/csc",
                    // data:"action=jQueryAjax",
                    // data:{"text":"国际田联认正中国接力队奥运铜牌。恭喜中国接力队！"},
                    // data:$("#form01").serialize(),
                    // orgText=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！
                    data:decodeURIComponent($("#uploadForm").serialize(),true),
                    // data:"text=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！",
                    // contentType:"application/x-www-form-urlencoded; charset=GBK",
                    // contentType:"application/x-www-form-urlencoded; charset=GBK",
                    success:function (data) {
                        // alert("服务器返回的数据是：" + data);
                        // var jsonObj = JSON.parse(data);

                        // data=decodeURIComponent(data)

                        // alert(data);
                        // this.contentType="charset=GBK";
                        // data=encodeURIComponent(data);
                        // alert(data);
                        // data=decodeURIComponent(data);
                        // alert(data);
                        data_try=JSON.parse(data);
                        // alert(data_try.correct_result);
                        // alert(data_try)
                        var arr = data_try.detailed_result;
                        var tbody = document.getElementById('tbody1');
                        for (var ar in arr){
                            // alert(arr[ar][1]+" "+arr[ar][2]);
                            var tr = document.createElement('tr');
                            tr.innerHTML="<td>"+arr[ar][1]+"</td>" + "<td>"+arr[ar][2]+"</td>";
                            tbody.appendChild(tr);

                        }

                        $("#msg").html(data_try.correct_result);
                    },
                    dataType : "text"
                });
            });
        });
    </script>
<%--    <script type="text/javascript" src="../js/jquery-1.7.2.js"></script>--%>

<%--    <script type="text/javascript">--%>
<%--        // function show()--%>
<%--        // {--%>
<%--        //     const reader = new FileReader();--%>
<%--        //     // const f = document.getElementById("filePicker").files[0];--%>
<%--        //     // reader.readAsText(f,"UTF-8");--%>
<%--        //     reader.onload = function (e) {--%>
<%--        //         // 读取文件内容--%>
<%--        //         const fileString = e.target.result--%>
<%--        //         alert(fileString);--%>
<%--        //         // 接下来可对文件内容进行处理--%>
<%--        //         // const myData = JSON.parse(fileString);--%>
<%--        //         // alert(myData) // 打印读取到的内容--%>
<%--        //     }--%>
<%--        //--%>
<%--        // }--%>
<%--        function getFiles(files){--%>
<%--            const textInner = document.getElementById("textInner"); // 获取一个标签，把读取的内容插进去--%>
<%--            if (files.length) {--%>
<%--                const file = files[0];--%>
<%--                const reader = new FileReader(); // new一个FileReader实例--%>
<%--                if (/text+/.test(file.type)) { // 判断文件类型，是不是text类型--%>
<%--                    reader.readAsText(file);--%>
<%--                    reader.onload = function () {--%>
<%--                        textInner.innerText = this.result--%>
<%--                    }--%>
<%--                } else if (/image+/.test(file.type)) { // 判断文件是不是imgage类型--%>
<%--                    reader.readAsDataURL(file);--%>
<%--                    reader.onload = function () {--%>
<%--                        textInner.innerHTML = '<img src="' + this.result + '"/>'--%>
<%--                    }--%>
<%--                } else { // 其它类型--%>
<%--                    reader.readAsText(file);--%>
<%--                    reader.onload = function () {--%>
<%--                        // this === reader 非箭头函数，谁调用this指向谁--%>
<%--                        alert(this.result) // 文件内容--%>
<%--                    }--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>

</head>
<body>

<div>
    <form id="uploadForm" class="">
    <input type="file" id="file" onchange="handleFiles(this.files)">
<%--    <p id="pp"></p>--%>
    <textarea name="text" id="TextAreaOrg" wrap="hard" class="textArea"></textarea>
    </form>
    <span style="text-align: center;display:block;">
            <button id="submit1" class="btn1">开始纠错</button>
    </span>
    <form class="Fform">
        <textarea  id="msg" class="textArea"></textarea>
    </form>
</div>
<div>
    <table>
        <thead>
        <tr style="background: lightgray;height: 35px;">
            <th>修改前</th>
            <th>修改后</th>
        </tr>
        </thead>
        <tbody id="tbody1">

        </tbody>
    </table>
</div>

<%--<div>--%>
<%--    <textarea id="inp" wrap="hard" class="textArea"></textarea>--%>
<%--    <button onclick="an(this)">按一下</button>--%>
<%--    <p id="ppp"></p>--%>
<%--</div>--%>
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
        if(files.length){
            let file = files[0];
            let reader = new FileReader();
            console.log(file)
            reader.onload = function(){
                // pp.innerHTML = this.result;
                var array=this.result.replace(/\r/g,'').split('\n');
                // alert(array);
                for(var l in array) {
                    // pp.innerHTML += array[l] + '<br />'
                    textAreaOrg.innerHTML+=array[l];
                }
                // alert(textAreaOrg.innerHTML);
            };
            // reader.readAsText(file, "gb2312");
            reader.readAsText(file, "UTF-8");
        }
    }
</script>

</body>
</html>
