<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Project_PracticeSH.Admin.WebForm3" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "System.Data.SqlClient" %>

<script language="C#" runat="server">


    void Page_Load()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolCS"].ConnectionString);
        conn.Open();

        string query = "select * from Class ORDER BY ClassId DESC";
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        // DB연동작업 끝
        conn.Close();

        rpt1.DataSource = ds.Tables[0];
        rpt1.DataBind();
    }


</script>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link href="../Content/WebForm3.css?a" rel="stylesheet" />
        <script src="../Scripts/jquery-3.0.0.js"></script>




    <div class="main-content">

                <table>
                    <tr>
                        <th height="25">고유 번호</th>
                        <th height="25">반 이름</th>
                    </tr>
                        <asp:Repeater ID="rpt1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                    <tr>
                        <td height="25"><%# Eval("ClassId") %></td>
                        <td height="25"><%# Eval("ClassName") %></td>
                    </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                </table>    

    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" 
                       SelectCommand="select * from [Class] ORDER BY ClassId DESC"></asp:SqlDataSource>

</asp:Content>
