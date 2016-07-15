using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RMS.hr
{
    public partial class UserAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindRoles();
                BindDepartment();
            }
        }
        private void BindRoles()
        {
            DropDownList2.Items.Insert(0, new ListItem("------Select-------", ""));
            DropDownList2.Items.Insert(1, new ListItem("HR", "HR"));
        }

        private void BindDepartment()
        {
            DropDownList1.Items.Insert(0, new ListItem("------Select-------", ""));
            DropDownList1.Items.Insert(1, new ListItem("HR", "HR"));

        }
        protected void clearText()
        {
            txtUserName.Text = "";
            txtUserid.Text = "";
            txtPassword.Text = "";
            txtDesignation.Text = "";
        }
        protected void Insert(object sender, EventArgs e)
        {
            try
            {

                SqlDataSource1.Insert();
                clearText();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertError", "alertError(\"Fill all Mandatory Entries\" );", true);
            }

        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex != e.Row.RowIndex)
            {
                (e.Row.Cells[5].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

    }

}