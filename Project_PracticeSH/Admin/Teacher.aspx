<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="Project_PracticeSH.Admin.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .col-md-6-margin {
            margin-left : 20px;
            margin-top : 20px;
            }

        .table#ContentPlaceHolder1_GridView1 {
            min-width : 725px;
        }
    </style>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {

                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수
                    var dong = '';

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.jibunAddress;

                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;

                    }

                    dong = data.bname;
                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if (data.userSelectedType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    // document.getElementById("ContentPlaceHolder1_WUC_BizCompanyReg_sample6_postcode").value = data.postcode; //6자리 우편번호 사용
                    document.getElementById("<%= textAddress.ClientID %>").value = fullAddr;

                    // 커서를 상세주소 필드로 이동한다.
                }
            }).open();
        }
    </script>
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
                    <label for="textName">이름</label>
                        <asp:TextBox ID="textName" runat="server" CssClass="form-control" placeholder="값을 입력해주세요." 
                        required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="이름을 입력해주세요." 
                        ForeColor="Red" ValidationExpression="^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="textName">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="col-md-6">
                    <label for="textDOB">생일</label>
                    <asp:TextBox ID="textDOB" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                     <label for="ddlGender">성별</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">성별</asp:ListItem>
                        <asp:ListItem>남성</asp:ListItem>
                        <asp:ListItem>여성</asp:ListItem>
                        </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="성별을 고르시오."
                        ForeColor="Red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true" InitialValue="성별"></asp:RequiredFieldValidator>
                    </div>

                <div class="col-md-6">
                    <label for="textMobile">번호</label>
                    <asp:TextBox ID="textMobile" runat="server" CssClass="form-control" placeholder="휴대폰 번호를 입력해주세요." TextMode="Number" required>
                    </asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="휴대폰 번호를 입력해주세요."
                        ForeColor="Red" ValidationExpression="^[0-9]{11}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="textMobile">
                    </asp:RegularExpressionValidator>
                </div>
            </div>

             <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">  
                    <div class="col-md-6">
                        <label for="textEmail">이메일</label>
                            <asp:TextBox ID="textEmail" runat="server" CssClass="form-control" placeholder="이메일을 입력해주세요." TextMode="Email"
                            required></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="txtPassword">비밀번호</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="비밀번호를 입력해주세요" TextMode="Password" required></asp:TextBox>
                    </div>
                </div>

                     <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">  
                    <div class="col-md-12">
                        <label for="textAddress">주소</label>
                        <input type="button" id="btnpost" onclick="sample6_execDaumPostcode(); " value="우편번호 찾기" style="width:145px; margin-bottom:10px;" class="btn btn-primary btn-block">
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
                    <asp:GridView class="tableview" ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText ="데이터가 없습니다." 
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
