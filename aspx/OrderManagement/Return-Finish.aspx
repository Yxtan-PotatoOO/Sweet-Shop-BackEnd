<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Return-Finish.aspx.cs" Inherits="aspx_OrderManagement_Return" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Return-Navigation.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Return-Content.css" />  
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
                            <dd><a href="Return.aspx" id="checked">退/换列表</a></dd>
                            <dd><a href="Evaluation.aspx">评价管理</a></dd>
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
                    <a><cite>退/换列表</cite></a>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="Return.aspx">待退货</a></li>
                    <li><a href="Return-Sending.aspx">处理中</a></li>
                    <li><a href="Return-Finish.aspx" id="menuchecked">已退货</a></li>
                </ul>
            </div>
            <%--查询框--%>
            <div id="querybox">
                <div class="querycondition">
                    <asp:Label ID="Label1" runat="server" Text="订单号：" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="OnoText" runat="server" Height="23px" Width="165px"></asp:TextBox>
                </div>
                <div class="querycondition">
                    <asp:Label ID="Label6" runat="server" Text="下单时间：" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="PtimeText1" runat="server" Height="23px" Width="165px"></asp:TextBox> - 
                    <asp:TextBox ID="PtimeText2" runat="server" Height="23px" Width="165px"></asp:TextBox>
                </div>
                <div id="querybuttonbox">
                    <asp:Button ID="QueryButton" runat="server" Text="查询" CssClass="layui-btn layui-btn-primary layui-bg-blue" onclick="Query_Click"/>
                    <asp:Button ID="ResetButton" runat="server" Text="&#8635; 重置" CssClass="layui-btn layui-btn-primary layui-bg-green" onclick="Reset_Click"/>
                </div>
            </div>
            <%--表格--%>
            <div id="displaybox">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table class="table">
                            <tr>
                                <td height="30px" id="td1">商品信息</td>
                                <td height="30px">单价</td>
                                <td height="30px">数量</td>
                                <td height="30px" id="td2">买家信息</td>
                                <td height="30px">实收款</td>
                                <td height="30px">操作</td>
                            </tr>
                            <tr>
                                <td colspan="6" height="15px" id="td3"></td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr id="tr">
                            <td colspan="6" height="30px">
                            &nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="订单编号："></asp:Label><asp:Label ID="Label1" runat="server"></asp:Label><%# Eval("Ono")%>                  
                            &nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Text="创建时间："></asp:Label><asp:Label ID="Label8" runat="server"></asp:Label><%# Eval("Ptime")%>
                            </td> 
                        </tr>
                        <tr>
                            <td id="td1" height="80px">
                                <asp:Image ID="GimageImage" runat="server" ImageUrl='<%# Eval("Gimage1","~/aspx/GoodsManagement/imgUploads/{0}")%>' Width="60px" Height="60px"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# Eval("Gname")%>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Gname") %>' />
                            </td>
                            <td height="80px">
                                <%# Eval("Gprice")%>
                            </td>
                            <td height="80px">
                                <%# Eval("Number")%>
                            </td>
                            <td id="td2" height="80px">
                                <%# Eval("ADrecipient")%><br/><%# Eval("ADphone")%><br/><%# Eval("Uno")%>
                            </td>
                            <td height="80px">
                                ￥<%# Eval("Totalmoney")%>
                            </td>
                            <td height="80px">
                                <asp:Button ID="DetailButton" runat="server" Text="详情" BackColor="White" Font-Size="Small" ForeColor="Blue" CommandArgument='<%# Eval("Ono")+","+Eval("Uno")%>' onclick="Detail_Click" CssClass="DetailButton" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" height="15px" id="td3"></td> 
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
            elem: '#PtimeText1' //指定元素
        });
        laydate.render({
            elem: '#PtimeText2' //指定元素
        });
    });
</script>
</body>
</html>