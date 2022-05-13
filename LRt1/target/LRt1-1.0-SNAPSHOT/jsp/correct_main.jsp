<%--
  Created by IntelliJ IDEA.
  User: 86139
  Date: 2022/3/21
  Time: 21:51
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
    <link rel="stylesheet" href="../css/correct_main.css">
    <script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
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
                    data:decodeURIComponent($("#form01").serialize(),true),
                    // data:"text=国际田联认正中国接力队奥运铜牌。恭喜中国接力队！",
                    // contentType:"application/x-www-form-urlencoded; charset=GBK",
                    contentType:"application/x-www-form-urlencoded; charset=GBK",
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

                        $("#msg").html(data_try.correct_result);
                    },
                    dataType : "text"
                });
            });
        });
    </script>

<%--    <!-- 导入animate.js -->--%>
<%--    <script src="../js/animate.js"></script>--%>

</head>
<body>
<%--        <form id="form1" action="http://368672z389.oicp.vip/csc" method="post" class="correct_main_form" accept-charset="UTF-8">--%>
<%--            <textarea name="text" class="textArea" ></textarea>--%>
<%--            <div class="post_button">--%>
<%--                <input type="submit" value="提交" id="orgin_text_submit">--%>
<%--                <input type="reset" value="重置" id="orgin_text_reset">--%>
<%--            </div>--%>
<%--        </form>--%>
    <div>
        <form id="form01" class="Fform">
            <%--        用户名：<input name="username" type="text" /><br/>--%>
            <%--        密码：<input name="password" type="password" /><br/>--%>
            <textarea name="text" class="textArea"></textarea>
        </form>
        <span style="text-align: center;display:block;">
            <button id="submit1" class="btn1">开始纠错</button>
        </span>

        <form class="Fform">
            <textarea  id="msg" class="textArea"></textarea>
        </form>
    </div>


<%--    <form id="form01" >--%>
<%--&lt;%&ndash;        用户名：<input name="username" type="text" /><br/>&ndash;%&gt;--%>
<%--&lt;%&ndash;        密码：<input name="password" type="password" /><br/>&ndash;%&gt;--%>
<%--        <textarea name="text" class="textArea"></textarea>--%>
<%--    </form>--%>
<%--    <button id="submit1" class="btn1">开始纠错</button>--%>
<%--    <form>--%>
<%--        <textarea  id="msg" class="textArea"></textarea>--%>
<%--    </form>--%>







</body>
</html>
