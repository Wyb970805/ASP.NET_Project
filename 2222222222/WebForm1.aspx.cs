using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace _2222222222
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = Global.CS;

        CommentDBDataContext db = new CommentDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string sql = "SELECT commentID, userID, content, commentDate FROM Comment";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                // Data binding
                gvComment.DataSource = dr;
                gvComment.DataBind();

                dr.Close();
                con.Close();
            }
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            int id = 1;
            if (Page.IsValid)
            {
                string recipeID = "R0001";
                string user = "ABC01";

                do
                {
                    id = id + 1;

                } while (db.Comments.Any(c => c.commentID == id));

                //string userID = Request.QueryString["userID"] ?? "";
                //Request.QueryString["recipeID"].ToString()

                string sql = @"INSERT INTO Comment(commentID, recipeID, userID, content, commentDate) 
                               VALUES (@commentID, @recipeID, @userID, @content, @commentDate)";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@commentID", id);
                cmd.Parameters.AddWithValue("@recipeID", recipeID);
                cmd.Parameters.AddWithValue("@userID", user);
                cmd.Parameters.AddWithValue("@content", txtContent.Text);
                cmd.Parameters.AddWithValue("@commentDate", DateTime.Now.ToString("MM/dd/yyyy hh:mm tt"));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("WebForm1.aspx");
            }
        }

        protected void btnReply_Click(object sender, EventArgs e)
        {
            //Request.QueryString["User_name"].ToString()
            int id = 1;

            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            Label lblCommentID = (Label)row.FindControl("lblCommentID");
            TextBox txtReplyToComment = (TextBox)row.FindControl("txtReply");

            string user = "ABC01";
            if (txtReplyToComment != null)
            {
                do
                {
                    id = id + 1;

                } while (db.Replies.Any(r => r.replyID == id));

                string sql = @"INSERT INTO Reply(replyID, commentID, userID, content, replyDate) 
                               VALUES (@replyID, @commentID, @userID, @content, @replyDate)";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@userID", user);
                cmd.Parameters.AddWithValue("@commentID", lblCommentID.Text);
                cmd.Parameters.AddWithValue("@content", txtReplyToComment.Text);
                cmd.Parameters.AddWithValue("@replyID", id);
                cmd.Parameters.AddWithValue("@replyDate", DateTime.Now.ToString("MM/dd/yyyy hh:mm tt"));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("WebForm1.aspx");
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string commentID = gvComment.DataKeys[e.Row.RowIndex].Value.ToString();
                GridView gvReply = e.Row.FindControl("gvReply") as GridView;

                string sql = string.Format("SELECT * FROM Reply WHERE commentID='{0}'", commentID);

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                gvReply.DataSource = dr;
                gvReply.DataBind();

                dr.Close();
                con.Close();
            }
        }
    }
}