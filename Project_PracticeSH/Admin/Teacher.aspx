<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="Project_PracticeSH.Admin.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="background-image:url('')" class="auto-style1">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="IblMsg" runat="server"></asp:Label>
            </div>
                <h3 class="text-center"> 교수 추가 </h3>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">  
                <div class="col-md-6">
                    <label for="textClass">이름</label>
                        <asp:TextBox ID="textName" runat="server" CssClass="form-control" placeholder="값을 입력해주세요." 
                        required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="이름을 꼭 입력해주세요." 
                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="textName">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="col-md-6">
                    <label for="textDoB">생일</label>
                    <asp:TextBox ID="textDoB" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
                </div>
            </div>

            <div class="col-md-6">
                    <label for="ddlGender">성별</label>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Value="0">성별</asp:ListItem>
                    <asp:ListItem>남성</asp:ListItem>
                    <asp:ListItem>여성</asp:ListItem>
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="성별을 고르시오."
                    ForeColor="Red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true" InitialValue="성별"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="textMobile">번호</label>
                    <asp:TextBox ID="textMobile" runat="server" CssClass="form-control" TextMode="Number" placeholer="휴대폰 번호" required>
                    </asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="휴대폰 번호를 입력해주세요." 
                        ForeColor="Red" ValidationExpression="^[0-9]{11}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="textMobile">
                         </asp:RegularExpressionValidator>
                </div>
            </div>

             <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">  
                    <div class="col-md-6">
                        <label for="textEmail">이메일</label>
                            <asp:TextBox ID="textEmail" runat="server" CssClass="form-control" placeholder="이메일을 입력해주세요." 
                            required></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="txtPassword">비밀번호</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="비밀번호를 입력해주세요" required></asp:TextBox>
                    </div>
                </div>

                     <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">  
                    <div class="col-md-12">
                        <label for="textAddress">주소</label>
                            <asp:TextBox ID="textAddress" runat="server" CssClass="form-control" placeholder="주소를 입력해주세요." TextMode="MultiLine"
                            required></asp:TextBox>
                    </div>
                </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#3CB371" Text="교수 추가" OnClick="btnAdd_Click"/>
                </div>
            </div>

    <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText ="데이터가 없습니다." 
                        AutoGenerateColumns="False" PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="TeacherId"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="번호" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="이름">
                                <EditItemTemplate>
                                    <asp:TextBox ID="textName" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control"
                                        width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="IblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="휴대폰">
                                <EditItemTemplate>
                                    <asp:TextBox ID="textMobile" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control"
                                        width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="IblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="이메일">
                                <ItemTemplate>
                                    <asp:Label ID="IblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="비밀번호">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control"
                                        width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="IblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="주소">
                                <EditItemTemplate>
                                    <asp:TextBox ID="textAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control"
                                        width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="IblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:CommandField CausesValidation="false" HeaderText="관리" ShowEditButton="True" ShowDeleteButton="true">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle BackColor="#3CB371" ForeColor="white"/>
                    </asp:GridView>   


</asp:Content>
