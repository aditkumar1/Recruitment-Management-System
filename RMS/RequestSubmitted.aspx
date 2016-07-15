<%@ Page Title="" Language="C#" MasterPageFile="~/rms.Master" AutoEventWireup="true" CodeBehind="RequestSubmitted.aspx.cs" Inherits="RMS.RequestSubmitted" %>

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
    <div class="well" style=" min-height: 100% !important; height: 100% !important;">
        <div class="container">

            <div class="row">
                <div class="col-md-12 alert alert-success">
                    Your request has been successfully submited. Our HR will contact you shortly.                  
                </div>
            </div>
        </div>
    </div>

</asp:Content>
