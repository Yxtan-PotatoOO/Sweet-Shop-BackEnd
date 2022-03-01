<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="aspx_Login" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登录</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Login-Content.css" />
</head>
<body>
    <form id="form1" runat="server">
    <!-- 店名 -->
    <div id="namebox">
        <label id="nameLabel">Sweet - Shop</label> 
    </div>
    <!-- 首页超链接 -->
    <div class="indexbox">
        <a href=""><i class="layui-icon layui-icon-home"></i>     主页</a>
    </div>
    <!-- 背景色 -->
    <div id="background"></div>
    <!-- 登录框 -->
    <div id="loginbox">
        <div id="box">    
            <div>
                <i class="layui-icon layui-icon-username"></i>&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="LoginText" runat="server" placeholder="请输入账户" Font-Size="Medium" CssClass="LoginText"></asp:TextBox>
                <hr class="layui-bg-blue" style="border: 0;height:2px;"/>
            </div>
            <div id="pwdbox">
                <i class="layui-icon layui-icon-password"></i>&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="PwdText" runat="server" placeholder="请输入账户密码" Font-Size="Medium" TextMode="Password" CssClass="PwdText"></asp:TextBox>
                <hr class="layui-bg-blue" id="hr" />
            </div>
            <div id="loginbar">
                <asp:Button ID="LoginButton" runat="server" Text="登 录" CssClass="layui-btn layui-bg-blue LoginButton" onclick="LoginButton_Click"/>
            </div>   
        </div>
    </div>
    <!-- 底部固定区域 -->
    <div id="footer">
        Copyright © 2019 Sweet-shop.com - by tyx
    </div>
    </form>
    <!-- 轮播 -->
    <div class="layui-carousel" id="showimages">
        <div carousel-item>
            <img src="../../images/sweet1.jpg">
            <img src="../../images/sweet2.jpg">
            <img src="../../images/sweet3.jpg">
            <img src="../../images/sweet4.jpg">
            <img src="../../images/sweet5.jpg">
          </div>
    </div> 

<script src="../../layui/layui.js"></script>
<script>
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#showimages'
            , width: '40%' //设置容器宽度
            , height: '40%'
        });
        //监听轮播切换事件
        carousel.on('change(showimages)', function (obj) { //test1来源于对应HTML容器的 lay-filter="test1" 属性值
            console.log(obj.index); //当前条目的索引
            console.log(obj.prevIndex); //上一个条目的索引
            console.log(obj.item); //当前条目的元素对象
        });
        var ins = carousel.render(options);

        //重置轮播
        ins.reload(options);
    });
</script>
</body>
</html>
