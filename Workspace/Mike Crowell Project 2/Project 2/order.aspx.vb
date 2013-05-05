Imports System.Data
Imports System.Data.SqlClient
Partial Class order
    Inherits System.Web.UI.Page

    Protected Sub btnAdd_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnAdd.Click
        If Page.IsValid Then
            Dim lineItem As New LineItem
            lineItem.Product = GetSelectedProduct()
            lineItem.Quantity = CType(txtQuantity.Text, Integer)
            Me.AddToCart(lineItem)
            Response.Redirect("shoppingcart.aspx")
        End If
    End Sub

    Private Function GetSelectedProduct() As Product
        Dim productTable As DataView = CType( _
            SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)
        Dim product As New Product
        product.ProductID = productTable(0)("productID").ToString
        product.Name = productTable(0)("name").ToString
        product.Description = productTable(0)("description").ToString
        product.ItemCost = productTable(0)("itemcost").ToString
        Return product
    End Function

    Private Sub AddToCart(ByVal lineItem As LineItem)
        Dim productID As String = lineItem.Product.ProductID
        Dim shoppingCart As New shoppingcartDB
        If Request.Cookies("UserID") IsNot Nothing Then
            Dim id As Integer = Request.Cookies("UserID").Value
            Dim orderDate As String = Format(System.DateTime.Now, "MMddyy")
            Dim dr As SqlDataReader
            dr = shoppingCart.GetLineNumByUserAndProd(id, lineItem.Product.ProductID)
            If dr.Read() Then
                Dim linenum, qty, oldqty As Integer
                linenum = CInt(dr(0).ToString)
                oldqty = CInt(dr(1).ToString)
                qty = oldqty + lineItem.Quantity
                Dim i As Integer = shoppingCart.UpdateLineItemByLineNum(linenum, qty)
            Else
                shoppingCart.InsertLineItem(id, orderDate, lineItem.Product.ProductID, lineItem.Product.Name, lineItem.Product.Description, lineItem.Product.ItemCost, lineItem.Quantity, lineItem.Product.ItemCost * lineItem.Quantity)
            End If
        End If
    End Sub

    Protected Sub ddlProducts_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProducts.SelectedIndexChanged
        Dim productTable As DataView = CType( _
            SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)
        RangeValidator1.MaximumValue = productTable(0)("inventorycount").ToString
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        Dim productTable As DataView = CType( _
            SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)
        RangeValidator1.MaximumValue = productTable(0)("inventorycount").ToString
    End Sub
End Class
