using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace KecHR.hr
{
    public partial class DownloadResume : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Path"]!=null)
            {
                try
                {
                    string filePath = Server.MapPath(Session["Path"].ToString().Substring(Session["Path"].ToString().IndexOf("Documents"))).Replace("\\hr", "");
                    FileInfo file = new FileInfo(filePath);
                    if (file.Exists)
                    {
                        Response.ClearContent();
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                        Response.AddHeader("Content-Length", file.Length.ToString());
                        Response.ContentType = "text/plain";
                        Response.TransmitFile(file.FullName);
                        Response.End();
                    }
                    else
                    {
                        Response.Write("File at location " + file.FullName + " does not exist");
                    }
                }
                catch(Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}