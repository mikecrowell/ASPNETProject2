<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="inventory.aspx.vb" Inherits="inventory" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 555px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2><b>Inventory</b></h2>
    <p>&nbsp;</p>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False" DataKeyNames="productid"
            DataSourceID="SqlDataSource1" ForeColor="Black" AllowPaging="True" 
        AllowSorting="True">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label id="lblProductID" runat="server"
                            Text='<%# Bind("productid") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label id="lblProductID" runat="server"
                            Text='<%# Bind("productid") %>'></asp:Label>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lblGridName" runat="server"
                            Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridName" runat="server"
                            width = "125px" MaxLength="15" Text='<%# Bind("name") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtGridName" 
                            Display="Dynamic" ErrorMessage="Name is a required field."
                            ForeColor="White" ValidationGroup="Edit" >*
                        </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="gridnameValidator" runat="server" 
                        ControlToValidate="txtGridName" Display="Dynamic" ErrorMessage="Not a valid name." ForeColor="White"
                        ValidationExpression="[a-zA-z][a-zA-Z0-9\ \-]*" ValidationGroup="Edit"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="lblDescription" runat="server"
                            Text='<%# Bind("description") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridDescription" runat="server"
                            width = "180px" MaxLength="50" Text='<%# Bind("description") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtGridDescription" 
                            Display="Dynamic" ErrorMessage="Address is a required field."
                            ForeColor="White" ValidationGroup="Edit" >*
                        </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="descriptionValidator" runat="server" 
                        ControlToValidate="txtGridDescription" Display="Dynamic" 
                        ErrorMessage="Not a valid description" ForeColor="White"
                        ValidationExpression="[a-zA-z0-9][a-zA-Z0-9\ \-\.\,]*" ValidationGroup="Edit"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cost">
                    <ItemTemplate>
                        <asp:Label ID="lblGridCost" runat="server"
                            Text='<%# Bind("itemcost") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridCost" runat="server"
                            width = "180px" MaxLength="50" Text='<%# Bind("itemcost") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtGridCost" 
                            Display="Dynamic" ErrorMessage="Phone is a required field."
                            ForeColor="White" ValidationGroup="Edit" >*
                        </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="costValidator" runat="server" 
                        ControlToValidate="txtGridCost" Display="Dynamic" 
                        ErrorMessage="Not a valid decimal value." ForeColor="White"
                        ValidationExpression="[0-9]+.[0-9][0-9]" ValidationGroup="Edit"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Qty">
                    <ItemTemplate>
                        <asp:Label ID="lblGridType" runat="server"
                            Text='<%# Bind("inventorycount") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridQty" runat="server"
                            width = "180px" MaxLength="50" Text='<%# Bind("inventorycount") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtGridQty" 
                            Display="Dynamic" ErrorMessage="User Type is a required field."
                            ForeColor="White" ValidationGroup="Edit" >*
                        </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="quantityValidator" runat="server" 
                        ControlToValidate="txtGridQty" Display="Dynamic" 
                        ErrorMessage="Not a valid quantity." ValidationExpression="[0-9][0-9]*" 
                        ForeColor="White" ValidationGroup="Edit"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True"
                    CausesValidation="True" ValidationGroup="Edit" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True"
                    CausesValidation="False" />
            </Columns>
            <HeaderStyle BackColor="Silver" Font-Bold="True"
                ForeColor="White" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <AlternatingRowStyle BackColor="WhiteSmoke" ForeColor="Black" />
            <EditRowStyle BackColor="Blue" ForeColor="White" />
        </asp:GridView>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            HeaderText="Please correct the following errors:"
            ValidationGroup="Edit" />
        <br />
        To create a new product, enter the product information
        and click Add New Product.<br />
        <asp:Label ID="lblError" runat="server" EnableViewState="False"
            ForeColor="Red"></asp:Label><br />
        <table>
            <tr>
                <td width="100px">Name:</td>
                <td width="100px">
                    <asp:TextBox ID="txtName" runat="server"
                        Width="200px"></asp:TextBox></td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ControlToValidate="txtName"
                        ErrorMessage="Name is a required field." 
                        ValidationGroup="New" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="nameValidator" runat="server" 
                        ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Not a valid name." 
                        ValidationExpression="[a-zA-z][a-zA-Z0-9\ \-]*" ValidationGroup="New"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="195px"">Description:</td>
                <td width="100px">
                    <asp:TextBox ID="txtDescription" runat="server"
                        Width="200px"></asp:TextBox></td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server" ControlToValidate="txtDescription"
                        ErrorMessage="Description is a required field." 
                        ValidationGroup="New" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="descriptionValidator" runat="server" 
                        ControlToValidate="txtDescription" Display="Dynamic" 
                        ErrorMessage="Not a valid description" 
                        ValidationExpression="[a-zA-z0-9][a-zA-Z0-9\ \-\.\,]*" ValidationGroup="New"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="100px">Cost:</td>
                <td width="100px">
                    <asp:TextBox ID="txtCost" runat="server"
                        Width="200px"></asp:TextBox></td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        runat="server" ControlToValidate="txtCost"
                        ErrorMessage="Cost is a required field." 
                        ValidationGroup="New" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="costValidator" runat="server" 
                        ControlToValidate="txtCost" Display="Dynamic" 
                        ErrorMessage="Not a valid decimal value." 
                        ValidationExpression="[0-9]+.[0-9][0-9]" ValidationGroup="New"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="100px"">Qty:</td>
                <td width="100px">
                    <asp:TextBox ID="txtQty" runat="server"
                        Width="200px"></asp:TextBox></td>                          
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server" ControlToValidate="txtQty"
                        ErrorMessage="Quantity is a required field." 
                        ValidationGroup="New" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="quantityValidator" runat="server" 
                        ControlToValidate="txtQty" Display="Dynamic" 
                        ErrorMessage="Not a valid quantity." ValidationExpression="[0-9][0-9]*" 
                        ValidationGroup="New"></asp:RegularExpressionValidator>
                </td>
            </tr>            
        </table>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add New Product" 
            ValidationGroup="New" />


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [products] WHERE [productid] = @productid" 
            InsertCommand="INSERT INTO [products] ([name], [description], [itemcost], [inventorycount]) VALUES (@name, @description, @itemcost, @inventorycount)" 
            SelectCommand="SELECT * FROM [products]" 
            UpdateCommand="UPDATE [products] SET [name] = @name, [description] = @description, [itemcost] = @itemcost, [inventorycount] = @inventorycount WHERE [productid] = @productid">
            <DeleteParameters>
                <asp:Parameter Name="productid" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="itemcost" Type="Decimal" />
                <asp:Parameter Name="inventorycount" Type="Int32" />
                <asp:Parameter Name="productid" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="itemcost" Type="Decimal" />
                <asp:Parameter Name="inventorycount" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
    <p>
        &nbsp;</p>


</asp:Content>

