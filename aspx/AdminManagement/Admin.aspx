<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="aspx_Setting" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Admin-Content.css" />
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
                <a><cite>管理员权限</cite></a>
            </div>
           <div id="querybox">
                <div class="querycondition">
                    <asp:Label ID="AnameLabel1" runat="server" Text="用户号：" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="AnameText" runat="server" Height="26px" Width="155px"></asp:TextBox>
                </div>
                <div class="querycondition">
                    <asp:Label ID="AphoneLabel" runat="server" Text="手机号：" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="AphoneText" runat="server" Height="26px" Width="155px"></asp:TextBox>
                </div>
                <div class="querycondition">
                    <asp:Label ID="AgroupLabel" runat="server" Text="所属分组：" Font-Size="Medium"></asp:Label>
                    <asp:DropDownList ID="AgroupDropDownList" runat="server" Height="30px" Width="155px">
                    </asp:DropDownList>
                </div>
                <div class="querycondition">
                    <asp:Label ID="AstateLabel" runat="server" Text="状态：" Font-Size="Medium"></asp:Label>
                    <asp:DropDownList ID="AstateDropDownList" runat="server" Height="30px" Width="155px"></asp:DropDownList>
                </div> 
                <div id="querybuttonbox">
                    <asp:Button ID="QueryButton" runat="server" Text="查询" CssClass="layui-btn layui-btn-primary layui-bg-blue" onclick="Query_Click"/>
                    <asp:Button ID="ResetButton" runat="server" Text="&#8635; 重置" CssClass="layui-btn layui-btn-primary layui-bg-green" onclick="Reset_Click"/>
                </div>      
            </div>

            <div id="newbox">
                <a href="NewAdmin.aspx">
                    <button type="button" class="layui-btn layui-btn-primary layui-bg-red" id="newbutton">
                        <i class="layui-icon">&#xe608;</i>新增管理员
                    </button>
                </a>
            </div>

            <div id="displaybox">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table id="demo" class="table">
                            <tr>
                                <td height="30px">用户号</td>
                                <td height="30px">用户名</td>
                                <td height="30px">手机号</td>
                                <td height="30px">所属分组</td>
                                <td height="30px">状态</td>
                                <td height="30px">备注</td>
                                <td height="30px">操作</td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td height="30px">
                                <%# Eval("Ano") %>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Ano") %>' />
                            </td>
                            <td height="30px">
                                <%# Eval("Aname")%>
                            </td>
                            <td height="30px">
                                <%# Eval("Aphone")%>
                            </td>
                            <td height="30px">
                                <%# Eval("Agroup")%>
                            </td>
                            <td height="30px">
                                <%# Eval("Astate")%>
                            </td>
                            <td height="30px">
                                <%# Eval("Ainfo")%>
                            </td>
                            <td height="30px">
                                <asp:Button ID="DelButton" runat="server" Text="删除" onclick="Delete_Click" BackColor="White" Font-Size="Medium" ForeColor="#FF3300" CommandArgument='<%# Eval("Ano") %>' OnClientClick="return confirm('你确定要删除吗?')" CssClass="DelButton" />
                                &nbsp;
                                <asp:Button ID="DetailButton" runat="server" Text="详情" onclick="Detail_Click" BackColor="White" Font-Size="Medium" ForeColor="#3366CC" CommandArgument='<%# Eval("Ano") %>' CssClass="DetailButton" />
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
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>
