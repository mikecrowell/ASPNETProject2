Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel

Public Class userDB

    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetUsers() As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT userid, username, address, phone, usertype " _
            & "FROM users ORDER BY username"
        Dim cmd As New SqlCommand(sel, con)
        con.Open()
        Dim rdr As SqlDataReader _
            = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return rdr
    End Function

    <DataObjectMethod(DataObjectMethodType.Select)> _
Public Shared Function GetUserByID(ByVal userid As Integer) As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT userid, username, address, phone, usertype " _
            & "FROM users WHERE userid = '" + CStr(userid) + "'"
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
    Public Shared Sub InsertUser(ByVal userid As Integer, _
            ByVal username As String, ByVal address As String, ByVal phone As String, _
            ByVal usertype As String)
        Dim con As New SqlConnection(GetConnectionString)
        Dim ins As String = "INSERT INTO users " _
            & "(userid, username, address, phone, usertype) " _
            & "VALUES(@userid, @username, @address, @phone, @usertype)"
        Dim cmd As New SqlCommand(ins, con)
        cmd.Parameters.AddWithValue("userid", userid)
        cmd.Parameters.AddWithValue("username", username)
        cmd.Parameters.AddWithValue("address", address)
        cmd.Parameters.AddWithValue("phone", phone)
        cmd.Parameters.AddWithValue("usertype", usertype)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    <DataObjectMethod(DataObjectMethodType.Delete)> _
    Public Shared Function DeleteLineItem( _
            ByVal original_userid As Integer) _
            As Integer
        Dim con As New SqlConnection(GetConnectionString)
        Dim del As String = "DELETE FROM users " _
            & "WHERE userid = @original_userid "
        Dim cmd As New SqlCommand(del, con)
        cmd.Parameters.AddWithValue("original_userid", original_userid)
        con.Open()
        Dim i As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return i
    End Function

    <DataObjectMethod(DataObjectMethodType.Update)> _
    Public Shared Function UpdateLineItem(ByVal userid As Integer, _
            ByVal username As String, ByVal address As String, ByVal phone As String, _
            ByVal usertype As String) As Integer
        Dim con As New SqlConnection(GetConnectionString)
        Dim up As String = "UPDATE users " _
            & "SET username = @username, " _
            & "address = @address, " _
            & "phone = @phone, " _
            & "usertype = @usertype " _
            & "WHERE userid = @original_userid "
        Dim cmd As New SqlCommand(up, con)
        cmd.Parameters.AddWithValue("userid", userid)
        cmd.Parameters.AddWithValue("username", username)
        cmd.Parameters.AddWithValue("address", address)
        cmd.Parameters.AddWithValue("phone", phone)
        cmd.Parameters.AddWithValue("usertype", usertype)
        con.Open()
        Dim i As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return i
    End Function

End Class
