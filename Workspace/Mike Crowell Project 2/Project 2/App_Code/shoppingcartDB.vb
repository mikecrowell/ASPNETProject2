Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel

<DataObject(True)> _
Public Class shoppingcartDB

    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetCart() As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT prodname, description, itemcost, quantity, extendedcost " _
            & "lineitemnum, userid, orderdate, prodid" _
            & "FROM shoppingcart ORDER BY prodname"
        Dim cmd As New SqlCommand(sel, con)
        con.Open()
        Dim rdr As SqlDataReader _
            = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return rdr
    End Function

    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetCartTotalByID(ByVal userid As Integer) As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT SUM(extendedcost) " _
            & "FROM shoppingcart WHERE userid = '" + CStr(userid) + "'"
        Dim cmd As New SqlCommand(sel, con)
        con.Open()
        Dim rdr As SqlDataReader _
            = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return rdr
    End Function

    <DataObjectMethod(DataObjectMethodType.Select)> _
Public Shared Function GetCartByID(ByVal userid As Integer) As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT userid, orderdate, prodid, prodname, description, itemcost, quantity, extendedcost, lineitemnum " _
            & "FROM shoppingcart WHERE userid = '" + CStr(userid) + "'"
        Dim cmd As New SqlCommand(sel, con)
        con.Open()
        Dim rdr As SqlDataReader _
            = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return rdr
    End Function

    <DataObjectMethod(DataObjectMethodType.Select)> _
Public Shared Function GetLineNumByUserAndProd(ByVal userid As Integer, ByRef prodid As Integer) As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT lineitemnum, quantity " _
            & "FROM shoppingcart WHERE userid = '" + CStr(userid) + "' AND prodid = '" + CStr(prodid) + "'"
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
    Public Shared Sub InsertLineItem(ByVal userid As Integer, _
            ByVal orderdate As String, ByVal prodid As Integer, ByVal prodname As String, _
            ByVal description As String, ByVal itemcost As Double, ByVal quantity As Integer, _
            ByVal extendedcost As Double)
        Dim con As New SqlConnection(GetConnectionString)
        Dim ins As String = "INSERT INTO shoppingcart " _
            & "(userid, orderdate, prodid, prodname, description, itemcost, quantity, extendedcost) " _
            & "VALUES(@userid, @orderdate, @prodid, @prodname, @description, @itemcost, @quantity, @extendedcost)"
        Dim cmd As New SqlCommand(ins, con)
        cmd.Parameters.AddWithValue("userid", userid)
        cmd.Parameters.AddWithValue("orderdate", orderdate)
        cmd.Parameters.AddWithValue("prodid", prodid)
        cmd.Parameters.AddWithValue("prodname", prodname)
        cmd.Parameters.AddWithValue("description", description)
        cmd.Parameters.AddWithValue("itemcost", itemcost)
        cmd.Parameters.AddWithValue("quantity", quantity)
        cmd.Parameters.AddWithValue("extendedcost", extendedcost)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    <DataObjectMethod(DataObjectMethodType.Delete)> _
    Public Shared Function DeleteLineItem( _
            ByVal original_lineitemnum As Integer, _
            ByVal original_userid As String, _
            ByVal original_prodid As String) _
            As Integer
        Dim con As New SqlConnection(GetConnectionString)
        Dim del As String = "DELETE FROM shoppingcart " _
            & "WHERE userid = @original_userid " _
            & "AND lineitemnum = @original_lineitemnum " _
            & "AND prodid = @original_prodid "
        Dim cmd As New SqlCommand(del, con)
        cmd.Parameters.AddWithValue("original_lineitemnum", original_lineitemnum)
        cmd.Parameters.AddWithValue("original_userid", original_userid)
        cmd.Parameters.AddWithValue("original_prodid", original_prodid)
        con.Open()
        Dim i As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return i
    End Function

    <DataObjectMethod(DataObjectMethodType.Update)> _
    Public Shared Function UpdateLineItem(ByVal original_userid As Integer, _
            ByVal original_orderdate As String, ByVal original_prodid As Integer, ByVal quantity As Integer) As Integer
        Dim con As New SqlConnection(GetConnectionString)
        Dim up As String = "UPDATE shoppingcart " _
            & "SET quantity = @quantity " _
            & "WHERE userid = @original_userid " _
            & "AND orderdate = @original_orderdate " _
            & "AND prodid = @original_prodid"
        Dim cmd As New SqlCommand(up, con)
        cmd.Parameters.AddWithValue("quantity", quantity)
        cmd.Parameters.AddWithValue("original_userid", original_userid)
        cmd.Parameters.AddWithValue("original_orderdate", original_orderdate)
        cmd.Parameters.AddWithValue("Original_prodid", original_prodid)
        con.Open()
        Dim i As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return i
    End Function

    <DataObjectMethod(DataObjectMethodType.Update)> _
    Public Shared Function UpdateLineItemByLineNum(ByVal original_lineitemnum As Integer, _
            ByVal quantity As Integer) As Integer
        Dim con As New SqlConnection(GetConnectionString)
        Dim up As String = "UPDATE shoppingcart " _
            & "SET quantity = @quantity " _
            & "WHERE lineitemnum = @original_lineitemnum "
        Dim cmd As New SqlCommand(up, con)
        cmd.Parameters.AddWithValue("quantity", quantity)
        cmd.Parameters.AddWithValue("original_lineitemnum", original_lineitemnum)
        con.Open()
        Dim i As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return i
    End Function

End Class
