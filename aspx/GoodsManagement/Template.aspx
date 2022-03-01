<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Template.aspx.cs" Inherits="aspx_GoodsManagement_Template" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Template-Content.css" />   
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
                            <dd><a href="GList.aspx">商品列表</a></dd>
                            <dd><a href="Template.aspx" id="checked">运费模板</a></dd>
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
                <a><cite>运费模板</cite></a>
            </div>
            <div id="displaybox">
                <a href="NewTem.aspx">
                    <button type="button" class="layui-btn layui-btn-primary layui-bg-blue">
                    <i class="layui-icon">&#xe608;</i> 新增运费模板
                    </button>
                </a>
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>  
                        <table class="table">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="tr">
                            <td colspan="7">
                            &nbsp;&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label><%# Eval("Tname")%></td>
                            <td colspan="1" style="text-align: right;">
                                <asp:Button ID="ModifyButton" runat="server" Text="修改" onclick="Modify_Click" BackColor="White" Font-Size="14px" ForeColor="#3366FF" CommandArgument='<%# Eval("Tno") %>' CssClass="ModifyButton" />
                                &nbsp;|&nbsp;
                                <asp:Button ID="DeleteButton" runat="server" Text="删除" onclick="Delete_Click" BackColor="White" Font-Size="14px" ForeColor="#FF3300" CommandArgument='<%# Eval("Tno") %>' OnClientClick="return confirm('你确定要删除吗?')" CssClass="DeleteButton" />
                                &nbsp;&nbsp;&nbsp; 
                            </td>                   
                        </tr>
                        <tr>
                            <td colspan="1" height="25px">运送方式</td>
                            <td colspan="1" height="25px">运送到</td>
                            <td colspan="1" height="25px">是否包邮</td>
                            <td colspan="1" height="25px">计价方式</td>
                            <td colspan="1" height="25px">首重(kg)</td>
                            <td colspan="1" height="25px">运费(元)</td>
                            <td colspan="1" height="25px">续重(kg)</td>
                            <td colspan="1" height="25px">运费(元)</td>
                        </tr>
                        <tr>
                            <td colspan="1" height="25px">
                                <%# Eval("Tsend")%>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Tsend") %>' />
                            </td>
                            <td colspan="1" height="25px">
                                <%# Eval("Taddress")%>
                            </td>
                            <td colspan="1" height="25px">
                                <%# Eval("Texemption")%>
                            </td>
                            <td colspan="1" height="25px">
                                <%# Eval("Tvalue")%>
                            </td>
                            <td colspan="1" height="25px">
                                <%# Eval("Tweight1")%>
                            </td>
                            <td colspan="1" height="25px">
                                <%# Eval("Tfare1")%>
                            </td>
                            <td colspan="1" height="25px">
                                <%# Eval("Tweight2")%>
                            </td>
                            <td colspan="1" height="25px">
                                <%# Eval("Tfare2")%>
                            </td>
                        </tr>
                        <tr class="tr">
                            <td colspan="8" height="25px" id="td"><asp:Label ID="Label2" runat="server"></asp:Label></td> 
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
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
</body>
</html>