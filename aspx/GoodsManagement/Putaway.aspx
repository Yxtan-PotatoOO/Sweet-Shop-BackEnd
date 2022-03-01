<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Putaway.aspx.cs" Inherits="aspx_GoodsManagement_Putaway" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Putaway-Content.css" />   
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
                            <dd><a href="Putaway.aspx" id="checked">发布商品</a></dd>
                            <dd><a href="GList.aspx">商品列表</a></dd>
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
                <a><cite>发布商品</cite></a>
            </div>
            <div id="displaybox">
                <asp:Label ID="Label1" runat="server" Text="1. 商品基本信息" Font-Bold="True" Font-Size="15px" Font-Names="宋体" ForeColor="#000066"></asp:Label>

                <div class="showbox1">
                    <div>
                        <asp:Label ID="Label4" runat="server" Text="Label" Width="70px">商品号：</asp:Label>
                        <asp:TextBox ID="GnoText" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label2" runat="server" Text="Label">商品名称：</asp:Label>
                        <asp:TextBox ID="GnameText" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label13" runat="server" Text="Label">商品类别：</asp:Label>
                        <asp:TextBox ID="GsortText" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label9" runat="server" Text="Label">商品价格：</asp:Label>
                        <asp:TextBox ID="GpriceText" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label3" runat="server" Text="Label">商品口号：</asp:Label>
                        <asp:TextBox ID="GsloganText" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label12" runat="server" Text="Label">商品详情：</asp:Label>
                        <asp:TextBox ID="GdetailText" runat="server" Height="95px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                    </div>                       
                </div>
                <asp:Label ID="Label7" runat="server" Text="2. 售后信息设置" Font-Bold="True" Font-Size="15px" Font-Names="宋体" ForeColor="#000066"></asp:Label>
                <div class="showbox2">
                    <div class="layui-form" id="otherbox1">
                        <asp:Label ID="Label15" runat="server" Text="Label">售后服务：</asp:Label>
                        <input type="radio" name="after" lay-skin="primary" checked title="若存在质量问题或与描述不符，本店将主动提供退换货服务。" value="若存在质量问题或与描述不符，本店将主动提供退换货服务。" />
                        <input type="radio" name="after" title="无" value="无" /> 
                    </div>
                    
                </div>

                <asp:Label ID="Label8" runat="server" Text="3. 商品其他信息" Font-Bold="True" Font-Size="15px" Font-Names="宋体" ForeColor="#000066"></asp:Label>
                <div class="showbox3">                 
                    <div class="layui-form" id="otherbox2">
                        <div>
                            <asp:Label ID="Label20" runat="server" Text="Label">库存计数：</asp:Label>
                            <input type="radio" name="count" title="买家拍下减库存" checked value="买家拍下减库存" />     
                        </div>
                        <div id="timebox">
                            <asp:Label ID="Label6" runat="server" Text="Label">上架时间：</asp:Label>
                            <input type="radio" name="time" title="立即上架" checked value="立即上架" />
                            <input type="radio" name="time" title="放入仓库" value="放入仓库" /> 
                        </div>
                    </div>
                    <hr id="hr" />
                    <div class="buttonbox"> 
                        <div>
                            <asp:Button ID="NextButton" runat="server" Text="下一步" CssClass="layui-btn layui-btn-sm layui-bg-red NextButton" onclick="Next_Click" CommandArgument='<%# Eval("Gno") %>'/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="Putaway.aspx"><button type="button" class="layui-btn layui-btn-sm CancelButton">清空</button></a>
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
    layui.use(['element', 'form', 'upload'], function () {
        var element = layui.element;
        var form = layui.form;
        var upload = layui.upload;
     });
</script>
</body>
</html>