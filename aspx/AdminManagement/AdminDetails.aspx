<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminDetails.aspx.cs" Inherits="aspx_AdminManagement_AdminDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/AdminDetails-Content.css" />
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
                    <li class="layui-nav-item">
                        <a href="../Home/Home.aspx"><i class="layui-icon layui-icon-home"></i> 首页</a>
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
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;"><i class="layui-icon layui-icon-set"></i> 权限设置</a>
                        <dl class="layui-nav-child">
                            <dd><a href="Admin.aspx" id="checked">管理员权限</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 内容主体 -->
        <div class="layui-body" id="content">
            <div class="layui-breadcrumb" lay-separator=">" id="breadcrumb">
                <a href="../Home/Home.aspx">首页</a>
                <a href="Admin.aspx">管理员权限</a>
                <a><cite>详情</cite></a>
            </div>
            <div id="displaybox">
                <asp:Label ID="Label10" runat="server" Text="基本信息" Font-Bold="True"  Font-Size="18px" Font-Names="宋体" ForeColor="#000066"></asp:Label>
                    <asp:Repeater ID="Repeater1" runat="server" >
                        <ItemTemplate>
                        <div class="layui-form showbox">
                            <div>
                                <asp:Label ID="Label6" runat="server" Text="当前头像：" Width="80px" Font-Size="15px"></asp:Label>
                                <asp:Image ID="Image2" runat="server" Height="80px" Width="80px" Font-Size="15px" ImageUrl='<%#Eval("Aportrait","~/aspx/AdminManagement/imgUploads/{0}") %>' />
                            </div> 
                            <div>
                                <asp:Label ID="Label11" runat="server" Text="用户号：" Width="80px" Font-Size="15px"></asp:Label>
                                <asp:Label ID="Label12" runat="server" Font-Size="15px"><%# Eval("Ano") %></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Label2" runat="server" Text="用户名：" Width="80px" Font-Size="15px"></asp:Label>
                                <asp:Label ID="Label7" runat="server" Font-Size="15px"><%# Eval("Aname")%></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Label13" runat="server" Text="密码：" Width="80px" Font-Size="15px"></asp:Label>
                                <asp:Label ID="Label14" runat="server" Font-Size="15px" Text="***"></asp:Label>
                            </div> 
                            <div>
                                <asp:Label ID="Label5" runat="server" Text="性别：" Width="80px" Font-Size="15px"></asp:Label>
                                <asp:Label ID="Label8" runat="server" Font-Size="15px"><%# Eval("Asex")%></asp:Label>
                            </div>                 
                            <div>
                                <asp:Label ID="Label1" runat="server" Text="手机号：" Width="80px" Font-Size="15px"></asp:Label>
                                <asp:Label ID="Label4" runat="server" Font-Size="15px"><%# Eval("Aphone")%></asp:Label>
                            </div> 

                            <div>
                                <asp:Label ID="Label3" runat="server" Text="所属分组：" Width="80px" Font-Size="15px"></asp:Label>
                                <asp:Label ID="Label9" runat="server" Font-Size="15px"><%# Eval("Agroup")%></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Label15" runat="server" Text="状态：" Width="80px" Font-Size="15px"></asp:Label>
                                <asp:Label ID="Label16" runat="server" Font-Size="15px"><%# Eval("Astate")%></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Label17" runat="server" Text="备注信息：" Width="80px" Font-Size="15px"></asp:Label>
                                <asp:Label ID="Label18" runat="server"  Font-Size="15px"><%# Eval("Ainfo")%></asp:Label>
                            </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    <div class="buttonbox"> 
                        <div>
                            <asp:Button ID="ModifyButton" runat="server" Text="修改信息" CssClass="layui-btn layui-btn-sm layui-bg-red ModifyButton" onclick="Modify_Click"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BackButton" runat="server" Text="返回" CssClass="layui-btn layui-btn-sm layui-bg-blue BackButton" onclick="Back_Click"/>
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
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>
