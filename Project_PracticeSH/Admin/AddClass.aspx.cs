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
    public partial class AddClass : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack )
            {
                GetClass(); 
            }
        }
        private void GetClass()
        {
            DataTable dt = fn.Fetch("select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], ClassId, ClassName from Class");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("select * from Class where ClassName = '"+txtClass.Text.Trim()+"' ");
                if ( dt.Rows.Count == 0 )
                {
                    string query = "Insert into Class values('" + txtClass.Text.Trim() + "')";
                    fn.Query(query);
                    IblMsg.Text = "정상적으로 추가됐습니다!";
                    IblMsg.CssClass = "alert alert-success";
                    txtClass.Text = string.Empty;
                    GetClass();
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
    }
}