using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Project_PracticeSH.Models.CommonFn;

namespace Project_PracticeSH.Admin
{
    public partial class Teacher : System.Web.UI.Page
    {

        CommonFnx fn = new CommonFnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTeachers();
            }
        }

        private void GetTeachers()
        {
            DataTable dt = fn.Fetch(@"SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) as [Sr.No], TeacherId, [Name], DOB, Gender, Mobile, Email, [Address], [Password] from Teacher");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {4t
            try
            {
                if( ddlGender.SelectedValue != "0" ) // 성별값이 입력되지 않았을 경우 (기본값 0)
                {
                    string email = textEmail.Text.Trim();
                    DataTable dt = fn.Fetch("SELECT * FROM Teacher WHERE Eamil = '"+email+"' ");
                    if ( dt.Rows.Count == 0 )
                    {
                        string query = "INSERT INTO Teacher VALUES ('" + textName.Text.Trim() + "', '" + textDoB.Text.Trim() + "', '" +
                            ddlGender.SelectedValue + "', '" + textMobile.Text.Trim() + "', '" + textEmail.Text.Trim() + "', '" +
                            textAddress.Text.Trim() + "', '" + txtPassword.Text.Trim() + "')";
                        fn.Query(query);
                        IblMsg.Text = "정상적으로 추가됐습니다!";
                        IblMsg.CssClass = "alert alert-success";
                        ddlGender.SelectedIndex = 0;
                        textName.Text = string.Empty;
                        textDoB.Text = string.Empty;
                        textMobile.Text = string.Empty;
                        textEmail.Text = string.Empty;
                        textAddress.Text = string.Empty;
                        txtPassword.Text = string.Empty;
                        GetTeachers();
                    }
                    else
                    {
                        IblMsg.Text = "이미 동일한 <b>'" + email + "' <br> 존재합니다.";
                        IblMsg.CssClass = "alert alert-stextSubjectuccess";

                    }
                }
                else
                {
                    IblMsg.Text = "성별이 입력되지 않았습니다.";
                    IblMsg.CssClass = "alert alert-danger";
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetTeachers();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeachers();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetTeachers();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int teacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("textName") as TextBox).Text;
                string mobile = (row.FindControl("textMobile") as TextBox).Text;
                string password = (row.FindControl("txtPassword") as TextBox).Text;
                string address = (row.FindControl("textAddress") as TextBox).Text;
                fn.Query("Update Teacher set Name = '" + name.Trim() + "', Mobile = '" + mobile.Trim() + "', Address = '" + address.Trim() + "', Password = '" + 
                    password.Trim() + "' where TeacherId = '" + teacherId + "' ");
                IblMsg.Text = "과제가 업데이트 됐습니다.";
                IblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetTeachers();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int teacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Teacher where TeacherId = '" + teacherId + "' ");
                IblMsg.Text = "삭제됐습니다.";
                IblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetTeachers();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");

            }
        }
    }
}