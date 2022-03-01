<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddressDetails.aspx.cs" Inherits="aspx_UserManagement_AddressDetails" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/AddressDetails-Content.css" />
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
                    <li class="layui-nav-item layui-nav-itemed"> 
                        <a href="javascript:;"><i class="layui-icon layui-icon-user"></i> 用户管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="Basis.aspx">用户基本信息</a></dd>
                            <dd><a href="Address.aspx" id="checked">用户收货信息</a></dd>
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
                            <dd><a href="../AdminManagement/Admin.aspx">管理员权限</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 内容主体 -->
        <div class="layui-body" id="content">
            <div class="layui-breadcrumb" lay-separator=">" id="breadcrumb">
                <a href="../Home/Home.aspx">首页</a>
                <a href="Address.aspx">用户收货信息</a>
                <a><cite>详情</cite></a>
            </div>
            <div id="displaybox">
                <asp:Label ID="Label10" runat="server" Text="收货信息" Font-Bold="True"  Font-Size="18px" Font-Names="宋体" ForeColor="#000066"></asp:Label>
                <div id="showbox">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
                            <table class="table">
                                <tr>
                                    <td height="30px">用户号</td>
                                    <td height="30px">用户名</td>
                                    <td height="30px">邮政编码</td>
                                    <td height="30px">收货人</td>
                                    <td height="30px">收货人电话</td>
                                    <td height="30px" id="td">详细地址</td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td height="30px">
                                    <%# Eval("Uno") %>
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Uno") %>' />
                                </td>
                                <td height="30px">
                                    <%# Eval("Uname")%>
                                </td>
                                <td height="30px">
                                    <%# Eval("ADpostcode")%>
                                </td>
                                <td height="30px">
                                    <%# Eval("ADrecipient")%>
                                </td>
                                <td height="30px">
                                    <%# Eval("ADphone")%>
                                </td>
                                <td height="30px" id="td">
                                    <%# Eval("ADcity")%>&nbsp;&nbsp;&nbsp;<%# Eval("ADdetail")%>
                                </td>   
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div id="buttonbox"> 
                    <div id="buttonbar">
                        <%--<asp:Button ID="Button1" runat="server" Text="修改信息" CssClass="layui-btn layui-btn-sm layui-bg-red" style="border-radius:2px; width: 86px;" onclick="Button1_Click"/>--%>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="BackButton" runat="server" Text="返回" CssClass="layui-btn layui-btn-sm layui-bg-blue BackButton" onclick="Back_Click"/>
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
    layui.use(['element', 'form', 'upload'], function () {
        var element = layui.element;
        var form = layui.form;
        var upload = layui.upload;
    });
</script>
</body>
</html>