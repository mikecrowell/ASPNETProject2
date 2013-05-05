Imports Microsoft.VisualBasic

<Serializable()> Public Class Payment
    Private pmtType As Integer
    Private amount As Double
    Private ccNum As String
    Private ccExp As String

    Public Sub setPmtType(ByVal pmtType As Integer)
        Me.pmtType = pmtType
    End Sub

    Public Function getPmtType() As Integer
        Return pmtType
    End Function

    Public Sub setAmount(ByVal amount As Double)
        Me.amount = amount
    End Sub

    Public Function getAmount() As Double
        Return amount
    End Function

    Public Sub setCCNum(ByVal ccNum As String)
        Me.ccNum = ccNum
    End Sub

    Public Function getCCNum() As String
        Return ccNum
    End Function

    Public Sub setCCExp(ByVal ccExp As String)
        Me.ccExp = ccExp
    End Sub

    Public Function getCCExp() As String
        Return ccExp
    End Function

End Class
