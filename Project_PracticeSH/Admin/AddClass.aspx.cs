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

        }
        private void GetClass()
        {
            DataTable dt = fn.Fetch("select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], ClassId, ClassName from Class");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }
    }
}