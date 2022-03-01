<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="aspx_OrderManagement_OrderDetails" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/OrderDetails-Content.css" />   
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
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
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
                            <dd><a href="OList.aspx" id="checked">订单列表</a></dd>
                            <dd><a href="Return.aspx">退/换列表</a></dd>
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
                <a><cite>订单列表</cite></a>
                <a><cite>详情</cite></a>
            </div>
            <div id="displaybox">
                <div id="statusbar">
                    <asp:Repeater ID="Repeater3" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="当前订单状态：" Font-Size="Medium"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Ostate")%>' Font-Size="Medium"></asp:Label>
                            <br /><br />
                            <asp:Button ID="CancelButton" runat="server" Text="取消订单" CssClass="layui-btn layui-btn-primary" onclick="Cancel_Click" CommandArgument='<%# Eval("Ono")+","+Eval("Uno")%>'/>
                    </ItemTemplate>
                </asp:Repeater>
                </div>
                <div id="detailbox">
                    <div class="layui-tab layui-tab-brief">
                      <ul class="layui-tab-title">
                        <li class="layui-this">订单详情</li>
                        <li>收货与物流信息</li>
                      </ul>
                      <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <div id="oinfobox">
                                <asp:Repeater ID="Repeater2" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text="买家信息" Font-Size="Medium" ForeColor="#0000CC"></asp:Label>
                                        <br /><br />
                                        <asp:Label ID="Label6" runat="server" Text="用户号："></asp:Label>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Uno")%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label8" runat="server" Text="手机号："></asp:Label>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("ADphone")%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label10" runat="server" Text="所在地区："></asp:Label>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("ADcity")%>'></asp:Label>
                                        <br />
                                        <hr />
                                        <asp:Label ID="Label5" runat="server" Text="订单信息" Font-Size="Medium" ForeColor="#0000CC"></asp:Label>
                                        <br /><br />
                                        <asp:Label ID="Label12" runat="server" Text="订单编号："></asp:Label>
                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("Ono")%>'></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label14" runat="server" Text="付款时间："></asp:Label>
                                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("Ptime")%>'></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label16" runat="server" Text="支付方式："></asp:Label>
                                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("Payment")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <HeaderTemplate>
                                        <table class="table">
                                            <tr>
                                                <td height="30px" id="td1">商品信息</td>
                                                <td height="30px" id="td2">商品类别</td>
                                                <td height="30px">单价</td>
                                                <td height="30px">数量</td>
                                                <td height="30px" id="td3">商品总价</td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td height="70px" id="td1">
                                                <asp:Image ID="GimageImage" runat="server" ImageUrl='<%# Eval("Gimage1","~/aspx/GoodsManagement/imgUploads/{0}")%>' Width="60px" Height="60px" />
                                                &nbsp;&nbsp;&nbsp;<%# Eval("Gname")%>
                                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Uno") %>' />
                                            </td>
                                            <td height="70px" id="td2">
                                                <%# Eval("Gsort")%>
                                            </td>
                                            <td height="70px">
                                                <%# Eval("Gprice")%>
                                            </td>
                                            <td height="70px">
                                                <%# Eval("Number")%>
                                            </td>
                                            <td height="70px" id="td4">
                                                ￥<%# Eval("Totalmoney")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                            
                        </div>
                        <div class="layui-tab-item">
                            <div id="adinfobox">
                                <asp:Repeater ID="Repeater4" runat="server">
                                    <ItemTemplate>    
                                        <asp:Label ID="Label4" runat="server" Text="地址信息" Font-Size="Medium" ForeColor="#0000CC"></asp:Label>
                                        <br /><br />
                                        <asp:Label ID="Label6" runat="server" Text="收货人："></asp:Label>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("ADrecipient")%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label8" runat="server" Text="手机号："></asp:Label>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("ADphone")%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label10" runat="server" Text="所在地区：">
                                        </asp:Label><asp:Label ID="Label11" runat="server" Text='<%# Eval("ADcity")%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label18" runat="server" Text="详细地址：">
                                        </asp:Label><asp:Label ID="Label19" runat="server" Text='<%# Eval("ADdetail")%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label20" runat="server" Text="邮政编码：">
                                        </asp:Label><asp:Label ID="Label21" runat="server" Text='<%# Eval("ADpostcode")%>'></asp:Label>
                                        <br />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                      </div>
                      <asp:Button ID="BackButton" runat="server" Text="返回" CssClass="layui-btn layui-btn-sm BackButton" onclick="Back_Click" />
                      <asp:TextBox ID="OstateText" runat="server" Visible="False"></asp:TextBox>
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