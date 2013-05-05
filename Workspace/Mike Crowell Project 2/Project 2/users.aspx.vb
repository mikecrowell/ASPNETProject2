
Partial Class users
    Inherits System.Web.UI.Page

    Protected Sub btnAdd_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnAdd.Click
        SqlDataSource1.InsertParameters("username").DefaultValue _
            = txtName.Text
        SqlDataSource1.InsertParameters("address").DefaultValue _
            = txtAddress.Text
        SqlDataSource1.InsertParameters("phone").DefaultValue _
            = txtPhone.Text
        SqlDataSource1.InsertParameters("usertype").DefaultValue _
            = ddlType.SelectedValue
        Try
            SqlDataSource1.Insert()
            txtName.Text = ""
            txtAddress.Text = ""
            txtPhone.Text = ""
            ddlType.SelectedValue = "User"
        Catch ex As Exception
            lblError.Text = "A database error occurred. " _
                & ex.Message
        End Try
    End Sub

    Protected Sub GridView1_RowUpdated(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) _
            Handles GridView1.RowUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error occurred. " _
                & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that category. " _
                & "Please try again."
        End If
    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) _
            Handles GridView1.RowDeleted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error occurred. " _
                & e.Exception.Message
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated this category. " _
                & "Please try again."
        End If
    End Sub

End Class
