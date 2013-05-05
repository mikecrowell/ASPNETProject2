Imports System.Data.SqlClient
Partial Class checkout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim user As User
            Dim shoppingCart As New shoppingcartDB
            Dim productdb As New productDB
            Dim lineitem As New LineItem
            Dim dr As SqlDataReader
            If Request.Cookies("UserID") IsNot Nothing Then
                user = Session("theUser")
                lblID.Text = user.getID.ToString
                lblName.Text = user.getName
                lblAddress.Text = user.getAddress
                lblPhone.Text = user.getPhone
                Dim id As Integer = user.getID
                dr = shoppingCart.GetCartTotalByID(id)
                If dr.Read Then
                    lblTotal.Text = FormatCurrency(CDbl(dr(0).ToString), 2)
                End If
            End If
        End If

    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete

    End Sub

    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Dim user As User
            Dim shoppingCart As New shoppingcartDB
            Dim productdb As New productDB
            Dim dr, pdr As SqlDataReader
            Dim prodname, desc, orderdate As String
            Dim linenum, prodid, qty, oldqty As Integer
            Dim itemcost As Double
            Dim checkStat As Integer
            If Request.Cookies("UserID") IsNot Nothing Then
                user = Session("theUser")
                dr = shoppingCart.GetCartByID(user.getID)
                While dr.Read()
                    linenum = CInt(dr(8).ToString)
                    prodid = CInt(dr(2).ToString)
                    prodname = dr(3).ToString
                    desc = dr(4).ToString
                    orderdate = dr(1).ToString
                    itemcost = CDbl(dr(5).ToString)
                    qty = CInt(dr(6).ToString)
                    pdr = productdb.GetProductByID(prodid)
                    If pdr.Read() Then
                        oldqty = CInt(pdr(4).ToString)
                        qty = oldqty - qty
                    End If
                    checkStat = shoppingCart.DeleteLineItem(linenum, user.getID, prodid)
                    checkStat = productdb.UpdateProduct(prodid, prodname, desc, itemcost, qty)
                End While
            End If
        End If
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload

    End Sub
End Class
