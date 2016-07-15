<%@ Page Title="" Language="C#" MasterPageFile="~/rms.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="RMS._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a class="menu-top-active" href="default.aspx">Register</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#login-modal">Staff Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="loginmodal-container">
                            <h1 id="status_message">Staff Login</h1>
                            <br>
                            <form id="login_form" method="post" action="login.aspx">
                                <input type="text" name="user" placeholder="Username">
                                <input type="password" name="pass" placeholder="Password">
                                <input id="submit-button" type="submit" name="login" class="login loginmodal-submit" value="Login">
                                <input type="button" name="login" class="login loginmodal-close" onclick="$(this).parents().eq(3).modal('hide');" value="Close">  
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Fill in the details below</h4>
                </div>

            </div>
            <div class="row">
                <div class="col-md-12 alert alert-danger">
                    Please do not use special characters, like ('',"",|,! and etc) while filling up the form.                    
                </div>
            </div>
            <div class="row">
                <form id="form1" runat="server" enctype="multipart/form-data" method="post">
                    <div class="well">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">Applicant Id:</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtId" runat="server" ReadOnly="true" Width="90%" BackColor="#999999" CssClass="style9" />
                            </div>
                            <div class="col-md-3">Date:</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtDate" runat="server" Width="90%" ReadOnly="true" BackColor="#999999" CssClass="style9" />
                            </div>
                        </div>

                        <div class="row" id="showteaching">
                            <div class="col-md-3">
                                <span style="color: #F00"
                                    class="style10">*</span><span>Post Applied for:</span>
                            </div>

                            <div class="col-md-3">
                                <asp:DropDownList ID="PostAppliedForTeach" runat="server" Style="width: 90%;"
                                    CssClass="style9">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem>Professor</asp:ListItem>
                                    <asp:ListItem>Associate Professor</asp:ListItem>
                                    <asp:ListItem>Assistant Professor</asp:ListItem>
                                    <asp:ListItem>Head of Department</asp:ListItem>
                                    <asp:ListItem>Chief Hostel Warden</asp:ListItem>
                                    <asp:ListItem>Aptitude Trainer</asp:ListItem>
                                    <asp:ListItem>Deputy Placement Officer</asp:ListItem>
                                    <asp:ListItem>Sports Officer</asp:ListItem>
                                    <asp:ListItem>Physical Education Instructor</asp:ListItem>
                                    <asp:ListItem>Office Assistant </asp:ListItem>
                                    <asp:ListItem>Lab Instructor</asp:ListItem>
                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="PostAppliedForTeach" InitialValue="0" SetFocusOnError="True"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>

                            </div>
                            <div class="col-md-3">
                                <span style="color: #F00;" class="style10">*</span><span class="style8">Area:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="InterestArea" runat="server" Style="width: 90%;"
                                    CssClass="style9">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem>Engineering</asp:ListItem>
                                    <asp:ListItem>Applied Science</asp:ListItem>

                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="InterestArea" InitialValue="0" SetFocusOnError="True"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="row" id="myarea">
                            <div class="col-md-3">If Any Other Area:</div>
                            <div class="col-md-3">
                                <asp:TextBox ID="InterestAreaOther" runat="server"
                                    Text="" Width="90%" CssClass="style9" />
                            </div>
                            <div class="col-md-3">
                                <span style="color: #F00" class="style8">*</span>
                                <span class="style8">Specialization </span>

                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="Specialization" runat="server"
                                    Width="90%" CssClass="style9" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                    ControlToValidate="Specialization" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-3">
                                <span style="color: #F00" class="style8">*</span><span class="style8">Total no of Experience 
                                </span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="TotalExperience" runat="server" Width="90%"
                                    CssClass="style9" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                    ControlToValidate="TotalExperience" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3">
                                <span style="color: #F00" class="style8">*</span><span
                                    class="style8">Teach Status </span>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="DropDownStatus" runat="server"
                                    Style="width: 90%;" CssClass="style9">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem>Currently Teaching</asp:ListItem>
                                    <asp:ListItem>Non Teaching</asp:ListItem>

                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="DropDownStatus" InitialValue="0" SetFocusOnError="True"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                    </div>
                    <div class="well">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 align="left" class="style7">Personal Details </h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <span style="color: #F00"
                                    class="style10">*</span><span class="style8">First Name:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="FirstName" runat="server" CssClass="style8" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                    ControlToValidate="FirstName" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3">
                                Middle Name: 

                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtMiddle" runat="server" CssClass="style8" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <span style="color: #F00" class="style8">*</span><span
                                    class="style8">Last Name:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="LastName" runat="server" CssClass="style8" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                    ControlToValidate="LastName" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3">
                                <span style="color: #F00"
                                    class="style10">*</span><span class="style8">Date of Birth:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="DOB" runat="server"
                                    CssClass="style8" />
                                <ajaxToolkit:CalendarExtender ID="DOB_CalendarExtender" runat="server" BehaviorID="DOB_CalendarExtender" TargetControlID="DOB" Format="yyyy-MM-dd" />

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                                    ControlToValidate="DOB" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                                <br class="style8" />
                                <span class="style8">(YYYY-MM-DD)</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <span style="color: #F00"
                                    class="style10">*</span><span class="style8">Gender:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:RadioButton ID="male" Text="Male"
                                    Checked="true" runat="server" GroupName="gender" CssClass="style8" />
                                <span class="style8">&nbsp;&nbsp;&nbsp;
                                </span>
                                <asp:RadioButton ID="female" Text="Female" runat="server" GroupName="gender"
                                    CssClass="style8" />
                            </div>
                            <div class="col-md-3">
                                <span style="color: #F00" class="style10">*</span><span class="style8">Nationality:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="Nationality"
                                    runat="server" CssClass="style8" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                                    ControlToValidate="Nationality" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="well">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 align="left">Address for Correspondence </h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <span style="color: #F00"
                                    class="style10">*</span><span class="style8">House No.:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AddHouse" runat="server"
                                    TextMode="MultiLine" Width="90%" CssClass="style8" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
                                    ControlToValidate="AddHouse" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3">
                                <span style="color: #F00" class="style10">*</span><span class="style8">Lane:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AddLane"
                                    runat="server" TextMode="MultiLine" Width="90%" CssClass="style8" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                Street:
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AddStreet" runat="server"
                                    TextMode="MultiLine" Width="90%" CssClass="style8" />
                            </div>
                            <div class="col-md-3">
                                <span style="color: #F00" class="style10">*</span><span class="style8">City:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AddCity"
                                    runat="server" Width="90%" CssClass="style8" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                                    ControlToValidate="AddCity" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <span style="color: #F00"
                                    class="style10">*</span><span class="style8">State:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="AddState" runat="server"
                                    Style="font-family: Calibri; width: 90%" CssClass="style8">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                    <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Assam</asp:ListItem>
                                    <asp:ListItem>Bihar</asp:ListItem>
                                    <asp:ListItem>Chandigarh</asp:ListItem>
                                    <asp:ListItem>Chhattisgarh</asp:ListItem>
                                    <asp:ListItem>Dadar and Nagar Haveli</asp:ListItem>
                                    <asp:ListItem>Daman and Diu</asp:ListItem>
                                    <asp:ListItem>Goa</asp:ListItem>
                                    <asp:ListItem>Gujarat</asp:ListItem>
                                    <asp:ListItem>Haryana</asp:ListItem>
                                    <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                    <asp:ListItem>Jharkhand</asp:ListItem>
                                    <asp:ListItem>Karnataka</asp:ListItem>
                                    <asp:ListItem>Kerala</asp:ListItem>
                                    <asp:ListItem>Lakshwadeep</asp:ListItem>
                                    <asp:ListItem>Madya Pradesh</asp:ListItem>
                                    <asp:ListItem>Maharashtra</asp:ListItem>
                                    <asp:ListItem>Manipur</asp:ListItem>
                                    <asp:ListItem>Meghalaya</asp:ListItem>
                                    <asp:ListItem>Mizoram</asp:ListItem>
                                    <asp:ListItem>Nagaland</asp:ListItem>
                                    <asp:ListItem>New Delhi</asp:ListItem>
                                    <asp:ListItem>Orissa</asp:ListItem>
                                    <asp:ListItem>Pondicherry</asp:ListItem>
                                    <asp:ListItem>Punjab</asp:ListItem>
                                    <asp:ListItem>Rajasthan</asp:ListItem>
                                    <asp:ListItem>Sikkim</asp:ListItem>
                                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                                    <asp:ListItem>Tripura</asp:ListItem>
                                    <asp:ListItem>Uttarakhand</asp:ListItem>
                                    <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                    <asp:ListItem>West Bengal</asp:ListItem>
                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="AddState" InitialValue="0" SetFocusOnError="True"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>

                            </div>
                            <div class="col-md-3">
                                <span style="color: #F00" class="style10">*</span><span class="style8">Pin code:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AddPin"
                                    runat="server" Width="90%" CssClass="style8" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                                    ControlToValidate="AddPin" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <span style="color: #F00"
                                    class="style10">*</span><span class="style8">Country:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="AddCountry" runat="server"
                                    Style="font-family: Calibri; width: 90%" CssClass="style8">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem>Afghanistan</asp:ListItem>
                                    <asp:ListItem>Albania</asp:ListItem>
                                    <asp:ListItem>Argentina</asp:ListItem>
                                    <asp:ListItem>Australia</asp:ListItem>
                                    <asp:ListItem>Austria</asp:ListItem>
                                    <asp:ListItem>Bahamas</asp:ListItem>
                                    <asp:ListItem>Bahrain</asp:ListItem>
                                    <asp:ListItem>Bangladesh</asp:ListItem>
                                    <asp:ListItem>Belgium</asp:ListItem>
                                    <asp:ListItem>Bhutan</asp:ListItem>
                                    <asp:ListItem>Bolivia</asp:ListItem>
                                    <asp:ListItem>Brazil</asp:ListItem>
                                    <asp:ListItem>Bulgaria</asp:ListItem>
                                    <asp:ListItem>Cambodia</asp:ListItem>
                                    <asp:ListItem>Canada</asp:ListItem>
                                    <asp:ListItem>Central African Republic</asp:ListItem>
                                    <asp:ListItem>Chile</asp:ListItem>
                                    <asp:ListItem>China</asp:ListItem>
                                    <asp:ListItem>Colombia</asp:ListItem>
                                    <asp:ListItem>Costa Rica</asp:ListItem>
                                    <asp:ListItem>Croatia</asp:ListItem>
                                    <asp:ListItem>Cuba</asp:ListItem>
                                    <asp:ListItem>Cyprus</asp:ListItem>
                                    <asp:ListItem>Czech Republic</asp:ListItem>
                                    <asp:ListItem>Denmark</asp:ListItem>
                                    <asp:ListItem>Ecuador</asp:ListItem>
                                    <asp:ListItem>Egypt</asp:ListItem>
                                    <asp:ListItem>El Salvador</asp:ListItem>
                                    <asp:ListItem>England</asp:ListItem>
                                    <asp:ListItem>Fiji</asp:ListItem>
                                    <asp:ListItem>Finland</asp:ListItem>
                                    <asp:ListItem>France</asp:ListItem>
                                    <asp:ListItem>Georgia</asp:ListItem>
                                    <asp:ListItem>Germany</asp:ListItem>
                                    <asp:ListItem>Ghana</asp:ListItem>
                                    <asp:ListItem>Great Britain</asp:ListItem>
                                    <asp:ListItem>Greece</asp:ListItem>
                                    <asp:ListItem>Hungary</asp:ListItem>
                                    <asp:ListItem>Iceland</asp:ListItem>
                                    <asp:ListItem>India</asp:ListItem>
                                    <asp:ListItem>Indonesia</asp:ListItem>
                                    <asp:ListItem>Iran</asp:ListItem>
                                    <asp:ListItem>Iraq</asp:ListItem>
                                    <asp:ListItem>Ireland</asp:ListItem>
                                    <asp:ListItem>Israel</asp:ListItem>
                                    <asp:ListItem>Italy</asp:ListItem>
                                    <asp:ListItem>Jamaica</asp:ListItem>
                                    <asp:ListItem>Japan</asp:ListItem>
                                    <asp:ListItem>Jordan</asp:ListItem>
                                    <asp:ListItem>Kazakhstan</asp:ListItem>
                                    <asp:ListItem>Kenya</asp:ListItem>
                                    <asp:ListItem>Korea</asp:ListItem>
                                    <asp:ListItem>Kuwait</asp:ListItem>
                                    <asp:ListItem>Lebanon</asp:ListItem>
                                    <asp:ListItem>Liberia</asp:ListItem>
                                    <asp:ListItem>Libya</asp:ListItem>
                                    <asp:ListItem>Macedonia</asp:ListItem>
                                    <asp:ListItem>Madagascar</asp:ListItem>
                                    <asp:ListItem>Malaysia</asp:ListItem>
                                    <asp:ListItem>Maldives</asp:ListItem>
                                    <asp:ListItem>Mauritius</asp:ListItem>
                                    <asp:ListItem>Mexico</asp:ListItem>
                                    <asp:ListItem>Mongolia</asp:ListItem>
                                    <asp:ListItem>Morocco</asp:ListItem>
                                    <asp:ListItem>Myanmar</asp:ListItem>
                                    <asp:ListItem>Namibia</asp:ListItem>
                                    <asp:ListItem>Nepal</asp:ListItem>
                                    <asp:ListItem>Netherlands</asp:ListItem>
                                    <asp:ListItem>New Zealand</asp:ListItem>
                                    <asp:ListItem>Nigeria</asp:ListItem>
                                    <asp:ListItem>Norway</asp:ListItem>
                                    <asp:ListItem>Oman</asp:ListItem>
                                    <asp:ListItem>Pakistan</asp:ListItem>
                                    <asp:ListItem>Palestine</asp:ListItem>
                                    <asp:ListItem>Panama</asp:ListItem>
                                    <asp:ListItem>Paraguay</asp:ListItem>
                                    <asp:ListItem>Peru</asp:ListItem>
                                    <asp:ListItem>Philippines</asp:ListItem>
                                    <asp:ListItem>Poland</asp:ListItem>
                                    <asp:ListItem>Portugal</asp:ListItem>
                                    <asp:ListItem>Qatar</asp:ListItem>
                                    <asp:ListItem>Romania</asp:ListItem>
                                    <asp:ListItem>Russia</asp:ListItem>
                                    <asp:ListItem>Saudi Arabia</asp:ListItem>
                                    <asp:ListItem>Scotland</asp:ListItem>
                                    <asp:ListItem>Seychelles</asp:ListItem>
                                    <asp:ListItem>Singapore</asp:ListItem>
                                    <asp:ListItem>Somalia</asp:ListItem>
                                    <asp:ListItem>South Africa</asp:ListItem>
                                    <asp:ListItem>Spain</asp:ListItem>
                                    <asp:ListItem>Sri Lanka</asp:ListItem>
                                    <asp:ListItem>Sudan</asp:ListItem>
                                    <asp:ListItem>Sweden</asp:ListItem>
                                    <asp:ListItem>Switzerland</asp:ListItem>
                                    <asp:ListItem>Syria</asp:ListItem>
                                    <asp:ListItem>Taiwan</asp:ListItem>
                                    <asp:ListItem>Tanzania</asp:ListItem>
                                    <asp:ListItem>Thailand</asp:ListItem>
                                    <asp:ListItem>Trinidad and Tobago</asp:ListItem>
                                    <asp:ListItem>Turkey</asp:ListItem>
                                    <asp:ListItem>Uganda</asp:ListItem>
                                    <asp:ListItem>Ukraine</asp:ListItem>
                                    <asp:ListItem>United Arab Emirates</asp:ListItem>
                                    <asp:ListItem>United Kingdom</asp:ListItem>
                                    <asp:ListItem>United States of America</asp:ListItem>
                                    <asp:ListItem>Uruguay</asp:ListItem>
                                    <asp:ListItem>Uzbekistan</asp:ListItem>
                                    <asp:ListItem>Vatican City</asp:ListItem>
                                    <asp:ListItem>Venezuela</asp:ListItem>
                                    <asp:ListItem>Vietnam</asp:ListItem>
                                    <asp:ListItem>Yemen</asp:ListItem>
                                    <asp:ListItem>Zambia</asp:ListItem>
                                    <asp:ListItem>Zimbabwe</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>

                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="AddCountry" InitialValue="0" SetFocusOnError="True"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>

                            </div>
                            <div class="col-md-3">
                                Phone No.:
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AddPhone" runat="server" Width="90%" CssClass="style8" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <span style="color: #F00" class="style10">*</span><span
                                    class="style8">Mobile No.:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AddMobile" runat="server" Width="90%" CssClass="style8" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
                                    ControlToValidate="AddMobile" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3">
                                <span style="color: #F00"
                                    class="style10">*</span><span class="style8">Primary Email:</span>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AddEmail" runat="server" Width="90%" CssClass="style8" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server"
                                    ControlToValidate="AddEmail" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" ValidationGroup="main" CssClass="style8"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                Alternate Email:

                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AddAlterEmail" runat="server" Width="90%" CssClass="style8" />
                            </div>
                            <div class="col-md-3">
                                &nbsp; 

                            </div>
                            <div class="col-md-3">
                                &nbsp; 

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <hr>
                            </div>
                        </div>
                    </div>
                    <div class="well">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 align="left">Documents </h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <span style="color: #F00" class="style8">*</span><span
                                    class="style8">Upload Photo (jpg,jpeg,png,gif) Size &lt;=10MB</span>
                            </div>
                            <div class="col-md-6"><span style="color: #F00" class="style8">*</span>Upload Resume (doc,docx,pdf) Size &lt;=10MB</div>
                        </div>
                        <div class="row">

                            <div class="col-md-6">
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="style9" />
                                <asp:Button runat="server" ID="Button8" Text="Upload" OnClick="UploadButton_Click"
                                    CssClass="style9" />
                                <br class="style8" />
                                <br class="style8" />
                                <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " CssClass="style8" />

                            </div>
                            <div class="col-md-6">
                                <asp:FileUpload ID="FileUploadControl" runat="server" CssClass="style9" />
                                <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click2"
                                    CssClass="style9" />
                                <br class="style8" />
                                <br class="style8" />
                                <asp:Label runat="server" ID="StatusLabel2" Text="Upload status: " CssClass="style8" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div align="center">
                                    <asp:Button runat="server" ID="submitBtn" Text="Submit"
                                        Style="background: #005d9a; color: #ffffff; font-family: Georgia; font-size: medium; font-weight: 700;"
                                        heigth="180px" Width="250px" Height="60px" OnClick="submitBtn_Click"
                                        CausesValidation="true" ValidationGroup="main" />
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>


    </div>

</asp:Content>
