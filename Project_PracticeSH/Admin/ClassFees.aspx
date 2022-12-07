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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="필수 값 필요" DataKeyNames="FeesId"
                        ControlToValidate="ddlClass" Display="Dynamic" Font-Bold="True" ForeColor="#CC3300" InitialValue="Select Class" 
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            
                <div class="col-md-6">
                    <label for="textFeeAmounts">관리비</label>
                    <asp:TextBox ID="textFeeAmounts" runat="server" CssClass="form-control" placeholder="값을 입력해주세요." 
                        TextMode="Number" required></asp:TextBox>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#3CB371" Text="추가" OnClick="btnAdd_Click"/>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText ="데이터가 없습니다." 
                        AutoGenerateColumns="False" PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="FeesId"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="번호" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ClassName" HeaderText="학급" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="관리비">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("FeesAmount") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FeesAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="false" HeaderText="관리" ShowDeleteButton="True" ShowEditButton="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle BackColor="#3CB371" ForeColor="white"/>
                    </asp:GridView>    
                    </asp:Content>
