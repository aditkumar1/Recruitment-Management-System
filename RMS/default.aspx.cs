using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RMS
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Text = "KEC-" + GetUniqueKey(5);
            txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
        public string GetUniqueKey(int maxSize)
        {
            char[] chars = new char[62];
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".ToCharArray();
            byte[] data = new byte[1];
            RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider();
            crypto.GetNonZeroBytes(data);
            data = new byte[maxSize];
            crypto.GetNonZeroBytes(data);
            StringBuilder result = new StringBuilder(maxSize);
            foreach (byte b in data)
            {
                result.Append(chars[b % (chars.Length)]);
            }

            return result.ToString();
        }
        protected void submitBtn_Click(object sender, EventArgs e)
        {

            if (StatusLabel.Text.Equals("Upload status: File uploaded!") && StatusLabel2.Text.Equals("Upload status: File uploaded!"))
            {
                Thread t1 = new Thread(performAction);
                t1.IsBackground = true;
                t1.Start();
                Session["Applicantid"] = txtId.Text;
                Response.Redirect("RequestSubmitted.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertError", "alertError(\"Please upload Photo and Resume also\" );", true);
            }

        }
        protected void performAction()
        {
            SaveDetails1();
            SaveDetails2();
            if (StatusLabel.Text.Equals("Upload status: File uploaded!") && StatusLabel2.Text.Equals("Upload status: File uploaded!"))
            {
                SqlConnection con = null;
                try
                {
                    String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["HRConnection"].ConnectionString;
                    con = new SqlConnection(strConnString);
                    SqlCommand cmd = new SqlCommand("form_insert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    DataTable personal = getDatatablePersonal();
                    DataTable document = getDatatableDocument();
                    cmd.Parameters.AddWithValue("@personal", personal).SqlDbType = SqlDbType.Structured;
                    cmd.Parameters.AddWithValue("@document", document).SqlDbType = SqlDbType.Structured;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertError", "alertError(\"Please upload Photo and Resume also\" );", true);
            }
        }
        private void SaveDetails2()
        {
            DataTable dt = getDatatableDocument();
            DataRow dr = dt.NewRow();

            dr["ApplicantId"] = txtId.Text;


            dr["Photo"] = ViewState["image"] != null ? ViewState["image"].ToString() : "";
            dr["Resume"] = ViewState["resume"] != null ? ViewState["resume"].ToString() : "";
            dr["Date"] = txtDate.Text;


            dt.Rows.Add(dr);
            ViewState["dtDocument"] = dt;
        }
        private void SaveDetails1()
        {
            DataTable dt = getDatatablePersonal();
            DataRow dr = dt.NewRow();

            dr["ApplicantId"] = txtId.Text;


            dr["Fname"] = FirstName.Text;
            dr["Mname"] = txtMiddle.Text;
            dr["Lname"] = LastName.Text;
            dr["Dob"] = DOB.Text;
            dr["Gender"] = male.Checked ? "Male" : "Female";
            dr["Nationality"] = Nationality.Text;

            dr["Houseno"] = AddHouse.Text;
            dr["Lane"] = AddLane.Text;
            dr["Street"] = AddStreet.Text;
            dr["City"] = AddCity.Text;
            dr["State"] = AddState.SelectedItem.Text;
            dr["Country"] = AddCountry.SelectedItem.Text;
            dr["Pincode"] = AddPin.Text;
            dr["Phno"] = AddPhone.Text;
            dr["Mobno"] = AddMobile.Text;
            dr["PrEmail"] = AddEmail.Text;
            dr["AltEmail"] = AddAlterEmail.Text;
            dr["Teachstatus"] = DropDownStatus.SelectedItem.Text;
            dr["Postapplied"] = PostAppliedForTeach.SelectedItem.Text;
            dr["Area"] = InterestArea.SelectedItem.Text;
            dr["Otherarea"] = InterestAreaOther.Text;
            dr["Specialization"] = Specialization.Text;
            dr["Totalexperience"] = (!TotalExperience.Text.Trim().Equals("")) ? float.Parse(TotalExperience.Text.Trim()).ToString() : "";

            dr["Date"] = txtDate.Text;
            dr["Status"] = "Not Viewed";



            dt.Rows.Add(dr);
            ViewState["dtPersonal"] = dt;

        }
        private DataTable getDatatablePersonal()
        {
            DataTable d1;
            if (ViewState["dtPersonal"] != null)
            {
                d1 = (DataTable)ViewState["dtPersonal"];
            }
            else
            {
                d1 = CreateDatatablePersonal();
            }
            return d1;
        }
        private DataTable getDatatableDocument()
        {

            DataTable d1;
            if (ViewState["dtDocument"] != null)
            {
                d1 = (DataTable)ViewState["dtDocument"];
            }
            else
            {
                d1 = CreateDatatableDocument();
            }
            return d1;
        }
        private DataTable CreateDatatablePersonal()
        {
            DataTable dt = new DataTable();
            dt.TableName = "Entries";
            dt.Columns.Add(new DataColumn("ApplicantId", typeof(string)));


            dt.Columns.Add(new DataColumn("Fname", typeof(string)));
            dt.Columns.Add(new DataColumn("Mname", typeof(string)));
            dt.Columns.Add(new DataColumn("Lname", typeof(string)));
            dt.Columns.Add(new DataColumn("Dob", typeof(string)));
            dt.Columns.Add(new DataColumn("Gender", typeof(string)));
            dt.Columns.Add(new DataColumn("Nationality", typeof(string)));
            dt.Columns.Add(new DataColumn("Houseno", typeof(string)));
            dt.Columns.Add(new DataColumn("Lane", typeof(string)));

            dt.Columns.Add(new DataColumn("Street", typeof(string)));
            dt.Columns.Add(new DataColumn("City", typeof(string)));
            dt.Columns.Add(new DataColumn("State", typeof(string)));
            dt.Columns.Add(new DataColumn("Country", typeof(string)));
            dt.Columns.Add(new DataColumn("Pincode", typeof(string)));
            dt.Columns.Add(new DataColumn("Phno", typeof(string)));

            dt.Columns.Add(new DataColumn("Mobno", typeof(string)));
            dt.Columns.Add(new DataColumn("PrEmail", typeof(string)));
            dt.Columns.Add(new DataColumn("AltEmail", typeof(string)));
            dt.Columns.Add(new DataColumn("Teachstatus", typeof(string)));

            dt.Columns.Add(new DataColumn("Postapplied", typeof(string)));
            dt.Columns.Add(new DataColumn("Area", typeof(string)));
            dt.Columns.Add(new DataColumn("Otherarea", typeof(string)));
            dt.Columns.Add(new DataColumn("Specialization", typeof(string)));
            dt.Columns.Add(new DataColumn("Totalexperience", typeof(float)));
            dt.Columns.Add(new DataColumn("Date", typeof(string)));
            dt.Columns.Add(new DataColumn("Status", typeof(string)));

            ViewState["dtPersonal"] = dt;
            return dt;
        }
        private DataTable CreateDatatableDocument()
        {
            DataTable dt = new DataTable();
            dt.TableName = "Entries";
            dt.Columns.Add(new DataColumn("ApplicantId", typeof(string)));


            dt.Columns.Add(new DataColumn("Photo", typeof(string)));
            dt.Columns.Add(new DataColumn("Resume", typeof(string)));

            dt.Columns.Add(new DataColumn("Date", typeof(string)));
            ViewState["dtDocument"] = dt;
            return dt;
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    if (FileUpload1.PostedFile.ContentType == "image/jpeg" || FileUpload1.PostedFile.ContentType == "image/png" || FileUpload1.PostedFile.ContentType == "image/gif")
                    {
                        if (FileUpload1.PostedFile.ContentLength < 10240000)
                        {
                            string extension = Path.GetExtension(FileUpload1.FileName);
                            string strDestPath = Server.MapPath("~/Documents/images/");
                            FileUpload1.SaveAs(strDestPath + txtId.Text + txtDate.Text + extension);
                            StatusLabel.Text = "Upload status: File uploaded!";
                            ViewState["image"] = strDestPath + txtId.Text + txtDate.Text + extension;

                        }
                        else
                            StatusLabel.Text = "Upload status: The file has to be less than 10 Mb!";
                    }
                    else
                        StatusLabel.Text = "Upload status: Only image files are accepted!";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }
        protected void UploadButton_Click2(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    if (FileUploadControl.PostedFile.ContentType == "application/doc" || FileUploadControl.PostedFile.ContentType == "application/docx" || FileUploadControl.PostedFile.ContentType == "application/pdf")
                    {
                        if (FileUploadControl.PostedFile.ContentLength < 10240000)
                        {
                            string extension = Path.GetExtension(FileUploadControl.FileName);
                            string strDestPath = Server.MapPath("~/Documents/resume/");
                            FileUploadControl.SaveAs(strDestPath + txtId.Text + txtDate.Text + extension);
                            StatusLabel2.Text = "Upload status: File uploaded!";
                            ViewState["resume"] = strDestPath + txtId.Text + txtDate.Text + extension;

                        }
                        else
                            StatusLabel2.Text = "Upload status: The file has to be less than 10 Mb!";
                    }
                    else
                        StatusLabel2.Text = "Upload status: Only pdf,word files are accepted!";
                }
                catch (Exception ex)
                {
                    StatusLabel2.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }
    }
}