<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="shoppingcart.aspx.vb" Inherits="shoppingcart" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        
        SelectCommand="SELECT * FROM [shoppingcart] WHERE ([userid] = @userid)" 
        DeleteCommand="DELETE FROM [shoppingcart] WHERE [lineitemnum] = @lineitemnum" 
        InsertCommand="INSERT INTO [shoppingcart] ([userid], [orderdate], [prodid], [prodname], [description], [itemcost], [quantity], [extendedcost]) VALUES (@userid, @orderdate, @prodid, @prodname, @description, @itemcost, @quantity, @extendedcost)" 
        UpdateCommand="UPDATE [shoppingcart] SET [userid] = @userid, [orderdate] = @orderdate, [prodid] = @prodid, [prodname] = @prodname, [description] = @description, [itemcost] = @itemcost, [quantity] = @quantity, [extendedcost] = @extendedcost WHERE [lineitemnum] = @lineitemnum">
        <SelectParameters>
            <asp:CookieParameter CookieName="UserID" Name="userid" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="lineitemnum" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="userid" Type="Int32" />
            <asp:Parameter Name="orderdate" Type="String" />
            <asp:Parameter Name="prodid" Type="Int32" />
            <asp:Parameter Name="prodname" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="itemcost" Type="Decimal" />
            <asp:Parameter Name="quantity" Type="Int32" />
            <asp:Parameter Name="extendedcost" Type="Decimal" />
            <asp:Parameter Name="lineitemnum" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="userid" Type="Int32" />
            <asp:Parameter Name="orderdate" Type="String" />
            <asp:Parameter Name="prodid" Type="Int32" />
            <asp:Parameter Name="prodname" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="itemcost" Type="Decimal" />
            <asp:Parameter Name="quantity" Type="Int32" />
            <asp:Parameter Name="extendedcost" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <h2><b>Shopping Cart
        <asp:Label ID="Label1" runat="server" Text="for" Visible="False"></asp:Label>
