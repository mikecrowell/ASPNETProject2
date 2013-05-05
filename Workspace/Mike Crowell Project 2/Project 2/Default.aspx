<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" title="Toddler Art Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 600px; border-collapse:collapse;"><tr><td style="width: 50%;">
     <center><h2 style="color: black">Art by Elaine</h2>
    <b style="color: black; width: 313px;">Original toddler artwork created by Elaine Allison Crowell</b>
</center>  
   </td><td style="width: 50%;"></td></tr></table>

    
    <br />
    <table>
    <tr>
    <td>
    <center>
    <p style="width: 293px; height: 170px; margin-bottom: 114px">
     <asp:Image ID="Image1" runat="server" Height="73px" ImageAlign="Middle" 
        ImageUrl="App_Themes/Standard/images/fingerpaint.jpg" Width="100px" />
     <asp:Image ID="Image2" runat="server" Height="122px" ImageAlign="Middle" 
        ImageUrl="App_Themes/Standard/images/crayonscribbles.jpg" Width="100px" />     
        <br />
      <asp:Image ID="Image3" runat="server" Height="75px" ImageAlign="Middle" 
        ImageUrl="App_Themes/Standard/images/scribbles02.jpg" Width="100px" /> 
      <asp:Image ID="Image4" runat="server" Height="79px" ImageAlign="Middle" 
        ImageUrl="App_Themes/Standard/images/rainbow.jpg" Width="100px" />         
        <br />
    &nbsp;<asp:Button ID="Button1" runat="server" PostBackUrl="~/order.aspx" 
            Text="Place Your Order Today" Width="248px" BackColor="Yellow" 
            ForeColor="Black" />
        <br />
        </p>
        </center>
    </td>
    <td>
    <div class="tip">
        <table>
        <tr>
        <td colspan="2">
        <center>
         <asp:Label ID="Label1" runat="server" Text="User ID: "></asp:Label>
         <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
         <asp:Button ID="Button2" runat="server" Text="Log In" />
         </center>
        </td>
        </tr>
        <tr>
        <td>
            Log in with your user ID and place your order.
        </td>
        <td>
            
     <asp:Image ID="ImageTip" runat="server" Height="241px" ImageAlign="Middle" 
        ImageUrl="App_Themes/Standard/images/elaineeggs.gif" Width="200px" />            
        </td>
        </tr>
        </table>
    </div> 
    </td>
    </tr>
    </table>
        <center>
    <asp:Image ID="imgFamily" runat="server" Height="344px" ImageAlign="Middle" 
        ImageUrl="App_Themes/Standard/images/elainequeen.jpg" Width="272px" />
        <br />
    <b>Elaine Allison Crowell<br />
    Toddler artist
        <br />
        </b>
        <br />
        <br />
    <br />
    
    </center>
 
     
</asp:Content>



