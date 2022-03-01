﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Evaluation.aspx.cs" Inherits="aspx_OrderManagement_Evaluation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Evaluation-Content.css" />
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
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;"><i class="layui-icon layui-icon-cart-simple"></i> 订单管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="OList.aspx">订单列表</a></dd>
                            <dd><a href="Return.aspx">退/换列表</a></dd>
                            <dd><a href="Evaluation.aspx" id="checked">评价管理</a></dd>
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
                <a><cite>评价管理</cite></a>
            </div>
            <div id="querybox">
                <div class="querycondition">
                    <asp:Label ID="UnameLabel" runat="server" Text="用户名：" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="UnameText" runat="server" Height="26px" Width="155px"></asp:TextBox>
                </div>
                <div class="querycondition">
                    <asp:Label ID="GnameLabel" runat="server" Text="评价商品名：" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="GnameText" runat="server" Height="26px" Width="178px"></asp:TextBox>
                </div>
                <div class="querycondition">
                    <asp:Label ID="EtimeLabel" runat="server" Text="评价时间：" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="EtimeText1" runat="server" Height="26px" Width="165px"></asp:TextBox> - 
                    <asp:TextBox ID="EtimeText2" runat="server" Height="26px" Width="165px"></asp:TextBox>
                </div>
                <div id="querybuttonbox">
                    <asp:Button ID="QueryButton" runat="server" Text="查询" CssClass="layui-btn layui-btn-primary layui-bg-blue" onclick="Query_Click"/>
                    <asp:Button ID="ResetButton" runat="server" Text="&#8635; 重置" CssClass="layui-btn layui-btn-primary layui-bg-green" onclick="Reset_Click"/>
                </div>     
            </div>
            <div id="displaybox">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table class="table">
                            <tr>
                                <td height="30px">用户号</td>
                                <td height="30px">用户名</td>
                                <td height="30px">评价商品号</td>
                                <td height="30px">评价商品名</td>
                                <td height="30px">评价信息</td>
                                <td height="30px">评价时间</td>
                                <td height="30px">操作</td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td height="30px">
                                <%# Eval("Uno")%>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Uno") %>' />
                            </td>
                            <td height="30px">
                                <%# Eval("Uname")%>
                            </td>
                            <td height="30px">
                                <%# Eval("Gno")%>
                            </td>
                            <td height="30px">
                                <%# Eval("Gname")%>
                            </td>
                            <td height="30px">
                                <%# Eval("Eval")%>
                            </td>
                            <td height="30px">
                                <%# Eval("Etime")%>
                            </td>
                            <td height="30px">
                                <asp:Button ID="DelButton" runat="server" Text="删除" onclick="Delete_Click" BackColor="White" Font-Size="Medium" ForeColor="#FF3300" CommandArgument='<%# Eval("Uno") %>' OnClientClick="return confirm('你确定要删除吗?')" CssClass="DelButton" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <%--分页栏--%>
                <div id="pagingbox">
                    <div class="pagingtab">
                        <a><div>
                            <a class="color">共<asp:Label  runat="server" ID="Total"> </asp:Label>页</a>
                        </div></a>
                        <a><div>
                            <a class="color">第<asp:Label runat="server" ID="Now"> </asp:Label>页</a>
                        </div></a>
                        <a><div>
                            <a class="color"><asp:hyperlink id="First" runat="server" CssClass="color"> << 首页</asp:hyperlink></a>
                        </div></a>
                        <a><div>
                            <a class="color"><asp:hyperlink id="LnkPrev" runat="server" CssClass="color">上一页</asp:hyperlink></a>
                        </div></a>
                        <a><div>
                            <a class="color"><asp:hyperlink id="LnkNext" runat="server" CssClass="color">下一页</asp:hyperlink></a>
                        </div></a>
                        <a><div>
                            <a class="color"><asp:hyperlink id="End" runat="server" CssClass="color">尾页 >> </asp:hyperlink></a>
                        </div></a>
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
    layui.use(['element', 'laydate'], function () {
        var element = layui.element;
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#EtimeText1' //指定元素
        });
        laydate.render({
            elem: '#EtimeText2' //指定元素
        });
    });
</script>
</body>
</html>