&nbsp;<asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
        </b></h2>
    <br />
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
        DataKeyNames="lineitemnum">
    <ItemTemplate>
        <tr style="background-color: #E0FFFF;color: #333333;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                    Text="Delete" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            </td>
            <td>
                <asp:Label ID="lineitemnumLabel" runat="server" 
                    Text='<%# Eval("lineitemnum") %>' />
            </td>
            <td>
                <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
            </td>
            <td>
                <asp:Label ID="orderdateLabel" runat="server" Text='<%# Eval("orderdate") %>' />
            </td>
            <td>
                <asp:Label ID="prodidLabel" runat="server" Text='<%# Eval("prodid") %>' />
            </td>
            <td>
                <asp:Label ID="prodnameLabel" runat="server" Text='<%# Eval("prodname") %>' />
            </td>
            <td>
                <asp:Label ID="descriptionLabel" runat="server" 
                    Text='<%# Eval("description") %>' />
            </td>
            <td>
                <asp:Label ID="itemcostLabel" runat="server" Text='<%# FormatCurrency(Eval("itemcost"),2) %>' />
            </td>
            <td>
                <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
            </td>
            <td>
                <asp:Label ID="extendedcostLabel" runat="server" 
                    Text='<%# FormatCurrency(Eval("extendedcost"),2) %>' />
            </td>
        </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <tr style="background-color: #FFFFFF;color: #284775;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                    Text="Delete" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            </td>
            <td>
                <asp:Label ID="lineitemnumLabel" runat="server" 
                    Text='<%# Eval("lineitemnum") %>' />
            </td>
            <td>
                <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
            </td>
            <td>
                <asp:Label ID="orderdateLabel" runat="server" Text='<%# Eval("orderdate") %>' />
            </td>
            <td>
                <asp:Label ID="prodidLabel" runat="server" Text='<%# Eval("prodid") %>' />
            </td>
            <td>
                <asp:Label ID="prodnameLabel" runat="server" Text='<%# Eval("prodname") %>' />
            </td>
            <td>
                <asp:Label ID="descriptionLabel" runat="server" 
                    Text='<%# Eval("description") %>' />
            </td>
            <td>
                <asp:Label ID="itemcostLabel" runat="server" Text='<%# FormatCurrency(Eval("itemcost"),2) %>' />
            </td>
            <td>
                <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
            </td>
            <td>
                <asp:Label ID="extendedcostLabel" runat="server" 
                    Text='<%# FormatCurrency(Eval("extendedcost"),2) %>' />
            </td>
        </tr>
    </AlternatingItemTemplate>
    <EmptyDataTemplate>
        <table id="Table1" runat="server" 
            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
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
                &nbsp;</td>
            <td>
                <asp:TextBox ID="useridTextBox" runat="server" Text='<%# Bind("userid") %>' />
            </td>
            <td>
                <asp:TextBox ID="orderdateTextBox" runat="server" 
                    Text='<%# Bind("orderdate") %>' />
            </td>
            <td>
                <asp:TextBox ID="prodidTextBox" runat="server" Text='<%# Bind("prodid") %>' />
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
        <table id="Table2" runat="server">
            <tr id="Tr1" runat="server">
                <td id="Td1" runat="server">
                    <table ID="itemPlaceholderContainer" runat="server" border="1" 
                        style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <tr id="Tr2" runat="server" style="background-color: #E0FFFF;color: #333333;">
                            <th id="Th1" runat="server">
                            </th>
                            <th id="Th2" runat="server">
                                Line#</th>
                            <th id="Th3" runat="server">
                                User</th>
                            <th id="Th4" runat="server">
                                Date</th>
                            <th id="Th5" runat="server">
                                Prod#</th>
                            <th id="Th6" runat="server">
                                Name</th>
                            <th id="Th7" runat="server">
                                Description</th>
                            <th id="Th8" runat="server">
                                Costt</th>
                            <th id="Th9" runat="server">
                                Qty</th>
                            <th id="Th10" runat="server">
                                Total</th>
                        </tr>
                        <tr ID="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="Tr3" runat="server">
                <td id="Td2" runat="server" 
                    style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </td>
            </tr>
        </table>
    </LayoutTemplate>
    <EditItemTemplate>
        <tr style="background-color: #999999;">
            <td>
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                    Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Cancel" />
            </td>
            <td>
                <asp:Label ID="lineitemnumLabel1" runat="server" 
                    Text='<%# Eval("lineitemnum") %>' />
            </td>
            <td>
                <asp:TextBox ID="useridTextBox" runat="server" ReadOnly="true" Text='<%# Bind("userid") %>' />
            </td>
            <td>
                <asp:TextBox ID="orderdateTextBox" runat="server" 
                    ReadOnly="true" Text='<%# Bind("orderdate") %>' />
            </td>
            <td>
                <asp:TextBox ID="prodidTextBox" runat="server" ReadOnly="true" Text='<%# Bind("prodid") %>' />
            </td>
            <td>
                <asp:TextBox ID="prodnameTextBox" runat="server" 
                    ReadOnly="true" Text='<%# Bind("prodname") %>' />
            </td>
            <td>
                <asp:TextBox ID="descriptionTextBox" runat="server" 
                    ReadOnly="true" Text='<%# Bind("description") %>' />
            </td>
            <td>
                <asp:TextBox ID="itemcostTextBox" runat="server" 
                    ReadOnly="true" Text='<%# Bind("itemcost") %>' />
            </td>
            <td>
                <asp:TextBox ID="quantityTextBox" runat="server" 
                    Text='<%# Bind("quantity") %>' />
                    <asp:RegularExpressionValidator ID="quantityValidator" runat="server" 
                        ControlToValidate="quantityTextBox" Display="Dynamic" ForeColor="White"
                        ErrorMessage="Not a valid quantity." ValidationExpression="[0-9][0-9]*" >
                        </asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="quantityTextBox" Display="Dynamic" ForeColor="White"
                    ErrorMessage="Quantity is a required field.">
                </asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="quantityTextBox" Display="Dynamic" ForeColor="White"
                    ErrorMessage="That quantity excedes the number of items in inventory."
                    MaximumValue='<%# Bind("quantity") %>' MinimumValue="1" Type="Integer"></asp:RangeValidator>
            </td>
            <td>
                <asp:TextBox ID="extendedcostTextBox" runat="server" 
                    ReadOnly="true" Text='<%# Bind("extendedcost") %>' />
            </td>
        </tr>
    </EditItemTemplate>
    <SelectedItemTemplate>
        <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                    Text="Delete" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            </td>
            <td>
                <asp:Label ID="lineitemnumLabel" runat="server" 
                    Text='<%# Eval("lineitemnum") %>' />
            </td>
            <td>
                <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
            </td>
            <td>
                <asp:Label ID="orderdateLabel" runat="server" Text='<%# Eval("orderdate") %>' />
            </td>
            <td>
                <asp:Label ID="prodidLabel" runat="server" Text='<%# Eval("prodid") %>' />
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
<br />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" Font-Bold="True" 
        Font-Size="X-Large" Width="242px" PostBackUrl="checkout.aspx" 
        Enabled="False" />
<br />
    <br />
</asp:Content>
