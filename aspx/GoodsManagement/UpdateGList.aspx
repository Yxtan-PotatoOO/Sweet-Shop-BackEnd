<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateGList.aspx.cs" Inherits="aspx_GoodsManagement_UpdateGList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/UpdateGList-Content.css" />   
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
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;"><i class="layui-icon layui-icon-component"></i> 商品管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="Putaway.aspx">发布商品</a></dd>
                            <dd><a href="GList.aspx"id="checked">商品列表</a></dd>
                            <dd><a href="Template.aspx">运费模板</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;"><i class="layui-icon layui-icon-cart-simple"></i> 订单管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="../OrderManagement/OList.aspx" >订单列表</a></dd>
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
                <a href="GList.aspx">商品列表</a>
                <a><cite>修改商品信息</cite></a>
            </div>
            <div id="displaybox">
                <asp:Label ID="Label1" runat="server" Text="修改商品信息" Font-Bold="True" Font-Size="Medium" Font-Names="宋体" ForeColor="#000066"></asp:Label>
                    <div class="layui-form showbox">
                        <div>
                            <asp:Label ID="Label2" runat="server" Text="Label" Width="100px">商品号：</asp:Label>
                            <asp:Label ID="GnoLabel" runat="server" Font-Size="15px"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label8" runat="server" Text="Label" Width="100px">商品名：</asp:Label>
                            <asp:TextBox ID="GnameText" runat="server" Height="20px"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="Label6" runat="server" Text="Label" Width="100px">商品类别：</asp:Label>
                            <asp:TextBox ID="GsortText" runat="server" Height="20px"></asp:TextBox> 
                        </div>
                        <div>
                            <asp:Label ID="Label9" runat="server" Text="Label" Width="100px">单价：</asp:Label>
                            <asp:TextBox ID="GpriceText" runat="server" Height="20px"></asp:TextBox> 
                        </div>    
                        <div>
                            <asp:Label ID="Label3" runat="server" Text="Label" Width="100px">售后信息：</asp:Label>
                            <asp:TextBox ID="GafterinfoText" runat="server" Height="20px" Width="400px"></asp:TextBox> 
                        </div>
                        <div>
                            <asp:Label ID="Label7" runat="server" Text="Label" Width="100px">库存计数方式：</asp:Label>
                            <asp:TextBox ID="GcountmodeText" runat="server" Height="20px"></asp:TextBox> 
                        </div>
                        <div>
                            <asp:Label ID="Label11" runat="server" Text="Label" Width="100px">上架时间：</asp:Label>
                            <asp:TextBox ID="GshelftimeText" runat="server" Height="20px"></asp:TextBox> 
                        </div>
                        <div>
                            <asp:Label ID="Label5" runat="server" Text="Label" Width="100px">商品详情：</asp:Label>
                            <asp:TextBox ID="GdetailText" runat="server" Height="150px" Width="400px" 
                                TextMode="MultiLine"></asp:TextBox>                    
                        </div>
                    </div>
                    <div id="uploadbox">
                        <asp:Label ID="Label10" runat="server" Text="Label" Width="100px">上传商品图片</asp:Label>
                        <hr width="500px" />
                        <br />
                        请选择图片1：
                        <input type="file" runat="server" id="FileUpload1"/>
                        <asp:Button runat="server" ID="UploadButton1" OnClick="UpLoad1_Click" Text="上传" CssClass="layui-btn layui-btn-sm layui-bg-blue" Width="80px" />
                        <br />
                        <br />
                        请选择图片2：
                        <input type="file" runat="server" id="FileUpload2"/>
                        <asp:Button runat="server" ID="UploadButton2" OnClick="UpLoad2_Click" Text="上传" CssClass="layui-btn layui-btn-sm layui-bg-blue" Width="80px"/>
                        <br />
                        <br />
                        请选择图片3：
                        <input type="file" runat="server" id="FileUpload3"/>
                        <asp:Button runat="server" ID="UploadButton3" OnClick="UpLoad3_Click" Text="上传" CssClass="layui-btn layui-btn-sm layui-bg-blue" Width="80px"/>
                        <br />       
                        <br />
                        <br />
                        <asp:Label ID="Label13" runat="server" Text="Label">图片预览</asp:Label>
                        <hr width="500px"/>           
                        <asp:Image ID="ShowImage1" runat="server" Height="190px" Width="190px" ImageUrl="~/images/无图.png" />
                        <asp:Image ID="ShowImage2" runat="server" Height="190px" Width="190px" ImageUrl="~/images/无图.png" />
                        <asp:Image ID="ShowImage3" runat="server" Height="190px" Width="190px" ImageUrl="~/images/无图.png" />
                    </div>
                    <div class="buttonbox">
                        <hr id="hr" />
                        <div>
                            <asp:Button ID="SaveButton" runat="server" Text="保存并返回" CssClass="layui-btn layui-btn-sm layui-bg-red" onclick="Save_Click" CommandArgument='<%# Eval("Gno") %>'/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="GList.aspx"><button type="button" class="layui-btn layui-btn-sm CancelButton">取消</button></a>
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