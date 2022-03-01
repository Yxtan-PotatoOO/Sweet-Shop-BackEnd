<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateTem.aspx.cs" Inherits="aspx_GoodsManagement_UpdateTem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet-shop</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Frame.css" />
    <link rel="stylesheet" type="text/css" href="../../css/UpdateTem-Content.css" />   
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
                <a href="Template.aspx">运费模板</a>
                <a><cite>修改运费模板</cite></a>
            </div>
            <div id="displaybox">
                <asp:Label ID="Label1" runat="server" Text="修改运费模板" Font-Bold="True" Font-Size="Medium" Font-Names="宋体" ForeColor="#000066"></asp:Label>

                <div class="layui-form showbox">
                    <div>
                        <asp:Label ID="Label22" runat="server" Text="Label">模板编号：</asp:Label>
                        <asp:Label ID="TnoLabel" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="Label2" runat="server" Text="Label">模板名称：</asp:Label>
                        <asp:TextBox ID="TnameText" runat="server" Height="20px"></asp:TextBox>
                    </div>

                    <div id="radio1">
                        <asp:Label ID="Label4" runat="server" Text="Label">是否包邮：</asp:Label>
                        <input type="radio" name="way1" title="自定义邮费" checked value="否" runat="server" id="N" />&nbsp;&nbsp;
                        <input type="radio" name="way1" title="包邮" value="是" runat="server" id="Y" />
                    </div>

                    <div id="radio2">
                        <asp:Label ID="Label5" runat="server" Text="Label">计价方式：</asp:Label>
                        <input type="radio" name="way2" title="按重量" checked value="按重量" />
                    </div>
                    <div>
                        <asp:Label ID="Label21" runat="server" Text="Label" Width="70px">目的地：</asp:Label>
                        <asp:TextBox ID="TaddressText" runat="server" Height="20px"></asp:TextBox>
                    </div>

                    <div>
                        <asp:Label ID="Label6" runat="server" Text="Label">运送方式：</asp:Label>
                        <div class="clickbox">
                            <div class="titlebox">
                                <input type="checkbox" name="way3" title="快递" lay-skin="primary" lay-filter="cb1" value="快递" id="kd" />
                            </div>
                            <div class="layui-form-item" id="Div1" runat="server">
                                <div class="insidebox">   
                                    <asp:Label ID="Label3" runat="server" Text="Label">默认运费：</asp:Label>
                                    <asp:TextBox ID="Tweight1Text1" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label7" runat="server" Text="Label">kg内，</asp:Label>
                                    <asp:TextBox ID="Tfare1Text1" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label8" runat="server" Text="Label">元，每增加</asp:Label>
                                    <asp:TextBox ID="Tweight2Text1" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label9" runat="server" Text="Label">kg，增加运费</asp:Label>
                                    <asp:TextBox ID="Tfare2Text1" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label10" runat="server" Text="Label">元</asp:Label>
                                </div>
                             </div>


                            <div class="titlebox">
                                <input type="checkbox" name="way3" title="EMS" lay-skin="primary" lay-filter="cb2" value="EMS" id="ems" />
                            </div>
                            <div class="layui-form-item" id="Div2" runat="server">
                                <div class="insidebox">
                                    <asp:Label ID="Label11" runat="server" Text="Label">默认运费：</asp:Label>
                                    <asp:TextBox ID="Tweight1Text2" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label12" runat="server" Text="Label">kg内，</asp:Label>
                                    <asp:TextBox ID="Tfare1Text2" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label13" runat="server" Text="Label">元，每增加</asp:Label>
                                    <asp:TextBox ID="Tweight2Text2" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label14" runat="server" Text="Label">kg，增加运费</asp:Label>
                                    <asp:TextBox ID="Tfare2Text2" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label15" runat="server" Text="Label">元</asp:Label>   
                                </div>
                             </div>
                            

                            <div class="titlebox">
                                <input type="checkbox" name="way3" title="平邮" lay-skin="primary" lay-filter="cb3" value="平邮" id="py" />
                            </div>
                            <div class="layui-form-item" id="Div3" runat="server">
                                <div class="insidebox">
                                    <asp:Label ID="Label16" runat="server" Text="Label">默认运费：</asp:Label>
                                    <asp:TextBox ID="Tweight1Text3" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label17" runat="server" Text="Label">kg内，</asp:Label>
                                    <asp:TextBox ID="Tfare1Text3" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label18" runat="server" Text="Label">元，每增加</asp:Label>
                                    <asp:TextBox ID="Tweight2Text3" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label19" runat="server" Text="Label">kg，增加运费</asp:Label>
                                    <asp:TextBox ID="Tfare2Text3" runat="server" Width="60px"></asp:TextBox>
                                    <asp:Label ID="Label20" runat="server" Text="Label">元</asp:Label>  
                                </div>
                            </div>                
                        </div>
                    </div>

                    <div class="buttonbox">
                        <hr id="hr" />
                        <div>
                            <asp:Button ID="SaveButton" runat="server" Text="保存并返回" CssClass="layui-btn layui-btn-sm layui-bg-red" onclick="Save_Click" CommandArgument='<%# Eval("Gno") %>'/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="Template.aspx"><button type="button" class="layui-btn layui-btn-sm CancelButton">取消</button></a>
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
    layui.use(['element', 'form', 'jquery'], function () {
        var element = layui.element;
        var form = layui.form;
        var $ = layui.$;

        form.on('checkbox(cb1)', function (data) {
            if (data.elem.checked == true) {
                $("#Div1").show();
            }
            else {
                $("#Div1").hide();
            }
        });
        form.on('checkbox(cb2)', function (data) {
            if (data.elem.checked == true) {
                $("#Div2").show();
            }
            else {
                $("#Div2").hide();

            }
        });
        form.on('checkbox(cb3)', function (data) {
            if (data.elem.checked == true) {
                $("#Div3").show();
            }
            else {
                $("#Div3").hide();

            }
        });
    });
</script>
</body>
</html>