Imports Microsoft.VisualBasic

<Serializable()> Public Class User
    Private id As Integer
    Private name As String
    Private address As String
    Private phone As String
    Private type As String

    Public Sub setID(ByVal id As Integer)
        Me.id = id
    End Sub

    Public Function getID() As Integer
        Return id
    End Function

    Public Sub setName(ByVal name As String)
        Me.name = name
    End Sub

    Public Function getName() As String
        Return name
    End Function

    Public Sub setAddress(ByVal address As String)
        Me.address = address
    End Sub

    Public Function getAddress() As String
        Return address
    End Function

    Public Sub setPhone(ByVal phone As String)
        Me.phone = phone
    End Sub

    Public Function getPhone() As String
        Return phone
    End Function

    Public Sub setUserType(ByVal type As String)
        Me.type = type
    End Sub

    Public Function getUserType() As String
        Return type
    End Function


End Class
