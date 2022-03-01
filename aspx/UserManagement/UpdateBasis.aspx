<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateBasis.aspx.cs" Inherits="aspx_AdminManagement_UpdateAdmin" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/UpdateBasis-Content.css" />
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
                            <dd><a href="Basis.aspx" id="checked">用户基本信息</a></dd>
                            <dd><a href="Address.aspx">用户收货信息</a></dd>
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
        <<div class="layui-body" id="content">
            <div class="layui-breadcrumb" lay-separator=">" id="breadcrumb">
                <a href="../Home/Home.aspx">首页</a>
                <a><cite>用户基本信息</cite></a>
                <a><cite>修改用户信息</cite></a>
            </div>
            <div id="displaybox">
                <asp:Label ID="Label1" runat="server" Text="修改用户信息" Font-Bold="True" Font-Size="Medium" Font-Names="宋体" ForeColor="#000066"></asp:Label>
                    <div style="" class="layui-form showbox1">
                        <div>
                            <asp:Label ID="Label2" runat="server" Text="Label" Width="70px">用户号：</asp:Label>
                            <asp:Label ID="UnoLabel" runat="server" Font-Size="15px"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="UnameLabel1" runat="server" Text="Label" Width="70px">用户名：</asp:Label>
                            <asp:TextBox ID="UnameText" runat="server" Height="20px"></asp:TextBox>
                        </div>
                        <div id="radio1">
                            <asp:Label ID="UsexLabel" runat="server" Text="Label" Width="70px">性别：</asp:Label>
                            <input id="Radio3" type="radio" name="sex" title="男" value="男" runat="server" checked/>&nbsp;
                            <input id="Radio4" type="radio" name="sex" title="女" value="女" runat="server"/>
                        </div>
                        <div>
                            <asp:Label ID="UphoneLabel" runat="server" Text="Label" Width="70px">手机号：</asp:Label>
                            <asp:TextBox ID="UphoneText" runat="server" Height="20px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="layui-form showbox2">
                        <div id="radio2">
                            <asp:Label ID="UstateLabel" runat="server" Text="Label" Width="70px">状态：</asp:Label>
                            <input id="Radio1" type="radio" name="state" title="启用" value="启用" runat="server" checked/>&nbsp;&nbsp;
                            <input id="Radio2" type="radio" name="state" title="禁用" value="禁用" runat="server"/>
                        </div>
                    </div>
                    <div id="uploadbox">
                        <asp:Label ID="Label10" runat="server" Text="Label" Width="70px">上传头像</asp:Label>
                        <hr width="500px" />
                        <br />
                        <input type="file" runat="server" id="FileUpload" />
                        <asp:Button runat="server" ID="UploadButton" OnClick="UpLoad_Click" Text="上传" CssClass="layui-btn layui-btn-sm layui-bg-blue"/>
                        <br />
                        <br />
                        <asp:Image ID="ShowImage" runat="server" Height="300px" Width="300px" ImageUrl="~/images/无图.png" />
                    </div>
                    <div class="buttonbox">
                        <hr id="hr" />
                        <div>
                            <asp:Button ID="SaveButton" runat="server" Text="保存并返回" CssClass="layui-btn layui-btn-sm layui-bg-red SaveButton" style="border-radius:2px; width: 86px;" onclick="Save_Click" CommandArgument='<%# Eval("Ano") %>'/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="Basis.aspx"><button type="button" class="layui-btn layui-btn-sm CancelButton">取消</button></a>
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
    layui.use(['element', 'form', 'jquery'], function () {
        var element = layui.element;
        var form = layui.form;
        var $ = layui.$;   
    });
</script>
</body>
</html>