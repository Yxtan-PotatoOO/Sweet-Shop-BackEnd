<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Safety.aspx.cs" Inherits="aspx_Safety" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Safety-Content.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="layui-layout layui-layout-admin">
        <!-- 头部 -->
        <div class="layui-header">
            <!-- 左上角LOGO -->
            <div id="logo">
                后台管理系统
            </div>

            <!-- 顶栏 -->
            <ul class="layui-nav" id="top">
                <li class="layui-nav-item"><a href=""><i class="layui-icon layui-icon-home"></i> 返回主页</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <asp:Image ID="AportraitImage" runat="server" ImageUrl="" CssClass="layui-nav-img" />                  
                        <asp:Label ID="AnameLabel" runat="server" Text="Label"></asp:Label>
                    </a>
                    <dl class="layui-nav-child">
                      <dd><a href="../AdminManagement/Basic.aspx">基本资料</a></dd>
                      <dd><a href="../AdminManagement/Safety.aspx">安全设置</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="../Home/Login.aspx">退出</a></li>
            </ul>
        </div>

        <!-- 左侧导航区域 -->
        <div class="layui-side" id="left">
            <div class="layui-side-scroll">                 
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="../Home/Home.aspx" id="checked"><i class="layui-icon layui-icon-home"></i> 首页</a>
                    </li>
                    <li class="layui-nav-item"> 
                        <a href="javascript:;"><i class="layui-icon layui-icon-user"></i> 用户管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="../UserManagement/Basis.aspx">用户基本信息</a></dd>
                            <dd><a href="../UserManagement/Address.aspx">用户收货信息</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;"><i class="layui-icon layui-icon-component"></i> 商品管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="../GoodsManagement/Putaway.aspx">发布商品</a></dd>
                            <dd><a href="../GoodsManagement/GList.aspx">商品列表</a></dd>
                            <dd><a href="../GoodsManagement/Template.aspx">运费模板</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;"><i class="layui-icon layui-icon-cart-simple"></i> 订单管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="../OrderManagement/OList.aspx">订单列表</a></dd>
                            <dd><a href="../OrderManagement/Return.aspx">退/换列表</a></dd>
                            <dd><a href="../OrderManagement/Evaluation.aspx">评价管理</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;"><i class="layui-icon layui-icon-set"></i> 权限设置</a>
                        <dl class="layui-nav-child">
                            <dd><a href="Admin.aspx">管理员权限</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 内容主体 -->
        <div class="layui-body" id="content">
            <div class="layui-breadcrumb" lay-separator=">" id="breadcrumb">
                <a href="../Home/Home.aspx">首页</a>
                <a><cite>安全设置</cite></a>
            </div>
            <div id="displaybox">
                <asp:Label ID="Label10" runat="server" Text="安全设置" Font-Bold="True"  Font-Size="18px" Font-Names="宋体" ForeColor="#000066"></asp:Label>
                <div class="layui-form showbox">                    
                    <div>
                        <asp:Label ID="AnameLabel1" runat="server" Text="用户名：" Width="70px"></asp:Label>
                        <asp:TextBox ID="AnameText" runat="server" Height="20px"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="AsexLabel" runat="server" Text="性别：" Width="70px"></asp:Label>
                        <input type="radio" name="sex" value="男" title="男" checked>
                        <input type="radio" name="sex" value="女" title="女">
                    </div>
                    <div>
                        <asp:Label ID="ApasswdLabel" runat="server" Text="修改密码：" Width="70px"></asp:Label>
                        <asp:TextBox ID="ApasswdText" runat="server" Height="20px" TextMode="Password"></asp:TextBox>
                    </div>                    
                    <div>
                        <asp:Label ID="AphoneLabel" runat="server" Text="手机号：" Width="70px"></asp:Label>
                        <asp:TextBox ID="AphoneText" runat="server" Height="20px"></asp:TextBox>
                    </div> 
                    <div id="uploadbox">
                        <asp:Label ID="Label3" runat="server" Text="Label" Width="100px">上传头像</asp:Label>
                        <hr width="500px" />
                        <br />
                        <input type="file" runat="server" id="FileUpload"/>
                        <asp:Button runat="server" ID="UploadButton" OnClick="UpLoad_Click" Text="上传" CssClass="layui-btn layui-btn-sm layui-bg-blue" Width="80px" />
                        <br />       
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label13" runat="server" Text="Label">图片预览</asp:Label>
                        <hr width="500px"/>           
                        <asp:Image ID="ShowImage" runat="server" Height="190px" Width="190px" ImageUrl="~/images/无图.png" />
                    </div> 

                    <div class="buttonbox"> 
                        <div>
                            <asp:Button ID="SaveButton" runat="server" Text="保存并返回" CssClass="layui-btn layui-btn-sm layui-bg-blue SaveButton" onclick="Save_Click"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="Basic.aspx"><button type="button" class="layui-btn layui-btn-sm CancelButton">取消</button></a>
                        </div>
                    </div>

                </div>                  
            </div>
        </div>


        <!-- 底部固定区域 -->
        <div class="layui-footer">
          Copyright © 2019 Sweet-shop.com - by tyx
        </div>
    </div>
    </form>

<script src="../../layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'form', 'jquery'], function () {
        var element = layui.element;
        var form = layui.form;
        var $ = layui.$;
    });
</script>
</body>
</html>
