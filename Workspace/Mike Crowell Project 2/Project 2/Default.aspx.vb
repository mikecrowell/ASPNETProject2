Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim user As User
            If Request.Cookies("UserID") IsNot Nothing Then

                user = Session("theUser")
                If user IsNot Nothing Then
                    Label1.Text = "Welcome "
                    Label1.Font.Bold = True
                    TextBox1.Text = user.getName
                    TextBox1.BackColor = Drawing.Color.Transparent
                    TextBox1.ReadOnly = True
                    TextBox1.BorderStyle = BorderStyle.None
                    TextBox1.Font.Bold = True
                    Button2.Visible = False
                End If
            End If
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim userdb As New userDB
        Dim user As New User

        If TextBox1.Text <> "" Then
            Dim id As Integer = CInt(TextBox1.Text)
            Dim dr As SqlDataReader = userdb.GetUserByID(id)
            If dr.Read Then
                Dim useridCookie As New HttpCookie("UserID", id)
                user.setID(CInt(dr(0).ToString))
                user.setName(dr(1).ToString)
                user.setAddress(dr(2).ToString)
                user.setPhone(dr(3).ToString)
                user.setUserType(dr(4).ToString)
                Label1.Text = "Welcome "
                Label1.Font.Bold = True
                TextBox1.Text = user.getName
                TextBox1.BackColor = Drawing.Color.Transparent
                TextBox1.ReadOnly = True
                TextBox1.BorderStyle = BorderStyle.None
                TextBox1.Font.Bold = True
                Button2.Visible = False
                Response.Cookies.Add(useridCookie)
                Session.Add("theUser", user)
            End If
        End If
    End Sub
End Class
