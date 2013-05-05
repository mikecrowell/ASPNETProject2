Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel

Public Class productDB

    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetProducts() As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT prodid, name, description, itemcost, inventorycount " _
            & "FROM products ORDER BY name"
        Dim cmd As New SqlCommand(sel, con)
        con.Open()
        Dim rdr As SqlDataReader _
            = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return rdr
    End Function

    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetProductByID(ByVal prodid As Integer) As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT productid, name, description, itemcost, inventorycount " _
            & "FROM products WHERE productid = '" + CStr(prodid) + "'"
        Dim cmd As New SqlCommand(sel, con)
        con.Open()
        Dim rdr As SqlDataReader _
            = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return rdr
    End Function

    Private Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings _
            ("ConnectionString").ConnectionString
    End Function

    <DataObjectMethod(DataObjectMethodType.Insert)> _
    Public Shared Sub InsertProduct(ByVal productid As Integer, _
            ByVal name As String, ByVal description As String, ByVal itemcost As Double, _
            ByVal inventorycount As Integer)
        Dim con As New SqlConnection(GetConnectionString)
        Dim ins As String = "INSERT INTO products " _
            & "(productid, name, description, itemcost, inventorycount) " _
            & "VALUES(@productid, @name, @description, @itemcost, @inventorycount)"
        Dim cmd As New SqlCommand(ins, con)
        cmd.Parameters.AddWithValue("productid", productid)
        cmd.Parameters.AddWithValue("name", name)
        cmd.Parameters.AddWithValue("description", description)
        cmd.Parameters.AddWithValue("itemcost", itemcost)
        cmd.Parameters.AddWithValue("inventorycount", inventorycount)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    <DataObjectMethod(DataObjectMethodType.Delete)> _
    Public Shared Function DeleteProduct( _
            ByVal original_productid As Integer) _
            As Integer
        Dim con As New SqlConnection(GetConnectionString)
        Dim del As String = "DELETE FROM products " _
            & "WHERE productid = @original_productid "
        Dim cmd As New SqlCommand(del, con)
        cmd.Parameters.AddWithValue("original_productid", original_productid)
        con.Open()
        Dim i As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return i
    End Function

    <DataObjectMethod(DataObjectMethodType.Update)> _
    Public Shared Function UpdateProduct(ByVal productid As Integer, _
            ByVal name As String, ByVal description As String, ByVal itemcost As Double, _
            ByVal inventorycount As Integer) As Integer
        Dim con As New SqlConnection(GetConnectionString)
        Dim up As String = "UPDATE products " _
            & "SET name = @name, " _
            & "description = @description, " _
            & "itemcost = @itemcost, " _
            & "inventorycount = @inventorycount " _
            & "WHERE productid = @productid "
        Dim cmd As New SqlCommand(up, con)
        cmd.Parameters.AddWithValue("productid", productid)
        cmd.Parameters.AddWithValue("name", name)
        cmd.Parameters.AddWithValue("description", description)
        cmd.Parameters.AddWithValue("itemcost", itemcost)
        cmd.Parameters.AddWithValue("inventorycount", inventorycount)
        con.Open()
        Dim i As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return i
    End Function

End Class
