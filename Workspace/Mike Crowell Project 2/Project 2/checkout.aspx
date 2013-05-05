<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="checkout.aspx.vb" Inherits="checkout" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 107px;
        }
        .style2
        {
            width: 215px;
        }
        .style3
        {
            width: 102px;
        }
        .style4
        {
            width: 233px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;
    </p>
    <p>
        <h2><b>Thank you for your order!</b></h2>&nbsp;<table style="width:100%;">
    <tr>
        <td class="style1">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Account #: "></asp:Label>
        </td>
        <td class="style2">
            <asp:Label ID="lblID" runat="server" Text="Label"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Name: "></asp:Label>
        </td>
        <td class="style2">
            <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Address: "></asp:Label>
        </td>
        <td class="style2">
            <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Phone"></asp:Label>
        </td>
        <td class="style2">
            <asp:Label ID="lblPhone" runat="server" Text="Label"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    </table>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="orderdateLabel" runat="server" Text='<%# Eval("orderdate") %>' />
                </td>
                <td>
                    <asp:Label ID="prodnameLabel" runat="server" Text='<%# Eval("prodname") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" 
                        Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="itemcostLabel" runat="server" Text='<%# Eval("itemcost") %>' />
                </td>
                <td>
                    <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                </td>
                <td>
                    <asp:Label ID="extendedcostLabel" runat="server" 
                        Text='<%# Eval("extendedcost") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="orderdateLabel" runat="server" Text='<%# Eval("orderdate") %>' />
                </td>
                <td>
                    <asp:Label ID="prodnameLabel" runat="server" Text='<%# Eval("prodname") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" 
                        Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="itemcostLabel" runat="server" Text='<%# Eval("itemcost") %>' />
                </td>
                <td>
                    <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                </td>
                <td>
                    <asp:Label ID="extendedcostLabel" runat="server" 
                        Text='<%# Eval("extendedcost") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="orderdateTextBox" runat="server" 
                        Text='<%# Bind("orderdate") %>' />
                </td>
                <td>
                    <asp:TextBox ID="prodnameTextBox" runat="server" 
                        Text='<%# Bind("prodname") %>' />
                </td>
                <td>
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                </td>
                <td>
                    <asp:TextBox ID="itemcostTextBox" runat="server" 
                        Text='<%# Bind("itemcost") %>' />
                </td>
                <td>
                    <asp:TextBox ID="quantityTextBox" runat="server" 
                        Text='<%# Bind("quantity") %>' />
                </td>
                <td>
                    <asp:TextBox ID="extendedcostTextBox" runat="server" 
                        Text='<%# Bind("extendedcost") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                    orderdate</th>
                                <th runat="server">
                                    prodname</th>
                                <th runat="server">
                                    description</th>
                                <th runat="server">
                                    itemcost</th>
                                <th runat="server">
                                    quantity</th>
                                <th runat="server">
                                    extendedcost</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="orderdateTextBox" runat="server" 
                        Text='<%# Bind("orderdate") %>' />
                </td>
                <td>
                    <asp:TextBox ID="prodnameTextBox" runat="server" 
                        Text='<%# Bind("prodname") %>' />
                </td>
                <td>
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                </td>
                <td>
                    <asp:TextBox ID="itemcostTextBox" runat="server" 
                        Text='<%# Bind("itemcost") %>' />
                </td>
                <td>
                    <asp:TextBox ID="quantityTextBox" runat="server" 
                        Text='<%# Bind("quantity") %>' />
                </td>
                <td>
                    <asp:TextBox ID="extendedcostTextBox" runat="server" 
                        Text='<%# Bind("extendedcost") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="orderdateLabel" runat="server" Text='<%# Eval("orderdate") %>' />
                </td>
                <td>
                    <asp:Label ID="prodnameLabel" runat="server" Text='<%# Eval("prodname") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" 
                        Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="itemcostLabel" runat="server" Text='<%# Eval("itemcost") %>' />
                </td>
                <td>
                    <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                </td>
                <td>
                    <asp:Label ID="extendedcostLabel" runat="server" 
                        Text='<%# Eval("extendedcost") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [orderdate], [prodname], [description], [itemcost], [quantity], [extendedcost] FROM [shoppingcart] WHERE ([userid] = @userid)">
        <SelectParameters>
            <asp:CookieParameter CookieName="UserID" Name="userid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Order Total: "></asp:Label>
            </td>
            <td class="style4">
                <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
        
        
</asp:Content>

