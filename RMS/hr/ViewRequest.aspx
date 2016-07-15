<%@ Page Title="" Language="C#" MasterPageFile="~/rms.Master" AutoEventWireup="true" CodeBehind="ViewRequest.aspx.cs" Inherits="RMS.hr.ViewRequet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="menu-section">
        <div class="container">

            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a class="menu-top-active" href="ViewRequest.aspx">View Requests</a></li>
                            <li><a id="passwd" runat="server" href="#">Change Password</a></li>
                            <li><a id="userAdd" runat="server" href="#">Add User</a></li>
                            <li><a href="/login.aspx">Logout</a></li>
                        </ul>

                    </div>
                </div>
            </div>

        </div>
    </section>
    <div class="content-wrapper">
        <div class="container">
            <form runat="server">
                <div class="row">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                </div>
                <div id="content" class="row well">
                    <asp:SqlDataSource ID="sqlDsSubCategories" runat="server"
                        ConnectionString="<%$ ConnectionStrings:HRConnection %>"></asp:SqlDataSource>

                    <fieldset>
                        <legend>Settings</legend>
                        <div class="row">
                            <div class="row">
                                <div class="col-md-2">Applicant Id</div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtApplicantid" runat="server" Width="90%"></asp:TextBox>
                                </div>
                                <div class="col-md-2">Applicant Name</div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtApplicantname" runat="server" Width="100%"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">Post Applied</div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="DropPostApplied" runat="server" Width="90%">
                                        <asp:ListItem Value="%%">All</asp:ListItem>
                                        <asp:ListItem Value="Professor">Professor</asp:ListItem>
                                        <asp:ListItem Value="Associate Professor">Associate Professor</asp:ListItem>
                                        <asp:ListItem Value="Assistant Professor">Assistant Professor</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2">Teach Status</div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="DropTeachStatus" runat="server" Width="100%">
                                        <asp:ListItem Value="%%">All</asp:ListItem>
                                        <asp:ListItem Value="Currently Teaching">Currently Teaching</asp:ListItem>
                                        <asp:ListItem Value="Non Teaching">Non Teaching</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">Sort By</div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="DropSortBy" runat="server" Width="90%">
                                        <asp:ListItem Value="Fname">Applicant Name</asp:ListItem>
                                        <asp:ListItem Value="Totalexperience DESC">Total Experience</asp:ListItem>
                                        <asp:ListItem Value="Sortdate DESC">Date</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2">&nbsp;Date</div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="col-md-4">
                                            From
                                        </div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Width="100%"></asp:TextBox>

                                            <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" Format="yyyy-MM-dd" BehaviorID="TextBox2_CalendarExtender" TargetControlID="TextBox2" />

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            To                           
                                        </div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Width="100%"></asp:TextBox>

                                            <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" Format="yyyy-MM-dd" runat="server" BehaviorID="TextBox3_CalendarExtender" TargetControlID="TextBox3" />

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button ID="Button1" runat="server" Height="31px" Style="margin-left: 0px" Text="Submit" CssClass="pull-right" Width="98px" OnClick="Button1_Click" />
                                </div>
                                <div class="col-md-6">
                                    <asp:Button ID="Button3" runat="server" Height="31px" Style="margin-left: 0px" Text="Reset" Width="98px" OnClick="Button3_Click" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="row well">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <asp:GridView Width="100%" Height="1000%" AllowPaging="True" ID="gvSubCategories"
                                AutoGenerateColumns="False"
                                GridLines="None"
                                PagerStyle-CssClass="pgr"
                                DataSourceID="sqlDsSubCategories"
                                CssClass="mGrid"
                                runat="server"
                                ShowHeader="True"
                                DataKeyNames="ApplicantId,Date,Path,Path2"
                                PageSize="5" OnRowCreated="gvSubCategories_RowCreated" OnPageIndexChanging="gridView_PageIndexChanging" OnRowCommand="gridMembersList_RowCommand">
                                <Columns>


                                    <asp:TemplateField>
                                        <ItemStyle Width="100%" />

                                        <ItemTemplate>


                                            <asp:Panel ID="pnlSubCategories" runat="server">

                                                <div class="well">
                                                    <div class="row">
                                                        <div class="col-md-1">

                                                            <asp:Image ID="imgCollapsible" Style="margin-right: 5px;" runat="server" src="/assets/img/close.gif" />
                                                        </div>


                                                        <div class="col-md-1"><span><%#Eval("Applicantid")%></span></div>
                                                        <div class="col-md-2"><span><%#Eval("Fname")%></span><span> <%#Eval("Lname")%></span></div>
                                                        <div class="col-md-2"><span><%#Eval("Area")%></span></div>
                                                        <div class="col-md-2"><span><%#Eval("Postapplied")%></span></div>
                                                        <div class="col-md-1"><span><%#Eval("Totalexperience")%></span></div>
                                                        <div class="col-md-2"><span><%#Eval("Date")%></span></div>
                                                        <div class="col-md-1"><span><%#Eval("Status")%></span><span></span></div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-12">
                                                            <asp:LinkButton ID="b2" CssClass="pull-left" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Resume" runat="server" Text="Download Resume" />
                                                        </div>

                                                    </div>
                                                </div>


                                            </asp:Panel>
                                            <asp:Panel ID="pnlProducts" runat="server"
                                                Width="75%" Height="100%"
                                                Style="margin-left: 20px; margin-right: 20px; height: 0px; overflow: hidden;">
                                                <div class="well">
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="row">

                                                                <div class="col-md-12">

                                                                    <asp:Image ID="Img" Style="margin-right: 5px; width: 150px; height: 150px" BorderWidth="1px" runat="server" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="row">
                                                                <div class="col-md-6"><span>Gender :</span></div>

                                                                <div class="col-md-6"><span><%#Eval("Gender")%></span></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6"><span>DOB :</span></div>

                                                                <div class="col-md-6"><span><%#Eval("Dob")%></span></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6"><span>Specialization :</span></div>
                                                                <div class="col-md-6"><span><%#Eval("Specialization")%></span></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6"><span>Mob. :</span></div>
                                                                <div class="col-md-6"><span><%#Eval("Mobno")%></span></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6"><span>E-mail :</span></div>
                                                                <div class="col-md-6"><span><%#Eval("PrEmail")%></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>





                                            </asp:Panel>
                                            <ajaxToolkit:CollapsiblePanelExtender
                                                ID="ctlCollapsiblePanel"
                                                runat="Server"
                                                TargetControlID="pnlProducts"
                                                CollapsedSize="0" Collapsed="True"
                                                ExpandControlID="pnlSubCategories"
                                                CollapseControlID="pnlSubCategories"
                                                AutoCollapse="False" AutoExpand="False"
                                                ScrollContents="false"
                                                ImageControlID="imgCollapsible"
                                                ExpandedImage="/assets/img/close.gif"
                                                CollapsedImage="/assets/img/expand.gif"
                                                ExpandDirection="Vertical" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings PageButtonCount="40" />
                                <PagerStyle CssClass="pgr" />
                            </asp:GridView>

                        </ContentTemplate>

                    </asp:UpdatePanel>
                </div>
                <div class="row">
                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
                        PopupControlID="pnlPopup" TargetControlID="passwd" BackgroundCssClass="modalBackground" CancelControlID="btnHide">
                    </ajaxToolkit:ModalPopupExtender>
                    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                        <div class="header">
                            Change Password
                        </div>
                        <div class="body">
                            <iframe  style="width: 100%; height: 100%;"  id="irm1" src="ChangePassword.aspx"></iframe>
                            <br />
                        </div>
                        <div class="footer" align="right">

                            <asp:Button ID="btnHide" runat="server" Text="Close" CssClass="yes" />
                            
                        </div>
                    </asp:Panel>
                </div>
                <div class="row">
                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" BehaviorID="mpe1" runat="server"
                        PopupControlID="Panel1" TargetControlID="userAdd" BackgroundCssClass="modalBackground" CancelControlID="button2">
                    </ajaxToolkit:ModalPopupExtender>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none">
                        <div class="header">
                            Add user
                        </div>
                        <div class="body">
                            <iframe  style="width: 100%; height: 100%;"  onload="resizeIframe(this)" id="irm2" src="UserAdd.aspx"></iframe>
                            <br />
                        </div>
                        <div class="footer" align="right">

                            <asp:Button ID="Button2" runat="server" Text="Close" CssClass="yes" />
                            
                        </div>
                    </asp:Panel>
                </div>
            </form>

        </div>

    </div>

</asp:Content>
