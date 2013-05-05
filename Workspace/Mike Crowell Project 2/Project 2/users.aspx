<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="users.aspx.vb" Inherits="users" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 554px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [users] WHERE [userid] = @userid" 
        InsertCommand="INSERT INTO [users] ([username], [address], [phone], [usertype]) VALUES (@username, @address, @phone, @usertype)" 
        SelectCommand="SELECT * FROM [users]" 
        UpdateCommand="UPDATE [users] SET [username] = @username, [address] = @address, [phone] = @phone, [usertype] = @usertype WHERE [userid] = @userid">
        <DeleteParameters>
            <asp:Parameter Name="userid" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="usertype" Type="String" />
            <asp:Parameter Name="userid" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="usertype" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />

        <h2>User Maintenance</h2>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False" DataKeyNames="userid"
            DataSourceID="SqlDataSource1" ForeColor="Black">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label id="lblUserID" runat="server"
                            Text='<%# Bind("userid") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label id="lblUserID" runat="server"
                            Text='<%# Bind("userid") %>'></asp:Label>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lblGridName" runat="server"
                            Text='<%# Bind("username") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridName" runat="server"
                            width = "125px" MaxLength="15" Text='<%# Bind("username") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtGridName" 
                            Display="Dynamic" ErrorMessage="Name is a required field."
                            ForeColor="White" ValidationGroup="Edit" >*
                        </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="gridnameValidator" runat="server" 
                        ControlToValidate="txtGridName"
                        Display="Dynamic" ErrorMessage="That is not a valid name." ForeColor="White"
                        ValidationExpression="[a-zA-z][a-zA-Z0-9\ \-]*" ValidationGroup="Edit"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Label ID="lblGridAddress" runat="server"
                            Text='<%# Bind("address") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridAddress" runat="server"
                            width = "180px" MaxLength="50" Text='<%# Bind("address") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtGridAddress" 
                            Display="Dynamic" ErrorMessage="Address is a required field."
                            ForeColor="White" ValidationGroup="Edit" >*
                        </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="gridaddressValidator" runat="server" 
                        ControlToValidate="txtGridAddress"
                        Display="Dynamic" ErrorMessage="That is not a valid address." ForeColor="White"
                        ValidationExpression="[a-zA-Z0-9\ \-\.\#]+" ValidationGroup="Edit"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone">
                    <ItemTemplate>
                        <asp:Label ID="lblGridPhone" runat="server"
                            Text='<%# Bind("phone") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridPhone" runat="server"
                            width = "180px" MaxLength="50" Text='<%# Bind("phone") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtGridPhone" 
                            Display="Dynamic" ErrorMessage="Phone is a required field."
                            ForeColor="White" ValidationGroup="Edit" >*
                        </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="gridphoneValidator" runat="server" 
                        ControlToValidate="txtGridPhone"
                        Display="Dynamic" ErrorMessage="That is not a valid phone number." 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="White"
                        ValidationGroup="Edit"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Type">
                    <ItemTemplate>
                        <asp:Label ID="lblGridType" runat="server"
                            Text='<%# Bind("usertype") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridType" runat="server"
                            width = "180px" MaxLength="50" Text='<%# Bind("usertype") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtGridType" 
                            ErrorMessage="User Type is a required field."
                            ForeColor="White" ValidationGroup="Edit" >*
                        </asp:RequiredFieldValidator>
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
        To create a new user, enter the user information
        and click Add New User.<br />
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
                        ErrorMessage="Short Name is a required field." 
                        ValidationGroup="New"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="nameValidator" runat="server" 
                        Display="Dynamic" ErrorMessage="That is not a valid name." 
                        ValidationExpression="[a-zA-z][a-zA-Z0-9\ \-]*" ValidationGroup="New" 
                        ControlToValidate="txtName"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="195px"">Address:</td>
                <td width="100px">
                    <asp:TextBox ID="txtAddress" runat="server"
                        Width="200px"></asp:TextBox></td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server" ControlToValidate="txtAddress"
                        ErrorMessage="Long Name is a required field." 
                        ValidationGroup="New"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="addressValidator" runat="server" 
                        Display="Dynamic" ErrorMessage="That is not a valid address." 
                        ValidationExpression="[a-zA-Z0-9\ \-\.\#]+" ValidationGroup="New" 
                        ControlToValidate="txtAddress"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="100px">Phone:</td>
                <td width="100px">
                    <asp:TextBox ID="txtPhone" runat="server"
                        Width="200px"></asp:TextBox></td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        runat="server" ControlToValidate="txtPhone"
                        ErrorMessage="Long Name is a required field." 
                        ValidationGroup="New"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="phoneValidator" runat="server" 
                        ErrorMessage="That is not a valid phone number." 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
                        ValidationGroup="New" ControlToValidate="txtPhone"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="100px"">Type:</td>
                <td width="100px">
		    <asp:DropDownList ID="ddlType" runat="server" Width="200px">
			<asp:ListItem>Admin</asp:ListItem>
			<asp:ListItem Selected="True">User</asp:ListItem>
		    </asp:DropDownList>                           
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server" ControlToValidate="ddlType"
                        ErrorMessage="Long Name is a required field." 
                        ValidationGroup="New"></asp:RequiredFieldValidator></td>
            </tr>            
        </table>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add New User" 
            ValidationGroup="New" />


</asp:Content>

