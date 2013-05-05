Imports System.Data.SqlClient
Partial Class shoppingcart
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim user As User
            If Request.Cookies("UserID") IsNot Nothing Then
                user = Session("theUser")
                Label2.Text = user.getName
                Label1.Visible = True
                Label2.Visible = True
            End If
        End If

    End Sub

    Protected Sub btnCheckout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckout.Click

    End Sub

    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        Dim user As User
        If Request.Cookies("UserID") IsNot Nothing Then
            user = Session("theUser")
            Dim shoppingCart As New shoppingcartDB
            Dim dr As SqlDataReader = shoppingCart.GetCartByID(user.getID)
            If dr.Read Then
                btnCheckout.Enabled = True
            Else
                btnCheckout.Enabled = False
            End If
        End If
    End Sub
End Class
