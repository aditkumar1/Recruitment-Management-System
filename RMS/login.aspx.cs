using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RMS
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            string[] keys = Request.Form.AllKeys;
            if (keys!=null&&keys.Length>=2)
            {
                String json="";
                String url = authenticateUser(Request.Form[keys[0]], Request.Form[keys[1]]);
                if (url!=null&&!url.Equals(""))
                {
                    json = "{\"success\":\""+url+"\"}";
                }
                else
                {
                    json = "{\"error\":\"User credential does not match. Please try again\"}";
                }
                Response.Clear();
                Response.ContentType = "application/json; charset=utf-8";
                Response.Write(json);
                Response.End();
            }
            Response.Redirect("~/default.aspx");              
        }
        protected String authenticateUser(String user, String password)
        {
            Boolean Auth = false;
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["HRConnection"].ConnectionString;//"Server=SANGEETA-PC\\SQLEXPRESS;initial catalog=store;integrated security=yes;";
            String role = "";
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Userid,Password,Role from UserDetailsMain where Userid='" + user+"'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr["Password"].ToString().Equals(password))
                {
                    role = dr["Role"].ToString().Trim();
                    Auth = true;
                    break;
                }

            }
            con.Close();
            con.Dispose();
            if (Auth && !role.Equals(""))
            {
                return getRedirectURL(user, role);
            }
            else
            {
                return null;
            }

        }
        private string getRedirectURL(String user,String role)
        {
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,user, DateTime.Now, DateTime.Now.AddHours(24), true, role, FormsAuthentication.FormsCookiePath);
            string hash = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

            if (ticket.IsPersistent)
            {
                cookie.Expires = ticket.Expiration;
            }
            Response.Cookies.Add(cookie);
            string returnUrl = Request.QueryString["ReturnUrl"] as string;

            if (returnUrl != null)
            {
                Response.Redirect(returnUrl);
            }
            else
            {
                if (role.Equals("HR"))
                {
                    return Page.ResolveClientUrl("~/hr/ViewRequest.aspx");
                    
                }

                else
                {
                    return Page.ResolveClientUrl("~/default.aspx");
                }
            }
            return null;
        }
    }
}