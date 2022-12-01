<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="Project_PracticeSH.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="background-image:url('')" class="auto-style1">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="IblMsg" runat="server"></asp:Label>
            </div>
                <h3 class="text-center"> 새로운 추가</h3>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                
                <div class="col-md-6">
                    <label for="textClass"> 학급 </label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="필수 값 필요" 
                        ControlToValidate="ddlClass" Display="Dynamic" Font-Bold="True" ForeColor="#CC3300" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            
                <div class="col-md-6">
                    <label for="textClass"> 학급 이름 </label>
                    <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="학급 이름을 입력해주세요" required></asp:TextBox>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="추가" OnClick="btnAdd_Click"/>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
