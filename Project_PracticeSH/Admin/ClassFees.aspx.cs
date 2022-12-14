using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using static Project_PracticeSH.Models.CommonFn;

namespace Project_PracticeSH.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetFees();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class"); // RadioButtonList1.DataSource = CreateDataSource();
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName"; // Class 테이블의 원본 필드
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");
            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classVal = ddlClass.SelectedItem.Text;
                DataTable dt = fn.Fetch("select * from Fees where Classid = '" + ddlClass.SelectedItem.Value + "' "); // gridview에 data 불러들이기.
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Fees values('" +ddlClass.SelectedItem.Value+ "','"+textFeeAmounts.Text.Trim()+"')"; 
                    fn.Query(query);
                    IblMsg.Text = "정상적으로 추가됐습니다!";
                    IblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    textFeeAmounts.Text = string.Empty;
                    GetFees();
                }
                else
                {
                    IblMsg.Text = "이미 동일한 데이터가 존재합니다.";
                    IblMsg.CssClass = "alert alert-success";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }
        private void GetFees()
        {
            DataTable dt = fn.Fetch(@"select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], f.FeesId, f.ClassId, c.ClassName, f.FeesAmount from Fees f inner join Class c on c.ClassId = f.ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetFees();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetFees();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int feesId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Fees where FeesId = '"+feesId+"' ");
                IblMsg.Text = "삭제됐습니다.";
                IblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetFees();
                    
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetFees();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int feesId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string feeAmt = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Fees set FeesAmount = '"+feeAmt.Trim()+"' where FeesId = '"+feesId+"' " );
                IblMsg.Text = "금액이 업데이트 됐습니다.";
                IblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetFees();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }
    }
}