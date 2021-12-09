using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace _2222222222
{
    public partial class Reply1 : System.Web.UI.Page
    {
        string cs = Global.CS; 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string sql = "SELECT replyID, userID, content, replyDate FROM Reply";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                //Data binding
                gvReply.DataSource = dr;
                gvReply.DataBind();

                dr.Close();
                con.Close();
            }
        }
    }
}