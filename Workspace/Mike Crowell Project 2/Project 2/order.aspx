<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="order.aspx.vb" Inherits="order" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 97px;
        }
        .style2
        {
            width: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <h2><b>Place Your Order</b></h2>
    <br />
    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Item: "></asp:Label>
&nbsp;<asp:DropDownList ID="ddlProducts" runat="server" Width="150px"
        AutoPostBack="true" DataSourceID="sqlDataSource1"
        DataTextField="name" DataValueField="productID">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="productID" 
        DataSourceID="SqlDataSource2" Height="271px" Width="541px">
        <EditItemTemplate>
            name:
            <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
            <br />
            productID:
            <asp:Label ID="productIDLabel1" runat="server" 
                Text='<%# Eval("productID") %>' />
            <br />
            description:
            <asp:TextBox ID="descriptionTextBox" runat="server" 
                Text='<%# Bind("description") %>' />
            <br />
            itemcost:
            <asp:TextBox ID="itemcostTextBox" runat="server" 
                Text='<%# Bind("itemcost") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            name:
            <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
            <br />
            description:
            <asp:TextBox ID="descriptionTextBox" runat="server" 
                Text='<%# Bind("description") %>' />
            <br />
            itemcost:
            <asp:TextBox ID="itemcostTextBox" runat="server" 
                Text='<%# Bind("itemcost") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;&nbsp;<asp:Image ID="Image3" runat="server" 
                ImageUrl='<%# Eval("imgurl") %>' Height="200px" ImageAlign="AbsMiddle" 
                style="text-align: center" Width="200px" />
            <br />
            <br />
            <table style="width: 97%;">
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Name: "></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Description: "></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="descriptionLabel" runat="server" 
                            Text='<%# Bind("description") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Cost:"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="itemcostLabel" runat="server" Text='<%# Bind("itemcost","{0:c2}") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Qty on Hand:"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="qtyLabel" runat="server" Text='<%# Eval("inventorycount") %>'></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:FormView>
    
    <asp:Label ID="Label2" runat="server" Text="Quantity:" 
        Width="80px"></asp:Label>
    <asp:TextBox ID="txtQuantity" runat="server" Width="80px"></asp:TextBox>
    <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtQuantity" Display="Dynamic" 
        ErrorMessage="Quantity is a required field.">
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" 
        ControlToValidate="txtQuantity" Display="Dynamic" 
        ErrorMessage="That quantity excedes the number of items in inventory."
        MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator><br /><br />
    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" />&nbsp;
    <asp:Button ID="btnCart" runat="server"  Text="Go to Cart"
        CausesValidation="False" PostBackUrl="~/shoppingcart.aspx" />
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [name], [productID], [description], [itemcost] FROM [Products] ORDER BY [name]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [products] WHERE ([productid] = @productid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlProducts" Name="productid" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>  
      
   
      
</asp:Content>

