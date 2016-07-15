using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RMS.hr
{
    public partial class ViewRequet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["Click"] == null)
            {
                sqlDsSubCategories.SelectCommand = "select DISTINCT(ApplicantDetails.[ApplicantId]),[Fname] ,[Mname],[Lname]  ,[Dob]   ,[Gender],[Nationality]  ,[Houseno]  ,[Mobno] ,[PrEmail]  ,[Teachstatus]  ,[Postapplied]   ,[Area]  ,[Otherarea] ,[Specialization] ,[Totalexperience] ,ApplicantDetails.[Date],CAST(ApplicantDetails.[Date] AS datetime) as Sortdate ,[Status],DocumentDetails.Photo as Path,DocumentDetails.Resume as Path2 from ApplicantDetails,DocumentDetails where ApplicantDetails.ApplicantId=DocumentDetails.ApplicantId and ApplicantDetails.Date=DocumentDetails.Date Order By Sortdate DESC";
                gvSubCategories.DataBind();
            }

        }
        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSubCategories.PageIndex = e.NewPageIndex;
            gvSubCategories.DataBind();
        }

        protected void gridMembersList_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Resume")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());
                Session["Path"] = gvSubCategories.DataKeys[index].Values[3].ToString();
                if (Session["Path"] != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('DownloadResume.aspx','_newtab');", true);
                    //Response.Redirect("DownloadResume.aspx");
                }

            }
        }
        // <!-- OnRowCreated="gvSubCategories_RowCreated" onrowcommand="gridMembersList_RowCommand" -->  

        protected void gvSubCategories_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "<div class=\"row\" style=\"background: #002D66;\"><div class=\"col-md-1\"></div><div class=\"col-md-1\"><font color=\"white\">Applicant Id</font></div><div class=\"col-md-2\"><font color=\"white\">Name</font></div><div class=\"col-md-2\"><font color=\"white\">Area</font></div><div class=\"col-md-2\"><font color=\"white\">Post Applied</font></div><div class=\"col-md-1\"><font color=\"white\">Total Experience</font></div><div class=\"col-md-2\"><font color=\"white\">Date</font></div><div class=\"col-md-1\"><font color=\"white\">Status</font></div> </div>";
                //<img alt=\"\" src=\"../expand.gif\" style=\"width: 16px; height: 16px\" />
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Panel Panel1 = (Panel)e.Row.FindControl("pnlSubCategories");

                LinkButton lb2 = (LinkButton)Panel1.FindControl("b2");
                ScriptManager.GetCurrent(this).RegisterPostBackControl(lb2);

                Panel Panel2 = (Panel)e.Row.FindControl("pnlProducts");
                System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)Panel2.FindControl("img");
                try
                {
                    String path = gvSubCategories.DataKeys[e.Row.RowIndex].Values[2].ToString();
                    System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath(path.Substring(path.IndexOf("Documents"))).Replace("\\hr", ""));
                    using (System.Drawing.Image thumbnail = image.GetThumbnailImage(100, 100, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero))
                    {
                        using (MemoryStream memoryStream = new MemoryStream())
                        {
                            thumbnail.Save(memoryStream, ImageFormat.Png);
                            Byte[] bytes = new Byte[memoryStream.Length];
                            memoryStream.Position = 0;
                            memoryStream.Read(bytes, 0, (int)bytes.Length);
                            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                            img.ImageUrl = "data:image/png;base64," + base64String;
                            img.Visible = true;
                        }
                    }
                }
                catch (Exception ex)
                {

                }

            }
        }

        public bool ThumbnailCallback()
        {
            return false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String appid = txtApplicantid.Text.Equals("") ? "%%" : "%" + txtApplicantid.Text.Trim() + "%";
            String appname = txtApplicantname.Text.Equals("") ? "%%" : "%" + txtApplicantname.Text.Trim() + "%";
            String postapplied = DropPostApplied.SelectedValue;
            String teachstatus = DropTeachStatus.SelectedValue;
            String sortby = DropSortBy.SelectedValue;
            String Date1 = Request.Form[TextBox2.UniqueID].Equals("") ? "MIN(ApplicantDetails.Date)" : Request.Form[TextBox2.UniqueID];
            String Date2 = Request.Form[TextBox3.UniqueID].Equals("") ? "MAX(ApplicantDetails.Date)" : Request.Form[TextBox3.UniqueID];


            string additional = "and ApplicantDetails.ApplicantId Like '" + appid + "' and Fname Like '" + appname + "' and Postapplied Like '" + postapplied + "' and Teachstatus Like '" + teachstatus + "' Order By " + sortby;
            sqlDsSubCategories.SelectCommand = "select DISTINCT(ApplicantDetails.[ApplicantId]),[Fname] ,[Mname],[Lname]  ,[Dob]   ,[Gender],[Nationality]  ,[Houseno]  ,[Mobno] ,[PrEmail]  ,[Teachstatus]  ,[Postapplied]   ,[Area]  ,[Otherarea] ,[Specialization] ,[Totalexperience] ,ApplicantDetails.[Date],CAST(ApplicantDetails.[Date] AS datetime) as Sortdate ,[Status],DocumentDetails.Photo as Path,DocumentDetails.Resume as Path2 from ApplicantDetails,DocumentDetails where ApplicantDetails.ApplicantId=DocumentDetails.ApplicantId and ApplicantDetails.Date=DocumentDetails.Date " + additional;

            gvSubCategories.DataBind();
            ViewState["Click"] = "true";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            ViewState.Clear();
            Response.Redirect("ViewRequest.aspx");
        }
        protected void ButtonHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://www.krishnacollege.ac.in/");
        }

        protected void ButtonPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void ButtonRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewRequest.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserAdd.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}