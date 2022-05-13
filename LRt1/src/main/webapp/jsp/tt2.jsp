<%--
  Created by IntelliJ IDEA.
  User: 86139
  Date: 2022/4/20
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <style>
        /*#bg{ display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: black; z-index:1001; -moz-opacity: 0.2; opacity:.2; filter: alpha(opacity=70);}*/
        .loading{width:10px;height:10px;display: none; position: absolute; z-index:1002; }
        .progress {
            width: 600px;
            height: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            margin: 10px 0px;
            overflow: hidden;
        }
        /* 初始状态设置进度条宽度为0px */
        .progress > div {
            width: 0px;
            height: 100%;
            background-color: yellowgreen;
            transition: all .3s ease;
        }
    </style>
    <script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
    <script>
        function uploadFile(files) {
            $(".loading").show();
            //获取上传的文件
            // var uploadFile = $('#upload-file').get(0).file[0];
            if(files.length) {
                let file = files[0];
                let reader = new FileReader();
                // var formdata = new FormData();
                // alert("formData1: " + formdata);
                // formdata.append('fileInfo', uploadFile);
                // formdata.append('fileInfo', file);
                // alert("formData2: " + formdata);
                reader.onload = function () {
                    var array = this.result.replace(/[\n\r]/g, '')
                    // alert("array: " + array);

                    // alert(array);
                    // alert("试试能不能变格式："+"text="+array);
                    // 上传文件解析后直接开始纠错并显示修改后的txt
                    var post_msg = "text=" + array;
                    // alert("Post_msg:"+post_msg);
                    // alert("post_msg: " + post_msg);
                    $.ajax({

                        // url: '/uploadfileurl',
                        url: 'http://368672z389.oicp.vip/csc',
                        type: 'POST',
                        // dataType: 'json',
                        dataType: "text",
                        data: post_msg,
                        // processData: false,
                        // contentType: false,
                        // xhr: function () {
                        //     var xhr = new XMLHttpRequest();
                        //     //使用XMLHttpRequest.upload监听上传过程，注册progress事件，打印回调函数中的event事件
                        //     xhr.upload.addEventListener('progress', function (e) {
                        //         console.log(e);
                        //         //loaded代表上传了多少
                        //         //total代表总数为多少
                        //         var progressRate = (e.loaded / e.total) * 100 + '%';
                        //
                        //         //通过设置进度条的宽度达到效果
                        //         $('.progress > div').css('width', progressRate);
                        //     })
                        //
                        //     return xhr;
                        // },
                        success: function (data) {
                            $(".loading").hide();
                            data_try = JSON.parse(data);
                            // alert(data_try.correct_result);
                            // alert(data_try)
                            var arr = data_try.detailed_result;
                            var tt1 = data_try.correct_result;
                            // alert("arr: " + arr);
                            // alert("tt1:" + tt1);
                        }

                    })
                };
                reader.readAsText(file, "UTF-8");
            }
        }
    </script>
</head>
<body>
<input type="file" id="upload-file" onchange="uploadFile(this.files)" name="file">
<%--<div class="progress">--%>
<%--    <div></div>--%>
<%--</div>--%>
<%--<div id="bg"></div>--%>
<%--<div class="loading"><img src="../images/loading.gif"></div>--%>
<div class="loading"><img src="https://sucai.suoluomei.cn/sucai_zs/images/20200115093745-vava.gif"></div>
<%--<button onclick="uploadFile()">上传</button>--%>
</body>
</html>
